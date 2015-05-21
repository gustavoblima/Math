[n m]=size(meas)
for I=1:n,
    if meas(I,3)<2.5
        J=0;
        J=J+1;
        CM = meas(I,:)==  meas(:,J);
    end
end


%testes 2

[n m]=size(meas)
for I=1:n,
    if meas(I,3)<2.5
        J=0;
        J=J+1;
        CM = meas(:,J);
    end
end
%teste 3

J=0;
 [n m]=size(meas)
for i=1:n
    if meas(i,3)>5.5
        J=J+1;
    CMaior1= meas(i,:);
    end
end

%teste 4


 [n m]=size(meas)
for I=1:n,
    if meas(I,3)<2.5
        CM = meas(:,I);
    end
end

%Teste 5

J=0;
 [n m]=size(meas)
for I=1:n,
    if meas(I,3)>5.5
        J=J+1;
        CMaior = find (meas==n);
    end
end

%Teste 6

j=0;
 [n m]=size(meas)
for i=1:n
if meas(i,3)>5.5
    j=j+1;
CMaior = [meas(i,:),meas(:,j)]
end
end

%Teste 7
CMaior = zeros(150,1);
J=0;
 [n m]=size(meas)
for i=1:n
    if meas(i,3)>5.5
        J=J+1;
    CMaior1= meas(i,:);
    end
end

        
    