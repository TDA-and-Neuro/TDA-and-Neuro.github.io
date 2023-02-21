function G = buildGraph(surface)
nT = length(surface.TRIV);
nV = length(surface.X);

P = [surface.X surface.Y surface.Z];

G = sparse(nV,nV);

for k=1:nT
    ak = surface.TRIV(k,1);
    bk = surface.TRIV(k,2);
    ck = surface.TRIV(k,3);
     
    G(ak,bk) = 1;
    G(ak,ck) = 1;
    G(bk,ck) = 1;
end

% symmetrize
G = max(G,G');

% apply the weights
dE = L2_distance(P',P');
G = G.*dE;
