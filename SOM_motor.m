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
% %####---NUMEROS ALEATORIOS---####
% %A = randi(150,150,1)
% ind = randperm(size(X,1))
% X = X(ind,:);
% % TESTE
% Xt(1:70,:);
% %TREINAMENTO
% X = X(1:224,:);
% [n m]= size(X)
%%

result=0;
epoca=100;
ciclo=0;
alpha = 0.02;
vizFn = 1;
%Ui=min(u)
[n m]= size(X);
[o p]= size(w);
t= n;
tmax = n*epoca
%%
for k=1:epoca
    for i=1:n
        for j=1:o
            u(j)=0;
            u(j)=sqrt(((w(j,1)-X(i,1))^2)+((w(j,2)-X(i,2))^2)); %+((w(j,3)-X(i,4))^2)+((w(j,5)-X(i,5))^2)+((w(j,6)-X(i,6))^2))
        end
        [C,c] = min(u);
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
%                 disp('result is 1');
               w(1,1)=w(1,1)+(alpha*(X(i,1)-w(1,1)));
                w(1,2)=w(1,2)+(alpha*(X(i,2)-w(1,2)));
                
                w(2,1)=w(2,1)+(alpha*vizFn*(X(i,1)-w(2,1)));
                w(2,2)=w(2,2)+(alpha*vizFn*(X(i,2)-w(2,2)));
                
                w(4,1)=w(4,1)+(alpha*vizFn*(X(i,1)-w(4,1)));
                w(4,2)=w(4,2)+(alpha*vizFn*(X(i,2)-w(4,2)));
                
                w(5,1)=w(5,1)+(alpha*vizFn*(X(i,1)-w(5,1)));
                w(5,2)=w(5,2)+(alpha*vizFn*(X(i,2)-w(5,2)));
                pause (0.01);
                pj(i,1)=sqrt(((w(1,1)-X(i,1))^2)+((w(1,2)-X(i,2))^2));
            case 2
%                 disp('result is 2');
               w(2,1)=w(2,1)+(alpha*(X(i,1)-w(2,1)));
                w(2,2)=w(2,2)+(alpha*(X(i,2)-w(2,2)));
                
                w(1,1)=w(1,1)+(alpha*vizFn*(X(i,1)-w(1,1)));
                w(1,2)=w(1,2)+(alpha*vizFn*(X(i,2)-w(1,2)));
                
                w(3,1)=w(3,1)+(alpha*vizFn*(X(i,1)-w(3,1)));
                w(3,2)=w(3,2)+(alpha*vizFn*(X(i,2)-w(3,2)));
                
%                 w(4,1)=w(4,1)+(alpha*vizFn*(X(i,1)-w(4,1)));
%                 w(4,2)=w(4,2)+(alpha*vizFn*(X(i,2)-w(4,2)));
                
                w(5,1)=w(5,1)+(alpha*vizFn*(X(i,1)-w(5,1)));
                w(5,2)=w(5,2)+(alpha*vizFn*(X(i,2)-w(5,2)));
                
%                 w(6,1)=w(6,1)+(alpha*vizFn*(X(i,1)-w(6,1)));
%                 w(6,2)=w(6,2)+(alpha*vizFn*(X(i,2)-w(6,2)));
                pause (0.01);
                pj(i,1)=sqrt(((w(2,1)-X(i,1))^2)+((w(2,2)-X(i,2))^2));
            case 3
%                 disp('result is 3');
               w(3,1)=w(3,1)+(alpha*(X(i,1)-w(3,1)));
                w(3,2)=w(3,2)+(alpha*(X(i,2)-w(3,2)));
                
                w(2,1)=w(2,1)+(alpha*vizFn*(X(i,1)-w(2,1)));
                w(2,2)=w(2,2)+(alpha*vizFn*(X(i,2)-w(2,2)));
                
                w(5,1)=w(5,1)+(alpha*vizFn*(X(i,1)-w(5,1)));
                w(5,2)=w(5,2)+(alpha*vizFn*(X(i,2)-w(5,2)));
                
                w(6,1)=w(6,1)+(alpha*vizFn*(X(i,1)-w(6,1)));
                w(6,2)=w(6,2)+(alpha*vizFn*(X(i,2)-w(6,2)));
                
                pause(0.01);
                pj(i,1)=sqrt(((w(3,1)-X(i,1))^2)+((w(3,2)-X(i,2))^2));
            case 4
%                 disp('result is 4')
              w(4,1)=w(4,1)+(alpha*(X(i,1)-w(4,1)));
                w(4,2)=w(4,2)+(alpha*(X(i,2)-w(4,2)));
                w(1,1)=w(1,1)+(alpha*vizFn*(X(i,1)-w(1,1)));
                w(1,2)=w(1,2)+(alpha*vizFn*(X(i,2)-w(1,2)));
                w(5,1)=w(5,1)+(alpha*vizFn*(X(i,1)-w(5,1)));
                w(5,2)=w(5,2)+(alpha*vizFn*(X(i,2)-w(5,2)));
