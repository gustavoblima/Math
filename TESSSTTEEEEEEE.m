clear all, clc    G=[]
load fisheriris
 V= meas(:,1:2)
   V = [1 1; 2 2]
   s= RandStream('mt19937ar','seed',0))
    s= RandStream('mrg32k3a','seed',sum(10*clock))
   RandStream.setDefaultStream,s)
      G = randperm(s,10,1)
        G=G'
%ind = randperm(size(V,1))
            X = V(ind,:)
            X=X(1,:)
            Xr(1,1:2)= X
            if Xr(:,1:2) ~= X
                X=X(1,:)
            else
                ind = randperm(size(V,1))
            X = V(ind,:)
            X=X(1,:)
             Xr(3,1:2)= X
            end