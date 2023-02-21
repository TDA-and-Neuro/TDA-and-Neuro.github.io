% test subsampling the cat
addpath ../util
C1 = load('../nonrigid3d/cat1.mat');
C1_pc = [C1.surface.X, C1.surface.Y,C1.surface.Z];
NC1 = length(C1_pc) 

N = 200;
I = px_fps(C1_pc','vector',N,'n');
disp('made it to here')

%% viz C1  pre and post subsampling
figure
scatter3(C1_pc(:,1),C1_pc(:,2),C1_pc(:,3),10)
hold on
scatter3(C1_pc(I,1),C1_pc(I,2),C1_pc(I,3),100,'filled')

%% calculate geodesic distance martrix on C1
% first induce a graph from the triangulation
GC1 = buildGraph(C1.surface);

% now compute the distance matrix for the FPS points 
dC1 = distances(graph(GC1),I,I);

% show scatter plot colored by distance to point wirh index 1
figure
scatter3(C1_pc(I,1),C1_pc(I,2),C1_pc(I,3),100,dC1(1,:),'filled')