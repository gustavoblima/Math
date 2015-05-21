%#############
%########WTA Testing area########

%Normalizar dados
load fisheriris
X = meas(:,1:2);

for i = 1:2,
    mi = min(X(:,i));
    ma = max(X(:,i));
    X(:,i) = (X(:,i)-mi)/(ma-mi);
end

X(:,1:2)=meas(:,1:2);
w = [0 0];
w1= [0 0];
w2= [0 0];
%###################################
%######Media dos dados##########

%###################################
%####Calculo da Distancia###########
alpha = 0.01
[n m]= size(X)

for I=1:12,
    for J=1:5
        w(1,1)=w(1,1)+(alpha*(sqrt(((w(1,1)-X(I,1))^2)+((w(1,2)-X(I,1))^2))));
        w(1,2)=w(1,2)+(alpha*(sqrt(((w(1,1)-X(I,2))^2)+((w(1,2)-X(I,2))^2))));
        %w(1,:)=w(1,:)+(alpha*sqrt(((w(1,1)-X(I,1))^2)+((w(1,2)-X(I,2))^2)));
        w=w(1,:);
        %w1=w(2,:);
        %w2=w(3,:);
        h= plot(w(1,1),w(1,2),'ro');
        pause(0.01);
        delete(h)
    end
    plot(w(1,1),w(1,2),'ro');
    for K=50:55,
        w1(1,1)=w1(1,1)+(alpha*(sqrt(((w1(1,1)-X(K,1))^2)+((w1(1,2)-X(K,1))^2))));
        w1(1,2)=w1(1,2)+(alpha*(sqrt(((w1(1,1)-X(K,2))^2)+((w1(1,2)-X(K,2))^2))));
        %w(1,:)=w(1,:)+(alpha*sqrt(((w(1,1)-X(I,1))^2)+((w(1,2)-X(I,2))^2)));
        w1=w1(1,:);
        %w1=w(2,:);
        %w2=w(3,:);
        h= plot(w1(1,1),w1(1,2),'go');
        pause(0.01);
        delete(h)
    end
    plot(w1(1,1),w1(1,2),'go');
    for L=100:105,
        w2(1,1)=w2(1,1)+(alpha*(sqrt(((w2(1,1)-X(L,1))^2)+((w2(1,2)-X(L,1))^2))));
        w2(1,2)=w2(1,2)+(alpha*(sqrt(((w2(1,1)-X(L,2))^2)+((w2(1,2)-X(L,2))^2))));
        %w(1,:)=w(1,:)+(alpha*sqrt(((w(1,1)-X(I,1))^2)+((w(1,2)-X(I,2))^2)));
        w2=w2(1,:);
        %w1=w(2,:);
        %w2=w(3,:);
        h= plot(w2(1,1),w2(1,2),'bo');
        pause(0.01);
        delete(h)
    end
    plot(w2(1,1),w2(1,2),'bo');
end




plot(w2(1,1),w2(1,2),'go');

figure;
xlabel('X1');
ylabel('X2');
gscatter(X(:,1),X(:,2),species);
title('WTA');
hold on

%plot(w(1,1),w(1,2),'ro',w(1,1),w(1,2),'k');

plot(w(1,1),w(1,2),'go',w1(1,1),w1(1,2),'ro',w2(1,1),w2(1,2),'bo');
%plot(w(1,1),w(1,2),'go');
refresh(h)

%#####################################################################

%% CODE
figure;

% line function
f = @(x) x.^2;

% x intervals
xi = -5:0.1:5;

% plot
plot(xi,f(xi));

% motions
hold on;
for i=1:length(xi)
    h = plot(xi(i),f(xi(i)),'ro','MarkerFaceColor','r');
    pause(0.01);
    delete(h);
end

% END OF CODE

%% CODE
figure;

% line function
f = @(x) x.^2;

% x intervals
xi = -5:0.1:5;

% plot
plot(w(1,1),w(1,2),'go');

