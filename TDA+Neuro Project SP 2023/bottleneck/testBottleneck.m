D1 = [0,1; 1,4]; % a persistence diagram with two points: (0,1) and (1,4);
D2 = [0,0]; % a persistence diagram with one diagonal point (0,0)
D3 = [2,3; 0,5]; % a persistence diagram with two points: (2,3) and (0,5);

tic, distBottleneckBarcodes(D1,D2), toc
tic, distBottleneckBarcodes(D2,D3), toc
tic, distBottleneckBarcodes(D1,D3), toc

%% Now let's see how long it takes to compute dB for larger persistence diagrams

% generate random PDs
PD1 = rand(300,2);
PD1(:,2) = PD1(:,1) + PD1(:,2); % do this so that death >= birth;

PD2 = rand(400,2);
PD2(:,2) = PD2(:,1) + PD2(:,2); % do this so that death >= birth;
tic, distBottleneckBarcodes(PD1,PD2), toc