%                 w(2,1)=w(2,1)+(alpha*vizFn*(X(i,1)-w(2,1)));
%                 w(2,2)=w(2,2)+(alpha*vizFn*(X(i,2)-w(2,2)));
                w(7,1)=w(7,1)+(alpha*vizFn*(X(i,1)-w(7,1)));
                w(7,2)=w(7,2)+(alpha*vizFn*(X(i,2)-w(7,2)));
%                 w(8,1)=w(8,1)+(alpha*vizFn*(X(i,1)-w(8,1)));
%                 w(8,2)=w(8,2)+(alpha*vizFn*(X(i,2)-w(8,2)));
                pause(0.01);
                pj(i,1)=sqrt(((w(4,1)-X(i,1))^2)+((w(4,2)-X(i,2))^2));
            case 5
%                 disp('result is 5');
              w(5,1)=w(5,1)+(alpha*(X(i,1)-w(5,1)));
                w(5,2)=w(5,2)+(alpha*(X(i,2)-w(5,2)));
%                 w(1,1)=w(1,1)+(alpha*vizFn*(X(i,1)-w(1,1)));
%                 w(1,2)=w(1,2)+(alpha*vizFn*(X(i,2)-w(1,2)));
                w(2,1)=w(2,1)+(alpha*vizFn*(X(i,1)-w(2,1)));
                w(2,2)=w(2,2)+(alpha*vizFn*(X(i,2)-w(2,2)));
%                 w(3,1)=w(3,1)+(alpha*vizFn*(X(i,1)-w(3,1)));
%                 w(3,2)=w(3,2)+(alpha*vizFn*(X(i,2)-w(3,2)));
                w(4,1)=w(4,1)+(alpha*vizFn*(X(i,1)-w(4,1)));
                w(4,2)=w(4,2)+(alpha*vizFn*(X(i,2)-w(4,2)));
                w(6,1)=w(6,1)+(alpha*vizFn*(X(i,1)-w(6,1)));
                w(6,2)=w(6,2)+(alpha*vizFn*(X(i,2)-w(6,2)));
%                 w(7,1)=w(7,1)+(alpha*vizFn*(X(i,1)-w(7,1)));
%                 w(7,2)=w(7,2)+(alpha*vizFn*(X(i,2)-w(7,2)));
                w(8,1)=w(8,1)+(alpha*vizFn*(X(i,1)-w(8,1)));
                w(8,2)=w(8,2)+(alpha*vizFn*(X(i,2)-w(8,2)));
%                 w(9,1)=w(9,1)+(alpha*vizFn*(X(i,1)-w(9,1)));
%                 w(9,2)=w(9,2)+(alpha*vizFn*(X(i,2)-w(9,2)));
                pause(0.01);
                % pj(i,1)=sqrt(((w(5,1)-X(i,1))^2)+((w(5,2)-X(i,2))^2));
            case 6
%                 disp('result is 6')
                 w(6,1)=w(6,1)+(alpha*vizFn*(X(i,1)-w(6,1)));
                w(6,2)=w(6,2)+(alpha*vizFn*(X(i,2)-w(6,2)));
%                 w(2,1)=w(2,1)+(alpha*vizFn*(X(i,1)-w(2,1)));
%                 w(2,2)=w(2,2)+(alpha*vizFn*(X(i,2)-w(2,2)));
                w(3,1)=w(3,1)+(alpha*vizFn*(X(i,1)-w(3,1)));
                w(3,2)=w(3,2)+(alpha*vizFn*(X(i,2)-w(3,2)));
                w(5,1)=w(5,1)+(alpha*vizFn*(X(i,1)-w(5,1)));
                w(5,2)=w(5,2)+(alpha*vizFn*(X(i,2)-w(5,2)));