% motions
hold on;
for I=1:50,
w(1,1)=w(1,1)+(alpha*(sqrt((w(1,1)-X(I,1))^2)+((w(1,2)-X(I,2))^2)));
w(1,2)=w(1,2)+(alpha*sqrt(((w(1,1)-X(I,1))^2)+((w(1,2)-X(I,2))^2)));
%w(1,:)=w(1,:)+(alpha*sqrt(((w(1,1)-X(I,1))^2)+((w(1,2)-X(I,2))^2)));
w=w(1,:);
%w1=w(2,:);
%w2=w(3,:);
h= plot(w(1,1),w(1,2),'go');
pause(0.01);
delete(h)
end
plot(w(1,1),w(1,2),'go');
% END OF CODE

%#####################################################
%#####################################################
%#############
%########WTA Testing area 2###########################

%Normalizar dados
load fisheriris
X = meas(:,1:2);

for i = 1:2,
    mi = min(X(:,i));
    ma = max(X(:,i));
    X(:,i) = (X(:,i)-mi)/(ma-mi);
end

X(:,1:2)=meas(:,1:2);
w = [0 1];
w1= [0 0];
w2= [0 0];
%###################################
%######DISTANCIA EUCLIDIANA##########
alpha = 0.1
[n m]= size(X)

for I=1:n,
        u=sqrt(((w(1,1)-X(I,1))^2)+((w(1,2)-X(I,2))^2));
        %w(1,2)=sqrt(((w(1,2)-X(131,2))^2)+((w(1,1)-X(131,2))^2));
        %w(1,:)=w(1,:)+(alpha*sqrt(((w(1,1)-X(I,1))^2)+((w(1,2)-X(I,2))^2)));
        %w=w(1,:);
end
 u=u'
    

%%%%###############################
%#####ATUALIZAÇÃO DO VETOR DE PESO
alpha = 0.9
Ui=min(u)

for J=1:n
w(1,1)=w(1,1)+(alpha*(X(J,1)-w(1,1)));
w(1,2)=w(1,2)+(alpha*(X(J,2)-w(1,2)));
plot(w(1,1),w(1,2),'ro');
end

%w(1,:)=w(1,:)+alpha*x(131,:)'-w(:,J);
%###################################
%####Calculo da Distancia###########
alpha = 0.01
[n m]= size(X)

for I=1:12,
    for J=1:5
        w(1,1)=w(1,1)+(alpha*(sqrt(((w(1,1)-X(I,1))^2)+((w(1,2)-X(I,1))^2))));
        w(1,2)=w(1,2)+(alpha*(sqrt(((w(1,1)-X(I,2))^2)+((w(1,2)-X(I,2))^2))));
        %w(1,:)=w(1,:)+(alpha*sqrt(((w(1,1)-X(I,1))^2)+((w(1,2)-X(I,2))^2)));
        w=w(1,:);
        %w1=w(2,:);
        %w2=w(3,:);
        h= plot(w(1,1),w(1,2),'ro');
        pause(0.01);
        delete(h)
    end
    plot(w(1,1),w(1,2),'ro');
  %  for K=50:55,
  %      w1(1,1)=w1(1,1)+(alpha*(sqrt(((w1(1,1)-X(K,1))^2)+((w1(1,2)-X(K,1))^2))));
  %      w1(1,2)=w1(1,2)+(alpha*(sqrt(((w1(1,1)-X(K,2))^2)+((w1(1,2)-X(K,2))^2))));
        %w(1,:)=w(1,:)+(alpha*sqrt(((w(1,1)-X(I,1))^2)+((w(1,2)-X(I,2))^2)));
  %      w1=w1(1,:);
        %w1=w(2,:);
        %w2=w(3,:);
  %      h= plot(w1(1,1),w1(1,2),'go');
  %      pause(0.01);
  %      delete(h)
  %  end
  %  plot(w1(1,1),w1(1,2),'go');
  %  for L=100:105,
  %      w2(1,1)=w2(1,1)+(alpha*(sqrt(((w2(1,1)-X(L,1))^2)+((w2(1,2)-X(L,1))^2))));
  %      w2(1,2)=w2(1,2)+(alpha*(sqrt(((w2(1,1)-X(L,2))^2)+((w2(1,2)-X(L,2))^2))));
        %w(1,:)=w(1,:)+(alpha*sqrt(((w(1,1)-X(I,1))^2)+((w(1,2)-X(I,2))^2)));
  %      w2=w2(1,:);
        %w1=w(2,:);
        %w2=w(3,:);
  %      h= plot(w2(1,1),w2(1,2),'bo');
   %     pause(0.01);
  %      delete(h)
   % end
  %  plot(w2(1,1),w2(1,2),'bo');
