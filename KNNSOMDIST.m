dist= pdist2(X(:,1:6),M)

[posicoes,~]=sort(dist)

dist2= pdist2(Xt(2,1:6),M)

[~,posicoes]= sort(dist2)