%#####################################################
%#####################################################
%#########WTA NETWORK - OFICIAL#######################
%#####################################################
load fisheriris
%X = meas(:,1:2);
X = meas'
%##----Plotar Graficos----##%
fig = figure;
xlabel('X1');
ylabel('X2');
gscatter(X(:,1),X(:,2),species);

title('WTA');
hold on
net = newsom(meas,[2 2],'gridtop','linkdist')
h = plotsompos(net,X)
for i = 1:2,
    mi = min(X(:,i));
    ma = max(X(:,i));
    X(:,i) = (X(:,i)-mi)/(ma-mi);
end
%##---Deletar dados dos neuronios---##
delete(h)
clear X
clc
%%
%####---NUMEROS ALEATORIOS---####
%A = randi(150,150,1)
ind = randperm(size(X,1))
X = X(ind,:);
V=X(1,:)
%%
%dados

w = [6 3.25;6 3.25;6 3.25;6 3.25;6 3.25;6 3.25;6 3.25;6 3.25;6 3.25];
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
[o p]= size(pos)
%[r rr]= size(A)
u = zeros(16,1);
for k=1:epoca
    for i=1:n
        
        for j=1:p
            u(j)=0;
            u(j)=sqrt(((pos(1,j)-X(1,i))^2)+((pos(2,j)-X(2,i))^2));
        end
        %%[C,c] = min(u);
        if u(1,1)== min(u)
            pos(1,1)=pos(1,1)+(alpha*(X(1,i)-pos(1,1)));
            pos(1,2)=pos(1,2)+(alpha*(X(2,i)-pos(1,2)));
            %pause(0.01);
            %##Calculo para error
           % pj(i,1)=sqrt(((w(1,1)-X(i,1))^2)+((w(1,2)-X(i,2))^2));
        elseif u(1,2) ==min(u)
            pos(2,1)=pos(2,1)+(alpha*(X(1,i)-pos(2,1)));
            pos(2,2)=pos(2,2)+(alpha*(X(2,i)-pos(2,2)));
            %pause(0.01);
            %##Calculo para error
            % pj(i,1)=sqrt(((pos(2,1)-X(i,1))^2)+((pos(2,2)-X(i,2))^2));
        elseif u(1,3) == min(u)
            pos(3,1)=pos(3,1)+(alpha*(X(1,i)-pos(3,1)));
            pos(3,2)=pos(3,2)+(alpha*(X(2,i)-pos(3,2)));
            %pause(0.01);
            %##Calculo para error
            % pj(i,1)=sqrt(((w(3,1)-X(i,1))^2)+((w(3,2)-X(i,2))^2));
        elseif u(1,4) == min(u)
            pos(4,1)=pos(4,1)+(alpha*(X(1,i)-pos(4,1)));
            pos(4,2)=pos(4,2)+(alpha*(X(2,i)-pos(4,2)));
            %pause(0.01);
            %##Calculo para error
             %pj(i,1)=sqrt(((w(4,1)-X(i,1))^2)+((w(4,2)-X(i,2))^2));
        elseif u(1,5) == min(u)
            pos(5,1)=pos(5,1)+(alpha*(X(1,i)-pos(5,1)));
            pos(5,2)=pos(5,2)+(alpha*(X(2,i)-pos(5,2)));
            %pause(0.01);
            %##Calculo para error
             %pj(i,1)=sqrt(((w(5,1)-X(i,1))^2)+((w(5,2)-X(i,2))^2));
        end
    end
            set(h,'XData',pos(:,1),'YData',pos(:,2));
         drawnow
