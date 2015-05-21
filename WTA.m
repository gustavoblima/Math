%#####################################################
%#####################################################
%#########WTA NETWORK - OFICIAL#######################
%#####################################################
load fisheriris
X = meas(:,1:2);
%##----Plotar Graficos----##%
fig = figure;
xlabel('X1');
ylabel('X2');
gscatter(X(:,1),X(:,2),species);

title('WTA');
hold on

%##---Deletar dados dos neuronios---##
delete(h)
clear X
clc
%%
%####---NUMEROS ALEATORIOS---####
%A = randi(150,150,1)
ind = randperm(size(X,1))
X = X(ind,:);
%%
%dados

w = [4 2;5 2;6 2;7 2; 7.5 2];
h = plot(w(:,1),w(:,2),'ro',w(:,1),w(:,2),'k')
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


%%
%#########################################
%---CALCULO DO ERRO DE QUANTIZAÇÃO------%



