
%%
t=0;
alpha = 0.3/(1+t/300000)
M = rand(64,2);
%%

Q = zeros(64,1);
tic
for t = 1:100000
    X = rand(1,2);
    for i = 1:64
        Q(i,1) = norm(X(1,:) - M(i,:));
    end
    [C,c] = min(Q);
    
    denom = 1 + t/300000;
    a = .3/denom;
    r = round(3/denom);
    M = reshape(M,[8 8 2]);
    X = reshape(X,[1 1 2]);
    ch = mod(c-1,8) +1;
    cv = floor((c-1)/8)+1;
    for h = max(ch-r,1):min(ch+r,8)
        for v = max(cv-r,1):min(cv+r,8)
            M(h,v,:) = M(h,v,:) + ...
                a*(X(1,1,:) - M(h,v,:));
        end
    end

 som = plot(M(:,:,1), M(:,:,2),'ro',M(:,1,1),M(:,1,2),'k-',M(:,2,1), ...
M(:,2,2),'k-',M(:,3,1),M(:,3,2),'k-',M(:,4,1),M(:,4,2),'k-', ...
M(:,5,1),M(:,5,2),'k-',M(:,6,1),M(:,6,2),'k-',M(:,7,1), ...
M(:,7,2),'k-',M(:,8,1),M(:,8,2),'k-',M(1,:,1),M(1,:,2),'k-', ...
M(2,:,1),M(2,:,2),'k-',M(3,:,1),M(3,:,2),'k-',M(4,:,1), ...
M(4,:,2),'k-',M(5,:,1),M(5,:,2),'k-',M(6,:,1),M(6,:,2),'k-', ...
M(7,:,1),M(7,:,2),'k-',M(8,:,1),M(8,:,2),'k-',M(:,3,1), ...
M(:,3,2),'k-',M(:,4,1),M(:,4,2),'k-',0,0,'.',1,1,'.');
drawnow
        M = reshape(M,[64 2]);
        X = reshape(X, [1 2]);
        
      
end
toc
    %-------------------------------------------
 %%   
som = plot(M(:,:,1), M(:,:,2),'ro',M(:,1,1),M(:,1,2),'k-',M(:,2,1), ...
M(:,2,2),'k-',M(:,3,1),M(:,3,2),'k-',M(:,4,1),M(:,4,2),'k-', ...
M(:,5,1),M(:,5,2),'k-',M(:,6,1),M(:,6,2),'k-',M(:,7,1), ...
M(:,7,2),'k-',M(:,8,1),M(:,8,2),'k-',M(1,:,1),M(1,:,2),'k-', ...
M(2,:,1),M(2,:,2),'k-',M(3,:,1),M(3,:,2),'k-',M(4,:,1), ...
M(4,:,2),'k-',M(5,:,1),M(5,:,2),'k-',M(6,:,1),M(6,:,2),'k-', ...
M(7,:,1),M(7,:,2),'k-',M(8,:,1),M(8,:,2),'k-',M(:,3,1), ...
M(:,3,2),'k-',M(:,4,1),M(:,4,2),'k-',0,0,'.',1,1,'.');
hold on
set(som,'XData',M(:,1),'YData',M(:,2));
        drawnow

   
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        %% 
    X = rands(2,1000); % Cluster centers to be in these bounds.
clusters = 25;     % This many clusters.
points = 10;      % Number of points in each cluster.
std_dev = 0.2;   % Standard deviation of each cluster.
P = nngenc(X,clusters,points,std_dev);

% Plot P.
plot(P(1,:),P(2,:),'+r');
title('Input Vectors');
xlabel('p(1)');
ylabel('p(2)');
    
    
net = newc([0 1;0 1],8,.1);
w = net.IW{1};
plot(P(1,:),P(2,:),'+r');
hold on;
circles = plot(w(:,1),w(:,2),'ob');

net.trainParam.epochs = 100;
net = train(net,P);
w = net.IW{1};
delete(circles);
plot(w(:,1),w(:,2),'ob');

p = [0; 0.2];
a = sim(net,p)



%###########################################################
%###########################################################
%###########################################################

%########NORMALIZAR OS VETORES##############################
%########FICA MAIS FACIL TRABALHAR COM NUMEROS MENORES######
X = meas;

for i = 1:4,
    mi = min(X(:,i));
    ma = max(X(:,i));
    X(:,i) = (X(:,i)-mi)/(ma-mi);
end

Y=rand(150,2)
xs = X(:,3:4);

%######################################################
%#######CALCULO DA DISTANCIA EUCLIDIANA################;

dist = eucdist(xs,Y)

%######################################################
%######################################################
%################EXERCICIO DE FIXACAO##################
x1= rand(1,100)-0.5;
x2=rand(1,100)-0.5;
x = [x1;x2]';
w1=rand(1,50)-rand(1,50);
w2=rand(1,50)-rand(1,50);
w=[w1;w2]
plot([-0.5 0.5 0.5 -0.5 -0.5],[-0.5 -0.5 0.5 0.5 -0.5]);
xlabel('X1');
ylabel('X2');
title('Kohonen net input');
hold on;
plot(x1,x2,'b.');
axis([-1.0 1.0 -1.0 1.0]);
title('Kohonen self-Organizing map Epoch=0');
hold on
w= [w1;w2];
h = plot(w(1,:),w(2,:),'ro',w(1,:),w(2,:),'k');
drawnow;



