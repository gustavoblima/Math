clear all, clc
%----#SOM N-DIMENSIONAL#----
%A=importdata('data_ESPEC_1.mat')
load('data_ESPEC_1.mat')
%%
% SF = data1(1:42,:);
% %Sem Falhas
% SF(:,7) = 0;
% 
% Aimp = data1(43:168,:);
% %Alta Impedancia
% Aimp(1:42,7) = 1;
% Aimp(43:84,7) = 2;
% Aimp(85:126,7) = 3;
% 
% Bimp = data1(169:294,:);
% %Baixa Impedancia
% Bimp(1:42,7) = 4;
% Bimp(43:84,7) = 5;
% Bimp(85:126,7) = 6;

%@Conjunto Inteiro
X = data1';
%@Conjunto Inteiro rotulando;
X(1:42,7) = 0;
X(43:84,7) = 1;
X(85:126,7) = 2;
X(127:168,7) = 3;
X(169:210,7) = 4;
X(211:252,7) = 5;
X(253:294,7) = 6;
%%
%Separar Dados Aleatórios
%EMBARALHAR DADOS DE CADA CLASSE DO MOTOR
%Sem falhas
SF = X(1:42,:);
indSF = randperm(size(SF,1));
SF = SF(indSF,:);
%Alta Imp 1
A1 = X(43:84,:);
indA1 = randperm(size(A1,1));
A1 = A1(indA1,:);
%Alta Imp 2
A2 = X(85:126,:);
indA2 = randperm(size(A2,1));
A2 = A2(indA2,:);
%Alta Imp 3
A3 = X(127:168,:);
indA3 = randperm(size(A3,1));
A3 = A3(indA3,:);
%Baixa Imp 1
B1 = X(169:210,:);
indB1 = randperm(size(B1,1));
B1 = B1(indB1,:);
%Baixa Imp 2
B2 = X(211:252,:);
indB2 = randperm(size(B2,1));
B2 = B2(indB2,:);
%Baixa Imp 3
B3 = X(253:294,:);
indB3 = randperm(size(B3,1));
B3 = B3(indB3,:);

% Juntando Matriz com valores aleatorios 
% TREINAMENTO
X = SF(1:32,:);
X(33:64,:) = A1(1:32,:);
X(65:96,:) = A2(1:32,:);
X(97:128,:) = A3(1:32,:);
X(129:160,:) = B1(1:32,:);
X(161:192,:) = B2(1:32,:);
X(193:224,:) = B3(1:32,:);

% TESTE

Xt = SF(33:42,:);
Xt(11:20,:) = A1(33:42,:);
Xt(21:30,:) = A2(33:42,:);
Xt(31:40,:) = A3(33:42,:);
Xt(41:50,:) = B1(33:42,:);
Xt(51:60,:) = B2(33:42,:);
Xt(61:70,:) = B3(33:42,:);
%%
%----Calculo da média dos Valores-----
% M_SF = mean(SF(:,1:6));
% M_Aimp = mean(Aimp(:,1:6));
% M_Bimp = mean(Bimp(:,1:6));

%@Conjunto Inteiro média
M_X = mean(X(:,1:6));

%%
%-----Vetor de Peso-----

w = [M_X(1,1) M_X(1,2);M_X(1,3) M_X(1,4);M_X(1,5) M_X(1,6);...
    M_X(1,1) M_X(1,2);M_X(1,3) M_X(1,4);M_X(1,5) M_X(1,6);...
    M_X(1,1) M_X(1,2);M_X(1,3) M_X(1,4);M_X(1,5) M_X(1,6)];
%%
result=0;
epoca=100;
ciclo=0;
alpha = 0.01
vizFn = 1
%Ui=min(u)
[n m]= size(X)
[o p]= size(w)
t= n
tmax = n*epoca
%%
%Teste SOM Vizinhança;
for k=1:epoca
    for i=1:n
        for j=1:o
            u(j)=0;
            u(j)=sqrt(((w(j,1)-X(i,1))^2)+((w(j,2)-X(i,2))^2)); %+((w(j,3)-X(i,4))^2)+((w(j,5)-X(i,5))^2)+((w(j,6)-X(i,6))^2))
        end
        
        if u(1,1) == min(u)
            result=1;
        elseif u(1,2) == min(u)
            result=2;
        elseif u(1,3) == min(u)
            result=3;
        elseif u(1,4) == min(u)
            result=4;
        elseif u(1,5) == min(u)
            result=5;
        elseif u(1,6) == min(u)
            result=6;
        elseif u(1,7) == min(u)
            result=7;
        elseif u(1,8) == min(u)
            result=8;
        elseif u(1,9) == min(u)
            result=9;
        end
        
        switch(result)
            case 1
                disp('result is 1')
                w(1,1)=w(1,1)+(alpha*(X(i,1)-w(1,1)));
                w(1,2)=w(1,2)+(alpha*(X(i,2)-w(1,2)));
                
                
                I-1  J-1,J,J+1
                I   J-1, J+1
                I+1 J-1,J,J+1
                
                for I=1:9
                    for J=1:2
                        w(I,J)=w(I,J)+(alpha*(X(i,1)-w(I,J)));
                    end
                end
                
                w(2,1)=w(2,1)+(alpha*vizFn*(X(i,1)-w(2,1)));
                w(2,2)=w(2,2)+(alpha*vizFn*(X(i,2)-w(2,2)));
                
                w(4,1)=w(4,1)+(alpha*vizFn*(X(i,1)-w(4,1)));
                w(4,2)=w(4,2)+(alpha*vizFn*(X(i,2)-w(4,2)));
            case 2
                disp('result is 2')
            case 3
                disp('result is 3')
            case 4
                disp('result is 4')
            case 5
                disp('result is 5')
            case 6
                disp('result is 6')
            case 7
                disp('result is 7')
            case 8
                disp('result is 8')
            case 9
                disp('result is 9')
            otherwise
                disp('Resultado finalizado')
                
        end
    end
end
