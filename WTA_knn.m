%#####################################################
%#####################################################
%#########WTA NETWORK - OFICIAL#######################
%#####################################################
load fisheriris
X = meas(:,3:4);
    %Setosa
    X(1:50,3) = 1;
    %Versicolor
    X(51:100,3) = 2;
    %Virginica
    X(101:150,3) = 3;
%##----Plotar Graficos----##%
fig = figure;
xlabel('X1');
ylabel('X2');
gscatter(X(:,1),X(:,2),species);
set(legend,'location','best')
%plot(X,'g+');
title('WTA');
hold on

%##---Deletar dados dos neuronios---##
delete(h)
clear all
clc
%%
%####---NUMEROS ALEATORIOS---####
%A = randi(150,150,1)
ind = randperm(size(X,1))
X = X(ind,:);
% TESTE
Xt = X(76:150,:);
%TREINAMENTO
X = X(1:75,:);
[n m]= size(X)
% J=0;
% for I=1:n,
%     if (meas(I,1)>0) && (meas(I,2)> 0)
%         J=J+1;
%         NC(J,:)=X(I,:);
%         speciesNC(J)=species(I);
%     end
% end
% 
% speciesNC=speciesNC'
%%
%dados

w = [3.82 1.2293;3.82 1.2293;3.82 1.2293;3.82 1.2293;3.82 1.2293];
h = plot(w(:,1),w(:,2),'ro',w(:,1),w(:,2),'b')
%%
%%#############################################
%##############################################
%--CALCULO DECAIMENTO TAXA DE APRENDIZAGEM----
% tmax = tamanho do conjunto de treinamento x Numero maximo de epocas
% t = tamanho do conjunto
% n0 = numero da taxa inicial
%-------Formula: n(t) = n0*(1-t/tmax)
t= n
tmax = n*epoca
n(j) = alpha*(1-(t/tmax))
%%##############################################
%%
epoca=10;
ciclo=0;
alpha = 0.2
%Ui=min(u)
[n m]= size(X)
[o p]= size(w)
%[r rr]= size(A)

for k=1:epoca
    for i=1:n
        
        for j=1:o
            u(j)=0;
            u(j)=sqrt(((w(j,1)-X(i,1))^2)+((w(j,2)-X(i,2))^2));
        end
        
        if u(1,1)== min(u)
            w(1,1)=w(1,1)+(alpha*(X(i,1)-w(1,1)));
            w(1,2)=w(1,2)+(alpha*(X(i,2)-w(1,2)));
            %pause(0.01);
            %##Calculo para error
            pj(i,1)=sqrt(((w(1,1)-X(i,1))^2)+((w(1,2)-X(i,2))^2));
        elseif u(1,2) ==min(u)
            w(2,1)=w(2,1)+(alpha*(X(i,1)-w(2,1)));
            w(2,2)=w(2,2)+(alpha*(X(i,2)-w(2,2)));
            %pause(0.01);
            %##Calculo para error
            pj(i,1)=sqrt(((w(2,1)-X(i,1))^2)+((w(2,2)-X(i,2))^2));
        elseif u(1,3) == min(u)
            w(3,1)=w(3,1)+(alpha*(X(i,1)-w(3,1)));
            w(3,2)=w(3,2)+(alpha*(X(i,2)-w(3,2)));
            %pause(0.01);
            %##Calculo para error
            pj(i,1)=sqrt(((w(3,1)-X(i,1))^2)+((w(3,2)-X(i,2))^2));
        elseif u(1,4) == min(u)
            w(4,1)=w(4,1)+(alpha*(X(i,1)-w(4,1)));
            w(4,2)=w(4,2)+(alpha*(X(i,2)-w(4,2)));
            %pause(0.01);
            %##Calculo para error
            pj(i,1)=sqrt(((w(4,1)-X(i,1))^2)+((w(4,2)-X(i,2))^2));
        elseif u(1,5) == min(u)
            w(5,1)=w(5,1)+(alpha*(X(i,1)-w(5,1)));
            w(5,2)=w(5,2)+(alpha*(X(i,2)-w(5,2)));
            %pause(0.01);
            %##Calculo para error
            pj(i,1)=sqrt(((w(5,1)-X(i,1))^2)+((w(5,2)-X(i,2))^2));
        end
        
        set(h,'XData',w(:,1),'YData',w(:,2));
        drawnow
        %du(i,j)= u(j);
    end
    
    %h = plot(w(:,1),w(:,2),'ro',w(:,1),w(:,2),'k')
    ciclo=ciclo+1;
    Error(k,1) = sum(pj)/n
    alpha = alpha*(1-(t/tmax));
    ind = randperm(size(X,1));
    X = X(ind,:);
    disp('Epoca Atualizada')
    disp(ciclo)
