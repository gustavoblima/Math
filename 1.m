%% SCRIPT MATLAB SELF-ORGANIZING MAP NETWORK
clear all, clc
format long
pos = gridtop(5,5);
D = linkdist(pos);
%------------------------------
%ind = D(1,:) <= 1
%M(:,ind)
%------------------------------
load fisheriris
% V = meas(:,1:2);
V = meas(:,1:2);
    %Setosa
    V(1:50,3) = 1;
    %Versicolor
    V(51:100,3) = 2;
    %Virginica
    V(101:150,3) = 3;
    ind = randperm(size(V,1))
V = V(ind,:);
% TESTE
Xt = V(76:150,:);
%TREINAMENTO
V = V(1:75,:);
for i = 1:2,
mi = min(V(:,i));
ma = max(V(:,i));
V(:,i) = (V(:,i)-mi)/(ma-mi);
end

%  V = rands(2,1000);
%  V=V';
% plot(V(:,1),V(:,2),'.g')
gscatter(V(:,1),V(:,2),species)
%hold on
e=1;
%%
M_dados = mean(V)

% Numero de neuronios
M = [0.42 0.44;0.42 0.44;0.42 0.44;0.42 0.44;0.42 0.44;...
0.42 0.44;0.42 0.44;0.42 0.44;0.42 0.44;0.42 0.44;...
0.42 0.44;0.42 0.44;0.42 0.44;0.42 0.44;0.42 0.44;...
0.42 0.44;0.42 0.44;0.42 0.44;0.42 0.44;0.42 0.44;...
0.42 0.44;0.42 0.44;0.42 0.44;0.42 0.44;0.42 0.44]

%%
while e<=1
    epoca=400;
    %M =zeros(25,2);
    a = .3;
    [n m]= size(V);
    tmax = n*epoca
    Q = zeros(25,1);
    rate =0;
    Er=0;
    erro=[];
    J=0;
    I=0;
    ind = randperm(size(V,1));
    p_v = V(ind,:);
    
%pdist2(x,M)
for k=1:epoca,
    for t=1:n,
        X=p_v(t,1:2);
        %Calculo da distancia
        Q = pdist2(X,M);

        [C,c] = min(Q);
        %Separa o indice do valor minimo na matrix Q
        in2 = Q(1,:) == min(Q);
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
        end
        %Contador da velocidade
        J = J+1;
        %Coeficiente de Aprendizado
        coef = J/tmax;
        a = 0.3*(0.0001/0.3)^coef; % learning rate
        %Error(t,1) = min(Q);

        %Calculo de diminuição vizinhança
        % %              %Contador da decaimento
            %     I = I+1;
        %             %Coeficiente de Vizinhança
        %             coefv = 20000/tmax;
        %             v = 1*(0.001/1)^coefv;
        %             for u=1:z
        %             hcix = exp(-(sqrt(M(viz(u),1)))-W(1,1))/v^2
        %             hciy = exp(-(sqrt(M(viz(u),2)))-W(1,2))/v^2
        %             end
        %tabela de velocidade treinamento
        rate(k,1)= a;
       % tabErro(I,1) = erro;
    end
    I=I+1;
    ind = randperm(size(V,1));
    X = V(ind,:);
    Er(k,1)= mean(erro);
    %rate(k,1)= a;
    disp('Treinamento...')
    disp('Epoca Atualizada')
    disp(k)
    
end
Erro_FINAL_M(:,e)= Er
e=e+1;
beep
% filename = ['C:\Users\Claudia\Documents\MATLAB\SOMx5_Test\SOM_x5_Rand_Test', int2str(e), '.mat'];
% save(filename)
disp('GustavoBlima')
end

%%
%% SOM_KNN
% Calcular as ditancias mais proximas e seus indices
clear dist, clear posicoes
dist= pdist2(V(:,1:2),M);
[~,posicoes]=sort(dist);
%Pegar os Rotulos TREINAMENTO
for r=1:25
P_Neuro= find(posicoes(1,r));
P_Neuro= posicoes(P_Neuro,r);
  Rot_N(r,1)=V(P_Neuro,3)
end

% TESTAR KNN
distTest= pdist2(Xt(:,1:2),M);
[~,posiTest]=sort(distTest);
P_NeuroTest=0;
Rot_N_Test=0;
for h=1:25
P_NeuroTest= find(posiTest(h,1));
P_NeuroTest= posiTest(h,P_NeuroTest);
  Rot_N_Test(h,1)=Xt(P_NeuroTest,3);
end
%% PARA KNN  = 1;
final = 0;
Knn_Erro=0;
for p=1:25
if Rot_N(25,1) == Rot_N_Test(25,1)
    final = final +1
else
    Knn_Erro= Knn_Erro+1
end
end
 Z=100-(final/75);
disp('Acertos:');
disp(Z);
    %% PLOT SELF-ORGANIZING MAP NETWORK
    
    
    M = reshape(M,[8 8 2]);
    X = reshape(X,[1 1 2]);
    som = plot_nodes(M);
    M = reshape(M,[64 2]);
    X = reshape(X,[1 2]);
    
    
    
    
    %  Update to plot
    M = reshape(M,[5 5 2]);
    X = reshape(X,[1 1 2]);
    hold off
    %  plot(V(:,1),V(:,2),'.g')
    hold on
    som = plot(M(:,:,1), M(:,:,2),'ro',M(:,1,1),M(:,1,2),'b-',M(:,2,1), ...
        M(:,2,2),'b-',M(:,3,1),M(:,3,2),'b',M(:,4,1),M(:,4,2),'b-',M(1,:,1),M(1,:,2),'b-', ...
        M(2,:,1),M(2,:,2),'b-',M(3,:,1),M(3,:,2),'b',...
        M(:,5,1),M(:,5,2),'b-',M(5,:,1),M(5,:,2),'b-',...
        M(4,:,1), M(4,:,2),'b-',0,0,'.',1,1,'.');
    
    som = plot(M(:,:,1), M(:,:,2),'ro',M(:,1,1),M(:,1,2),'b-',M(:,2,1), ...
        M(:,2,2),'b-',M(:,3,1),M(:,3,2),'b-',M(:,4,1),M(:,4,2),'b-', ...
        M(:,5,1),M(:,5,2),'b-',M(:,6,1),M(:,6,2),'b-',M(:,7,1), ...
        M(:,7,2),'b-',M(:,8,1),M(:,8,2),'b-',M(1,:,1),M(1,:,2),'b-', ...
        M(2,:,1),M(2,:,2),'b-',M(3,:,1),M(3,:,2),'b-',M(4,:,1), ...
        M(4,:,2),'b-',M(5,:,1),M(5,:,2),'b-',M(6,:,1),M(6,:,2),'b-', ...
        M(7,:,1),M(7,:,2),'b-',M(8,:,1),M(8,:,2),'b-',M(:,3,1), ...
        M(:,3,2),'b-',M(:,4,1),M(:,4,2),'b-',0,0,'.',1,1,'.');
    
    
    M = reshape(M,[25 2]);
    %                     X = reshape(X,[1 2]);
    %