end




plot(w2(1,1),w2(1,2),'go');

figure;
xlabel('X1');
ylabel('X2');
gscatter(X(:,1),X(:,2),species);
title('WTA');
hold on

%plot(w(1,1),w(1,2),'ro',w(1,1),w(1,2),'k');

plot(w(1,1),w(1,2),'go',w1(1,1),w1(1,2),'ro',w2(1,1),w2(1,2),'bo');
%plot(w(1,1),w(1,2),'go');
refresh(h)

%################################################################
%################################################################
plot(w2(1,1),w2(1,2),'go');

fig = figure;
xlabel('X1');
ylabel('X2');
gscatter(X(:,1),X(:,2),species);

title('WTA');
hold on

%plot(w(1,1),w(1,2),'ro',w(1,1),w(1,2),'k');

%h = plot(w(1,1),w(1,2),'go',w1(1,1),w1(1,2),'ro',w2(1,1),w2(1,2),'bo');
h = plot(w(1,1),w(1,2),'go',w(2,1),w(2,2),'ro',w(3,1),w(3,2),'bo');

%#####################################################
%#####################################################
%#############
%########WTA Testing area 2###########################

%Normalizar dados
load fisheriris
X = meas(:,1:2);

w = [4 2;4 2.1;4 2.2 ];
w1= [4 2.1];
w2= [4 2.2];
%###################################
%######DISTANCIA EUCLIDIANA##########
alpha = 0.1
[n m]= size(w)
J=0;
for I=1:n,
        u(I)=sqrt(((w(I,1)-X(60,1))^2)+((w(I,2)-X(60,2))^2));
         J=J+1;
        ui(J,:)=u(I,:);
        %u1=sqrt(((w1(1,1)-X(60,1))^2)+((w1(1,2)-X(60,2))^2));
        %u2=sqrt(((w2(1,1)-X(60,1))^2)+((w2(1,2)-X(60,2))^2));
        %w(1,2)=sqrt(((w(1,2)-X(131,2))^2)+((w(1,1)-X(131,2))^2));
        %w(1,:)=w(1,:)+(alpha*sqrt(((w(1,1)-X(I,1))^2)+((w(1,2)-X(I,2))^2)));
        %w=w(1,:);
end
 u=[u u1 u2]
mi=  min(u u1 u2);    

%%%%###############################
%#####ATUALIZAÇÃO DO VETOR DE PESO
alpha = 0.1
Ui=min(u)
[n m]= size(X)

h= plot(w(1,1),w(1,2),'ro');
h = plot(w(1,1),w(1,2),'go',w1(1,1),w1(1,2),'ro',w2(1,1),w2(1,2),'bo');
for J=1:n
    w(1,1)=w(1,1)+(alpha*(X(J,1)-w(1,1)));
    w(1,2)=w(1,2)+(alpha*(X(J,2)-w(1,2)));
    pause(0.01);
    set(h,'XData',w(1,1),'YData',w(1,2));
    drawnow
end
for J=1:n
    w1(1,1)=w1(1,1)+(alpha*(X(J,1)-w1(1,1)));
    w1(1,2)=w1(1,2)+(alpha*(X(J,2)-w1(1,2)));
    pause(0.01);
    set(h,'XData',w1(1,1),'YData',w1(1,2));
    drawnow
end
for J=1:n
    w2(1,1)=w2(1,1)+(alpha*(X(60,1)-w2(1,1)));
    w2(1,2)=w2(1,2)+(alpha*(X(60,2)-w2(1,2)));
    pause(0.01);
    set(h,'XData',w2(1,1),'YData',w2(1,2));
    drawnow
end