%#######################################################
con=1;
epoch=2;
alpha=0.2;
[n m]= size(x)
[o p]= size(w)
while con
    for i=1:n
        for j=1:p
            D(j)=1;
            for k=1:2
                D(j)=D(j)+(w(k,j)-x(i,k))^2
            end
        end
        for j=1:50
            if D(j)==min(D)
                J=j;
            end
        end
        I=J-1;
        K=J+1;
        if I<1
            I=50;
        end
        if K>50
            K=1;
        end
        w(:,J)=w(:,J)+(alpha*x(1,:)'-w(:,J));
        w(:,I)=w(:,I)+(alpha*x(1,:)'-w(:,I));
        w(:,K)=w(:,K)+(alpha*x(1,:)'-w(:,K));
        set(h,'XData',w(1,:),'YData',w(2,:));
       drawnow
    end
    %alpha = alpha-0.49;
    epoch=epoch+1;
    if epoch==100
        con=0;
    end
end
hold on
disp('Numero de Epocas');
disp(epoch);
drawnow;
disp('Taxa de aprendizado depois de 100 epocas');
disp(alpha);
hold on;
plot(w(1,:),w(2,:),'ro',w(1,:),w(2,:),'k');


            
%#######################################################
%##########TESTE 2 - EXERCICIO #########################
%#######################################################
% - Sendo o peso e as entradas calcular os pesos para o neuronio ganhador.
w=[0.9 0.4;0.7 0.3; 0.6 0.5]
x=[0.4 0.2 0.1]

figure;
plot([-0.5 0.5 0.5 -0.5 -0.5],[-0.5 -0.5 0.5 0.5 -0.5]);
xlabel('X1');
ylabel('X2');
title('Kohonen net input');
hold on;
plot(x,'b.');
axis([-1.0 1.0 -1.0 1.0]);
title('Kohonen self-Organizing map Epoch=0');
hold on

plot(w(1,:),w(2,:),'ro',w(1,:),w(2,:),'k');
plot(wUP(1,:),wUP(2,:),'ro',wUP(1,:),wUP(2,:),'k');
%######################################################
%#######CALCULO DA DISTANCIA EUCLIDIANA################;
%         FORMULA DA DISTANCIA EUCLIDIANA;
%     Soma de todas as distancias ao quadrado    
%              D(j)= (wij - xi)^2
xs = x'
d1 = eucdist(w(:,1),xs(:,1))

d1 = d1.^2
dw1 = sum(d1)

d2 = eucdist(w(:,2),xs(:,1))

d2 = d1.^2
dw2 = sum(d2)

%##########RETIRAR O MINIMO DOS DOIS PESOS CALCULADOS################
%######VERIFICAR O NUMERO DE COLUNAS 'W' É IGUAL AO NUMERO DE PESOS##
mi = min(dw1,dw2)

%####################################################################
%########### O PESO MENOR IRÁ ATUALIZAR A COLUNA ESPECIFICA 'W'######
%########### FORMULA w12(novo)=w12(antigo)+alpha[x1 - w22,(antigo)]
%###########         w12(novo)=0.4+02(0.4-0.4)
%###########         w12(novo)= 0.4  .... E assim o faz o mesmo para o
%###########         restante das linhas....
%####################################################################
[n m]=size(w)
[z zz]=size(xs)
epoca=100
clear wUP
alpha = 0.9
for i=1:800
    for k=1:3
    if mi ==dw1
        wUP(k,:)= w(k,1)+(alpha*(xs(k,1)-w(k,1)));
        
    else
        wUP(k,:)= w(k,2)+(alpha*(xs(k,1)-w(k,2)));
        
    end 

    end
end
if mi == dw1
    wUP=horzcat (wUP,w(:,2));
else
    wUP=horzcat(w(:,1),wUP);
end
hold on

plot(wUP(1,:),wUP(2,:),'ro',wUP(1,:),wUP(2,:),'k');
drawnow;
%#####################################################################
%#####################################################################
%#####################################################################
con=1;
epoch=0;
alpha=1;
while con
    for i=1:100
        for j=1:50
            D(j)=0;
            for k=1:2
                D(j)=D(j)+(w(k,j)-x(i,k))^2;
            end
        end
        for j=1:50
            if D(j)==min(D)
                J=j;
            end
        end
        I=J-1;
        K=J+1;
        if I<1
            I=50;
        end
        if K>50
            K=1;
        end
        w(:,J)=w(:,J)+alpha*x(1,:)'-w(:,J);
        %w(:,I)=w(:,I)+alpha*x(1,:)'-w(:,I);
        %w(:,K)=w(:,K)+alpha*x(1,:)'-w(:,K);
    end
    alpha = alpha-0.00049;
    epoch=epoch+1;
    if epoch==800
        con=0;
    end
end
hold on
disp('Numero de Epocas');
disp(epoch);
drawnow;
disp('Taxa de aprendizado depois de 100 epocas');
disp(alpha);
hold on;
plot(w(1,:),w(2,:),'ro',w(1,:),w(2,:),'k');



%#####################################################################
%#####################ALGORITMO MATLAB----############################
%#####################################################################
 p = rand(2,1);
       a = rand(3,1);
       ws = rand(3,2);
       lp.lr = 0.5;
dW = learnk(ws,p,[],[],a,[],[],[],[],[],lp,[])















