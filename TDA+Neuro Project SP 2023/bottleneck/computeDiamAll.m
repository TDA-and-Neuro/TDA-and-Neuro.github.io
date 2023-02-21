% We can select some classes out of the total (can be useful to reduce
% complexity). Uncomment specific classes you want to consider
info_cat = dir("../processed/*cat*.mat");
info_dog = dir("../processed/*dog*.mat");
info_gorilla = dir("../processed/*gorilla*.mat");
info_michael = dir("../processed/*michael*.mat");

% To only use select classes, uncomment the following appropriate line:
%info = [info_cat; info_dog; info_gorilla; info_michael];


% uncomment/comment out this line if you/don't want all classes
info = dir("../processed/*.mat");


num_shapes = length(info);

dDiam = zeros(num_shapes);
diams = zeros(num_shapes,1);

for i=1:num_shapes
    % load the k-th file
    fi = info(i).folder;
    ni = info(i).name;
    disp(['Reading ' ni])
    si = load([fi '/' ni]);
    si = si.shape;
    % diameter
    diami = max(si.dm(:));
    diams(i) = diami;
    
    for j=i+1: num_shapes
        fj = info(j).folder;
        nj = info(j).name;
        disp(['Reading ' nj])
        sj = load([fj '/' nj]);
        sj = sj.shape;

        
        % diameter
        diamj = max(sj.dm(:));
        
        % compute dDiam 
        dDiam(i,j) = abs(max(sj.dm(:))-max(si.dm(:)));
        
    end
    
   
    %symmetrize
    dDiam = max(dDiam, dDiam'); 
    % visualize
    imagesc(dDiam);title([num2str(i)]), axis square, colorbar, drawnow
end

