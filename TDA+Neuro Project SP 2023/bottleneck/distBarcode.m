 function [dm, bXo, bYo] = distBarcode(bX,bY)
 % Facundo Memoli 2012

nX = size(bX,1);
nY = size(bY,1);

% find projected bX and bY
pbX = mean(bX,2)*ones(1,2);
pbY = mean(bY,2)*ones(1,2);

bX;
bY;

% add them up
bX = [bX;pbY];
bY = [bY;pbX];

n = nX+nY;
dm = zeros(n,n);

for i=1:n
    pi = bX(i,:);
    for j=1:n
        pj = bY(j,:);
        dinf = max(abs(pi-pj));
        ddiag = max((pi(2)-pi(1))/(2), (pj(2)-pj(1))/(2));
        dm(i,j) = min(dinf,ddiag);
    end
end
        
bXo = bX;
bYo = bY;
