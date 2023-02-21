% Parameters
NFPS = 200; %number of points that we'll subsample from each shape


% read all the .mat files and retain the labels
addpath ../util/
addpath ../Math412S2017/
addpath ../Math412S2017/ripser/

info = dir("../nonrigid3d/*.mat");
num_shapes = length(info);

for k=1:num_shapes
    % load the k-th file
    fk = info(k).folder;
    nk = info(k).name;
    disp(['Processing ' nk])
    shapek = load([fk '/' nk]);
    shapek = shapek.surface;
    
    % build a graph out of the triangulation
    Gk = buildGraph(shapek);
    
    % find largest connected component of the graph (some points can be
    % disconnected)
    [aa bb] = conncomp(graph(Gk),'OutputForm','cell');
    
    disp(['There are ' num2str(bb(1)) ' points in the largest connected component'])
    Jk = aa{1};
    
    % get the point cloud
    Pk =  [shapek.X, shapek.Y, shapek.Z];
    
    % retain only points in largest component of the graph
    Pk = Pk(Jk,:);
    Gk = Gk(Jk,Jk);
    
    % apply FPS
    Ik = px_fps(Pk','vector',NFPS,'n');
    
    % compute the geodesic distance matrix
    dk = distances(graph(Gk),Ik,Ik);
    
    % now compute the barcodes up to dimension 2; (need this 'cd' trick)
    cd ../Math412S2017/
    PDk = RipsFiltrationDM(dk,2,max(dk(:)));
    cd ../preprocessing/
    
    % now save the result
    shape.name = nk;
    shape.dm = dk;
    shape.I = Ik;
    shape.PDs = PDk;
    shape.G = Gk;
    shape.J = Jk;
    
    nok = ['pre_' nk];
    save(['../processed/' nok],'shape');
end