%###############################################
%###############################################

clear all, clc
%----#SOM N-DIMENSIONAL#----
%A=importdata('data_ESPEC_1.mat')
load('data_ESPEC_1.mat')
%% SORTEIO E SEPARACAO DE DADOS
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
%w = ones(25,2)
pos = gridtop(5,5); plotsom(pos)
pos =pos'
%Normalizar o pos
for i = 1:2,
    mi = min(pos(:,i));
    ma = max(pos(:,i));
    pos(:,i) = (pos(:,i)-mi)/(ma-mi);
end
format long
e=1;
V=V'
while e<=1
    epoca=200;
    M =pos
    a = .1;
    viz = 1;
    [n m]= size(V);
    tmax = n*epoca
    Q = zeros(25,1);
    rate =0;
    J=0;
    I=0;
    Error=0;
    Er_epoca=0;
    for k=1:epoca
        for t=1:n
            ind = randperm(size(V,1));
            V = V(ind,:);
            X=V(1,:);
            for i=1:25
                Q(i,1) = norm(X(1,:) - M(i,:));
            end
            [C,c] = min(Q);
            
            M = reshape(M,[5 5 2]);
            X = reshape(X,[1 1 2]);
            ch = mod(c-1,5) + 1;
            cv = floor((c-1)/5) + 1;
            
            %coefv1= I/tmax;
                     coefv1= I/tmax;
                      viz= 1*(0.01/1)^coefv1;
            %           denom = 1 + I/tmax;
            %          %a = .1/denom;
            %            r = round(1/denom);
            % vizFn=1*exp(-viz);
            %
            I=I+1;
            
            if mod(t,50) == 0 % for every 50th input
                r = 1; % SOM neighborhood radius
            else
                r = 0; % k-means clustering step
            end
            %Coeficiente de Aprendizado
            
            %coef = 1 - J/tmax;
            coef = J/tmax;
            %a= a/(1+(t/tmax));
            a = 0.1*(0.001/0.1)^coef; % learning rate
            rate(t,1)= a;
            for h = max(1,ch-r):min(5,ch+r)
                for v = max(1,cv-r):min(5,cv+r)
                    M(h,v,:) = M(h,v,:) + a*(X(1,1,:) - M(h,v,:));
                end
            end
            
            
            %          hold off
            % %             xlabel('X1');
            % %     ylabel('X2');
%              plot(V(:,1),V(:,2),'.g')
%                   pause(0.1)
%                 title('Self-Organizing Map - GUSTAVO BLIMA');
%                  hold on
%                    M = reshape(M,[5 5 2]);
%                     som = plot(M(:,:,1), M(:,:,2),'ro',M(:,1,1),M(:,1,2),'b-',M(:,2,1), ...
%                     M(:,2,2),'b-',M(:,3,1),M(:,3,2),'b',M(:,4,1),M(:,4,2),'b-',M(1,:,1),M(1,:,2),'b-', ...
%                     M(2,:,1),M(2,:,2),'b-',M(3,:,1),M(3,:,2),'b',...
%                     M(:,5,1),M(:,5,2),'b-',M(5,:,1),M(5,:,2),'b-',...
%                     M(4,:,1), M(4,:,2),'b-',0,0,'.',1,1,'.');
%             
            
            M = reshape(M,[25 2]);
            X = reshape(X,[1 2]);
            J = J+1;
            
           
                Error(t,1) =  min(Q);
           
            rate(k,1)= a;    
        end
            Er_epoca(k,1)= mean(Error)
          disp('Treinamento...')
            disp('Epoca Atualizada')
            disp(k)
    end
        Erro_Tr_M(e,1)= mean(Er_epoca)
        e=e+1;
        beep
        filename = ['C:\Users\Claudia\Documents\MATLAB\SOMx5_Test\SOM_x5_Rand_Test', int2str(e), '.mat'];
        save(filename)
        disp('GustavoBlima')
end











%%

















%%

%%[dW, ls]=learnsom(w,p,[],[],a,[],[],[],[],d,lp,ls)
for t= 1:10
[dW, ls]=learnsom(w,p,[],[],a,[],[],[],[],d,lp,ls)
plotsompos(net,X)
end
meas = meas'
lp.order_lr = 0.2
lp.order_steps = 150
lp.tune_lr = 0.02
lp.tune_nd = 1
a = rand(9,1)
p = X
w = rand(9,2)
pos = gridtop(3,3); %plotsom(pos)
d = linkdist(pos)
plotsompos(net,meas)
ls = [];





