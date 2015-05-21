J=0;
CMM= zeros(150,1);
 [n m]=size(meas);
for i=1:n
    if meas(i,3)>5.5;
        J=J+1;
    CMM(i,1) = meas(i,3);
    elseif CMM==0;
      CMM=[];
    disp(CMM);
    end
end
%gscatter(CMM(i,1), CMM(i,1), species,'rgb','osd');
%xlabel('Largura da Setala');
%ylabel('Comprimento da Petala');
%K = size(meas,1);

%Exemplo de matriz 3x4;
%matriz = zeros(3,4);
%for i=1:3
%    for j=1:4
%        matriz(i,j)=i*j;
%    end
%end



CM

[n m]=size(meas);
J=0;
for I=1:n,
    if (meas(I,3)>4.75) && (meas(I,3)<5.15)
        J=J+1;
        NC(J,:)=meas(I,:);
        especiesNC(J)=species(I);
    end
end

