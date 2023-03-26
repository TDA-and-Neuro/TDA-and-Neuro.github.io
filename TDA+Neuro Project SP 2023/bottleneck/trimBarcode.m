% NP is a positive ineter. The output barcode will only contain the top NP
% bars in bX in terms of length

function bXt = trimBarcode(bX,NP)
% Facundo Memoli 2020

pers = bX(:,2) - bX(:,1);
[aa bb] = sort(pers,'descend');
I = bb(1:min(end,NP));
bXt = bX(I,:); % could be empty so I'll add point (0,0)
bXt = [bXt; 0 0];