end
hold on
    text(w(1,1),w(1,2),'\fontsize{8} \bf \color[rgb]{0 .5 .5}1')
    text(w(2,1),w(2,2),'\fontsize{8} \bf \color[rgb]{0 .5 .5}2')
    text(w(3,1),w(3,2),'\fontsize{8} \bf \color[rgb]{0 .5 .5}3')
    text(w(4,1),w(4,2),'\fontsize{8} \bf \color[rgb]{0 .5 .5}4')
    text(w(5,1),w(5,2),'\fontsize{8} \bf \color[rgb]{0 .5 .5}5')

%%
% KNN DESCOBRIR ROTULOS DE NEURONIOS

dist= pdist2(X(:,1:2),w)
[~,posicao]=sort(dist)




%------KNN
Result_X = meas(:,3:4);
Result_X(1:50,3) = 1;
Result_X(51:100,3) = 2;
Result_X(101:150,3) = 3;
[r rr] = size(Result_X)
%Neuronio 1
%VIRGINICA
w1 = w(1,:);
%Neuronio 2
%SETOSA
w2 = w(2,:);
%Neuronio 3
%VIRGINICA
w3 = w(3,:);
%Neuronio 4
%VERSICOLOR
w4 = w(4,:);
%Neuronio 5
%VERSICOLOR
w5 = w(5,:);
j = 1;
mi_Result_X = 0;
% SUBSTITUIR OS VALORES w(1,1) e w(1,2) PELOS PESOS ACIMA
% FAZER PARA CADA UM....
for i=1:r
    Result_X(j,4)=0;
    Result_X(j,4)=sqrt(((w(5,1)-Result_X(i,1))^2)+((w(5,2)-Result_X(i,2))^2)); 
    j = j+1;  
end
%Pesquisar massa de dados mais proxima do neuronio
mi_Result_X = min(Result_X(:,4))
%@@
for k=1:r
if Result_X(k,3) == 1 & Result_X(k,4) == mi_Result_X
    disp('Neuronio  = SETOSA')
 disp(mi_Result_X);
elseif Result_X(k,3) == 2 & Result_X(k,4) == mi_Result_X
    disp('Neuronio  = VERSICOLOR')
 disp(mi_Result_X);
elseif Result_X(k,3) == 3 & Result_X(k,4) == mi_Result_X
    disp('Neuronio  = VIRGINICA')
 disp(mi_Result_X);
end
end

%%
%#########################################
%---CALCULO DO KNN------%
Xt = X
kn1 = 0;
kn2 = 0;
kn3 = 0;
kn4 = 0;
kn5 = 0;
classify1 = 0;
classify2 = 0;
classify3 = 0;
classify4 = 0;
classify5 = 0;
result=0;
for t=1:n
    for j=1:o
        u(j)=0;
        u(j)=sqrt(((w(j,1)-Xt(t,1))^2)+((w(j,2)-Xt(t,2))^2));
    end
    %Tdist(t,:)=u(j)
    
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
    end
    %TROCAR RESULT_X POR Xt; Apenas fiz teste com Result_X;
        switch(result)
            case 1
                disp('result is 1')
               kn1 = kn1+1;
                   classify1(t,1) = Xt(t,3);
            case 2
                disp('result is 2')            
               kn2 = kn2+1;
               classify2(t,1) = Xt(t,3);
            case 3
                disp('result is 3')
                kn3 = kn3+1;
                classify3(t,1) = Xt(t,3);
            case 4
                disp('result is 4')
                kn4 = kn4+1;
                classify4(t,1) = Xt(t,3);
            case 5
                disp('result is 5')
                kn5 = kn5+1;
                classify5(t,1) = Xt(t,3);    
            otherwise
                disp('Resultado nao alterado!')
        end
end

%-----###TESTE KNN = 2###-----
final = 0;
for q= 1:69
if classify1(q,1) == 3
    final= final+1;
end
end
for qqqqq= 1:67
    if classify2(qqqqq,1) == 1
        final = final+1;
    end
end
for qq= 1:74
if classify3(qq,1) == 3
    final = final+1;
end
end
for qqq=1:73
if classify4(qqq,1) == 2
     final = final+1;
end
end
for qqqq=1:75
if classify5(qqqq,1) == 2
     final = final+1;
end

end
%%
 Z=((final/75)*100);
disp('Acertos:');
disp(Z);
 
