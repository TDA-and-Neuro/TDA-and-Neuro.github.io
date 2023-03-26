% parameter for trimming barcodes: num of bars to retain
NP = 200;

% here we can select some classes out of the total (can be useful to reduce
% complexity). Uncomment the classes you want to consider
%info_cat = dir("../processed/*cat*.mat");
%info_dog = dir("../processed/*dog*.mat");
%info_gorilla = dir("../processed/*gorilla*.mat");
%info_michael = dir("../processed/*michael*.mat");
%info_david = dir("../processed/*david*.mat");
%info_victoria = dir("../processed/*victoria*.mat");
%info = [info_michael;info_david;info_victoria];

% uncomment this line if you want all classes
info = dir("../processed/*.mat");

num_shapes = length(info);

% We'll compute three dB matrices
dB0 = zeros(num_shapes);
dB1 = zeros(num_shapes);
dB2 = zeros(num_shapes);

for i=1:num_shapes
    % load the k-th file
    fi = info(i).folder;
    ni = info(i).name;
    disp(['Reading ' ni])
    si = load([fi '/' ni]);
    si = si.shape;
    
    for j=i+1: num_shapes
        fj = info(j).folder;
        nj = info(j).name;
        disp(['Reading ' nj])
        sj = load([fj '/' nj]);
        sj = sj.shape;
        
        % compute dB between 0-dim barcodes 
        PD0i = trimBarcode(si.PDs{1},NP);
        PD0j = trimBarcode(sj.PDs{1},NP);
        dB0(i,j) = distBottleneckBarcodes(PD0i,PD0j);
    end
    
    dB0 = max(dB0,dB0'); % symmetrize
    imagesc(dB0);title([num2str(i)]), axis square, colorbar, drawnow
end

writematrix(dB0, 'dB0_mat.csv')