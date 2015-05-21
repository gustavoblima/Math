%% SCRIPT MATLAB SELF-ORGANIZING MAP NETWORK
clear all, clc
format long
pos = hextop(8,8);
D = linkdist(pos);
%------------------------------
%ind = D(1,:) <= 1
%M(:,ind)
%------------------------------
load('data_ESPEC_1.mat')

%@Conjunto Inteiro
V = data1';
%@Conjunto Inteiro rotulando;
V(1:42,7) = 0;
V(43:84,7) = 1;
V(85:126,7) = 1;
V(127:168,7) = 1;
V(169:210,7) = 2;
V(211:252,7) = 2;
V(253:294,7) = 2;
%%
%Separar Dados Aleatórios
%EMBARALHAR DADOS DE CADA CLASSE DO MOTOR
%Sem falhas
SF = V(1:42,:);
indSF = randperm(size(SF,1));
SF = SF(indSF,:);
%Alta Imp 1
A1 = V(43:84,:);
indA1 = randperm(size(A1,1));
A1 = A1(indA1,:);
%Alta Imp 2
A2 = V(85:126,:);
indA2 = randperm(size(A2,1));
A2 = A2(indA2,:);
%Alta Imp 3
A3 = V(127:168,:);
indA3 = randperm(size(A3,1));
A3 = A3(indA3,:);
%Baixa Imp 1
B1 = V(169:210,:);
indB1 = randperm(size(B1,1));
B1 = B1(indB1,:);
%Baixa Imp 2
B2 = V(211:252,:);
indB2 = randperm(size(B2,1));
B2 = B2(indB2,:);
%Baixa Imp 3
B3 = V(253:294,:);
indB3 = randperm(size(B3,1));
B3 = B3(indB3,:);

% Juntando Matriz com valores aleatorios 
% TREINAMENTO
V = SF(1:32,:);
V(33:64,:) = A1(1:32,:);
V(65:96,:) = A2(1:32,:);
V(97:128,:) = A3(1:32,:);
V(129:160,:) = B1(1:32,:);
V(161:192,:) = B2(1:32,:);
V(193:224,:) = B3(1:32,:);

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
e=1;
%Quantidade de treinamentos variavel "e"
while e<=1
    %@Conjunto Inteiro média
    M_X = mean(V(:,1:6));
    % Numero de neuronios
    for q=1:64
    M(q,1:6) = [M_X(1,1) M_X(1,2) M_X(1,3) M_X(1,4) M_X(1,5) M_X(1,6)];  
    end
    
    epoca=400;
    a = .2;
    [n m]= size(V);
    tmax = n*epoca
    Q = zeros(64,1);
    rate =0;
    Er=0;
    erro=[];
    J=0;
    I=0;
    ind = randperm(size(V,1));
    p_v = V(ind,1:6);
    
    %pdist2(x,M)
    for k=1:epoca,
        for t=1:n,
            X=p_v(t,1:6);
            %Calculo da distancia
            Q = pdist2(X,M);
            Q=Q';
            [C,c] = min(Q);
            %Separa o indice do valor minimo na matrix Q
            in2 = Q(:,1) == min(Q);
            %Pega indice achado acima e atualiza na matrix de Distancia na
            %respectiva linha do neuronio vencedor.
            win = D(:,in2);
            %Pega o indice da linha e verifica a vizinhança menor ou igual a 1
            %entao atualiza os respectivos neuronios;
            ind2 = win(:,1) <= 1;
            %Busca os valores dos indices
            viz = find(ind2);
            
            %erro de quantização
            inWin = find(M(:,1)) == c;
            W =M(inWin,:);
            erro(t,1) = sum(X(1,:)-W(1,:)).^2;
            
            [z f]=size(viz);
            %Atualizando valores dos Neuronios
            for j=1:z,
                M(viz(j),1)=M(viz(j),1)+(a*(X(1,1)-M(viz(j),1)));
                M(viz(j),2)=M(viz(j),2)+(a*(X(1,2)-M(viz(j),2)));
                M(viz(j),3)=M(viz(j),3)+(a*(X(1,3)-M(viz(j),3)));
                M(viz(j),4)=M(viz(j),4)+(a*(X(1,4)-M(viz(j),4)));
                M(viz(j),5)=M(viz(j),5)+(a*(X(1,5)-M(viz(j),5)));
                M(viz(j),6)=M(viz(j),6)+(a*(X(1,6)-M(viz(j),6)));
            end
            %Contador da velocidade
            J = J+1;
            %Coeficiente de Aprendizado
            coef = J/tmax;
            a = 0.2*(0.001/0.2)^coef; % learning rate
           
            %tabela de velocidade treinamento
            rate(k,1)= a;
            % tabErro(I,1) = erro;
        end
        I=I+1;
        ind = randperm(size(V,1));
        X = V(ind,:);
        eq(k,1)= mean(erro);
        %rate(k,1)= a;
        disp('Treinamento...')
        disp('Epoca Atualizada')
        disp(k)
        
    end
    Erro_FINAL_M(:,e)= eq
    e=e+1;
    beep
   % filename = ['C:\Users\Claudia\Documents\MATLAB\SOM_Tests\SOM_x8\SOM_x8_Test', int2str(e), '.mat'];
   % save(filename)
    disp('GustavoBlima')
    
    %% SOM_KNN
% Calcular as ditancias mais proximas e seus indices
clear dist, clear posicoes
dist= pdist2(X(:,1:6),M);
[~,posicoes]=sort(dist);
%Pegar os Rotulos TREINAMENTO
for r=1:64
P_Neuro= find(posicoes(1:2,r));
P_Neuro= posicoes(P_Neuro,r);
  Rot_N(:,r)=X(P_Neuro,7);
%in_P1 =1 find(M(:,1)) == c;
       % Rot_N(:,r)=X(P_Neuro1,:)
end

% TESTAR KNN
distTest= pdist2(Xt(:,1:6),M);
[~,posiTest]=sort(distTest);
P_NeuroTest=0;
for o=1:64
P_NeuroTest= find(posiTest(1:2,r));
P_NeuroTest= posiTest(P_NeuroTest,r);
  Rot_N_Test(:,r)=Xt(P_NeuroTest,7);
end
%% PARA KNN  = 1;
final = 0;
Knn_Erro=0;
for p=1:64
if Rot_N(1,p) == Rot_N_Test(1,p)
    final = final +1;
else
    Knn_Erro= Knn_Erro+1;
end
end
Z(e,1)=((final/70)*100);
disp('Acertos:');
disp(Z);
end   

