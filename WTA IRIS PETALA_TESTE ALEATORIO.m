%#####################################################
%#####################################################
%#########WTA NETWORK - OFICIAL#######################
%#####################################################
load fisheriris
X = meas(:,3:4);
%##---Embaralhar Matriz---##%

%##----Plotar Graficos----##%
fig = figure;
xlabel('X1');
ylabel('X2');
gscatter(X(:,1),X(:,2),species);

title('WTA');
hold on

%##---Deletar dados dos neuronios---##
delete(h)

%dados
w = [0 0;0 0;0 0;0 0; 0 0];
%w = [5 4.2;5 2.5;8 3.2;6.5 3.7; 4.5 2.5];
h = plot(w(:,1),w(:,2),'ro',w(:,1),w(:,2),'k')

epoca=4;
ciclo=0;
alpha = 0.9
%Ui=min(u)
[n m]= size(X)
[o p]= size(w)

for k=1:epoca
    for i=1:150
        
        for j=1:o
            u(j)=0;
            u(j)=sqrt(((w(j,1)-X(i,1))^2)+((w(j,2)-X(i,2))^2))
        end
        
        if u(1,1)== min(u)
            w(1,1)=w(1,1)+(alpha*(X(i,1)-w(1,1)));
            w(1,2)=w(1,2)+(alpha*(X(i,2)-w(1,2)));
            pause(0.01);
        elseif u(1,2) ==min(u)
            w(2,1)=w(2,1)+(alpha*(X(i,1)-w(2,1)));
            w(2,2)=w(2,2)+(alpha*(X(i,2)-w(2,2)));
            pause(0.01);
        elseif u(1,3) == min(u)
            w(3,1)=w(3,1)+(alpha*(X(i,1)-w(3,1)));
            w(3,2)=w(3,2)+(alpha*(X(i,2)-w(3,2)));
            pause(0.01);
        elseif u(1,4) == min(u)
            w(4,1)=w(4,1)+(alpha*(X(i,1)-w(4,1)));
            w(4,2)=w(4,2)+(alpha*(X(i,2)-w(4,2)));
            pause(0.01);
        elseif u(1,5) == min(u)
            w(5,1)=w(5,1)+(alpha*(X(i,1)-w(5,1)));
            w(5,2)=w(5,2)+(alpha*(X(i,2)-w(5,2)));
            pause(0.01);
        end
        
        set(h,'XData',w(:,1),'YData',w(:,2));
        drawnow
    end
    
    %h = plot(w(:,1),w(:,2),'ro',w(:,1),w(:,2),'k')
    ciclo=ciclo+1;
    alpha = alpha/(1+ciclo);
end
%%