%                 w(8,1)=w(8,1)+(alpha*vizFn*(X(i,1)-w(8,1)));
%                 w(8,2)=w(8,2)+(alpha*vizFn*(X(i,2)-w(8,2)));
                w(8,1)=w(8,1)+(alpha*vizFn*(X(i,1)-w(8,1)));
                w(8,2)=w(8,2)+(alpha*vizFn*(X(i,2)-w(8,2)));
                pause(0.01);
                 pj(i,1)=sqrt(((w(6,1)-X(i,1))^2)+((w(6,2)-X(i,2))^2));
            case 7
                %                 disp('result is 7');
                w(7,1)=w(7,1)+(alpha*(X(i,1)-w(7,1)));
                w(7,2)=w(7,2)+(alpha*(X(i,2)-w(7,2)));
                w(4,1)=w(4,1)+(alpha*vizFn*(X(i,1)-w(4,1)));
                w(4,2)=w(4,2)+(alpha*vizFn*(X(i,2)-w(4,2)));
                w(5,1)=w(5,1)+(alpha*vizFn*(X(i,1)-w(5,1)));
                w(5,2)=w(5,2)+(alpha*vizFn*(X(i,2)-w(5,2)));
                w(8,1)=w(8,1)+(alpha*vizFn*(X(i,1)-w(8,1)));
                w(8,2)=w(8,2)+(alpha*vizFn*(X(i,2)-w(8,2)));
                pause(0.01);
                pj(i,1)=sqrt(((w(7,1)-X(i,1))^2)+((w(7,2)-X(i,2))^2));
            case 8
%                 disp('result is 8');
               w(8,1)=w(8,1)+(alpha*(X(i,1)-w(8,1)));
                w(8,2)=w(8,2)+(alpha*(X(i,2)-w(8,2)));
                w(7,1)=w(7,1)+(alpha*vizFn*(X(i,1)-w(7,1)));
                w(7,2)=w(7,2)+(alpha*vizFn*(X(i,2)-w(7,2)));
%                 w(4,1)=w(4,1)+(alpha*vizFn*(X(i,1)-w(4,1)));
%                 w(4,2)=w(4,2)+(alpha*vizFn*(X(i,2)-w(4,2)));
                w(5,1)=w(5,1)+(alpha*vizFn*(X(i,1)-w(5,1)));
                w(5,2)=w(5,2)+(alpha*vizFn*(X(i,2)-w(5,2)));
%                 w(6,1)=w(6,1)+(alpha*vizFn*(X(i,1)-w(6,1)));
%                 w(6,2)=w(6,2)+(alpha*vizFn*(X(i,2)-w(6,2)));
                w(9,1)=w(9,1)+(alpha*vizFn*(X(i,1)-w(9,1)));
                w(9,2)=w(9,2)+(alpha*vizFn*(X(i,2)-w(9,2)));
                pause(0.01);
                 pj(i,1)=sqrt(((w(8,1)-X(i,1))^2)+((w(8,2)-X(i,2))^2));
            case 9
%                 disp('result is 9');
               w(9,1)=w(9,1)+(alpha*(X(i,1)-w(9,1)));
                w(9,2)=w(9,2)+(alpha*(X(i,2)-w(9,2)));
                w(5,1)=w(5,1)+(alpha*vizFn*(X(i,1)-w(5,1)));
                w(5,2)=w(5,2)+(alpha*vizFn*(X(i,2)-w(5,2)));
                w(6,1)=w(6,1)+(alpha*vizFn*(X(i,1)-w(6,1)));
                w(6,2)=w(6,2)+(alpha*vizFn*(X(i,2)-w(6,2)));
                w(8,1)=w(8,1)+(alpha*vizFn*(X(i,1)-w(8,1)));
                w(8,2)=w(8,2)+(alpha*vizFn*(X(i,2)-w(8,2)));
                pause(0.01);
                 pj(i,1)=sqrt(((w(9,1)-X(i,1))^2)+((w(9,2)-X(i,2))^2));
            otherwise
%                 disp('Resultado finalizado')
                
        end
        %set(h,'XData',w(:,1),'YData',w(:,2));
        %drawnow
       %  w = reshape(w,[3 3 2]);
%         hold off
%         xlabel('X1');
% ylabel('X2');
% gscatter(X(:,1),X(:,2),species);
% 
% title('Self-Organizing Map');
% 
%          hold on
%          som = plot(w(:,:,1), w(:,:,2),'ro',w(:,1,1),w(:,1,2),'k-',w(:,2,1), ...
%     w(:,2,2),'k-',w(:,3,1),w(:,3,2),'k-',w(1,:,1),w(1,:,2),'k-', ...
%     w(2,:,1),w(2,:,2),'k-',w(3,:,1),w(3,:,2),'k',0,0,'.',1,1,'.');
%    

        ciclo=ciclo+1;
        Error(k,1) = sum(pj)/n;
        ind = randperm(size(X,1));
        X = X(ind,:);
        if vizFn > 0
            vizFn= vizFn-0.0007
        else
            vizFn = 0;
        end
        %w = reshape(w,[9 2]);
    end
    disp('Epoca Atualizada')
        disp(k)
    alpha = alpha*(1-(i/tmax));
end
    
%%
%Plot Quantisation Error
%plot(Error);

filename = 'C:\Users\Claudia\Documents\MATLAB\SOM_x3\Tr_51.mat';
save(filename)