%            denom = 1 + t/300000;
%     a = .3/denom;
%     r = round(3/denom);
%     w = reshape(w,[3 3 2]);
%     X = reshape(X,[1 1 2]);
%     ch = mod(c-1,8) +1;
%     cv = floor((c-1)/8)+1;
%     for h = max(ch-r,1):min(ch+r,8)
%         for v = max(cv-r,1):min(cv+r,8)
%             w(h,v,:) = w(h,v,:) + ...
%                 a*(X(1,1,:) - w(h,v,:));
%         end
%     end
% 
%  som = plot(w(:,:,1), w(:,:,2),'ro',w(:,1,1),w(:,1,2),'k-',w(:,2,1), ...
% w(:,2,2),'k-',w(:,3,1),w(:,3,2),'k-',w(1,:,1),w(1,:,2),'k-',w(2,:,1),w(2,:,2),'k-',w(3,:,1),w(3,:,2),'k-',w(4,:,1), ...
% w(:,3,1),'k-',w(:,3,2),'k-',0,0,'.',1,1,'.');
% drawnow
%         w = reshape(w,[9 2]);
%         X = reshape(X, [1 2]);
%         
%     %,w(:,4,1),w(:,4,2),'k-', ...
% %w(:,5,1),w(:,5,2),'k-',w(:,6,1),w(:,6,2),'k-',w(:,7,1), ...
% %w(:,7,2),'k-',w(:,8,1),w(:,8,2),    
% %,w(:,4,1),w(:,4,2)
% %w(4,:,2),'k-',w(5,:,1),w(5,:,2),'k-',w(6,:,1),w(6,:,2),'k-', ...
% %w(7,:,1),w(7,:,2),'k-',w(8,:,1),w(8,:,2),'k-',

%         %du(i,j)= u(j);
%     end
%     
    %h = plot(w(:,1),w(:,2),'ro',w(:,1),w(:,2),'k')
%     ciclo=ciclo+1;
%     Error(k,1) = sum(pj)/n
%     alpha = alpha*(1-(t/tmax));
%     ind = randperm(size(X,1));
%     X = X(ind,:);
%     disp('Epoca Atualizada')
%     disp(ciclo)
end


%%
%#########################################
%---CALCULO SOM------%

t=0;
alpha = 0.3/(1+t/300000)
%M = rand(,2);
M = [0 0;0 0;0 0;0 0;0 0;0 0;0 0;0 0;0 0];
h = plot(M(:,1),M(:,2),'ro',M(:,1),M(:,2),'k')
%%
epoca=10;
ciclo=0;
alpha = 0.2
%Ui=min(u)
[n m]= size(X)
[o p]= size(M)
Q = zeros(9,1);
tic
for f = 1:epoca
    
    for t=1:n
        ind = randperm(size(X,1));
        X = X(ind,:);
        V=X(1,:)
        
        
        for i = 1:9
            Q(i,1) = norm(V(1,:) - M(i,:));
            
        end
        [C,c] = min(Q);
        
        denom = 1 + t/300000;
        a = .3/denom;
        r = round(3/denom);
        M = reshape(M,[3 3 2]);
        V = reshape(V,[1 1 2]);
        ch = mod(c-1,8) +1;
        cv = floor((c-1)/8)+1;
        for h = max(ch-r,1):min(ch+r,3)
            for v = max(cv-r,1):min(cv+r,3)
                M(h,v,:) = M(h,v,:) + ...
                    a*(V(1,1,:) - M(h,v,:));
            end
        end
        
        %som = plot(M(:,:,1),M(:,:,2),'ro',M(:,1,1),M(:,1,2),'k-',M(:,2,1),M(:,2,2),'k-',M(:,3,1),M(:,3,2),'k-',M(1,:,1),M(1,:,2),'k-',M(2,:,1),M(2,:,2),'k-',M(3,:,1),M(3,:,2),'k-',M(:,3,1),M(:,3,2),'k-',0,0,'.',1,1,'.');
        drawnow
        
        M = reshape(M,[9 2]);
        V = reshape(V, [1 2]);
    end
end

 som = plot(M(:,:,1), M(:,:,2),'ro',M(:,1,1),M(:,1,2),'k-',M(:,2,1), ...
M(:,2,2),'k-',M(:,3,1),M(:,3,2),'k-',M(:,4,1),M(:,4,2),'k-', ...
M(:,5,1),M(:,5,2),'k-',M(:,6,1),M(:,6,2),'k-',M(:,7,1), ...
M(:,7,2),'k-',M(:,8,1),M(:,8,2),'k-',M(1,:,1),M(1,:,2),'k-', ...
M(2,:,1),M(2,:,2),'k-',M(3,:,1),M(3,:,2),'k-',M(4,:,1), ...
M(4,:,2),'k-',M(5,:,1),M(5,:,2),'k-',M(6,:,1),M(6,:,2),'k-', ...
M(7,:,1),M(7,:,2),'k-',M(8,:,1),M(8,:,2),'k-',M(:,3,1), ...
M(:,3,2),'k-',M(:,4,1),M(:,4,2),'k-',0,0,'.',1,1,'.')
        
      
end
toc

