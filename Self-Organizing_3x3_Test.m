clear all, clc
delete(h)
load fisheriris
X = meas(:,1:2);
for i = 1:2,
    mi = min(X(:,i));
    ma = max(X(:,i));
    X(:,i) = (X(:,i)-mi)/(ma-mi);
end
%X = meas
%##----Plotar Graficos----##%
fig = figure;
xlabel('X1');
ylabel('X2');
gscatter(X(:,1),X(:,2),species);

title('Self-Organizing Map');
hold on

%w = [4.5 2.2;3.5 2;4.5 2.6;4.5 3.7;4.5 2;6 2;6.5 2;7 2;8 2];
% w = [0 0 0;0 0 0;0 0 0];
w = [0];
h = plot(w,'ro') %,w(:,1),w(:,2),'k')
%#####--Teste com 64 pesos aleatorios--###
%w = rands([2 6],64,2)
%###

%%
result=0;
epoca=5;
ciclo=0;
alpha = 0.1
vizFn = 1
%Ui=min(u)
[n m]= size(X)
[o p]= size(w)
t= n
tmax = n*epoca
%%
for k=1:epoca
    for i=1:n
        for j=1:o
            u(j)=0;
            u(j)=sqrt(((w(j,1)-X(i,1))^2)+((w(j,2)-X(i,2))^2));
        end
         Q(i,1) = min(u);
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
                disp('result is 1')
            
                w(1,1)=w(1,1)+(alpha*(X(i,1)-w(1,1)));
                  
                
                %                 w(1,1)=w(1,1)+(alpha*(X(i,1)-w(1,1)));
%                 w(1,2)=w(1,2)+(alpha*vizFn*(X(i,2)-w(1,2)));   
%                 w(2,1)=w(2,1)+(alpha*vizFn*(X(i,1)-w(2,1)));
%                 w(2,2)=w(2,2)+(alpha*vizFn*(X(i,2)-w(2,2)));
%                 pause (0.01);
            case 2
                disp('result is 2')
%                 w(2,1)=w(2,1)+(alpha*(X(i,1)-w(2,1)));
%                 w(2,2)=w(2,2)+(alpha*(X(i,2)-w(2,2)));
%                 
%                 w(1,1)=w(1,1)+(alpha*vizFn*(X(i,1)-w(1,1)));
%                 w(1,2)=w(1,2)+(alpha*vizFn*(X(i,2)-w(1,2)));
%                 
%                 w(3,1)=w(3,1)+(alpha*vizFn*(X(i,1)-w(3,1)));
%                 w(3,2)=w(3,2)+(alpha*vizFn*(X(i,2)-w(3,2)));
%                 
%                 w(4,1)=w(4,1)+(alpha*vizFn*(X(i,1)-w(4,1)));
%                 w(4,2)=w(4,2)+(alpha*vizFn*(X(i,2)-w(4,2)));
%                 
%                 w(5,1)=w(5,1)+(alpha*vizFn*(X(i,1)-w(5,1)));
%                 w(5,2)=w(5,2)+(alpha*vizFn*(X(i,2)-w(5,2)));
%                 
%                 w(6,1)=w(6,1)+(alpha*vizFn*(X(i,1)-w(6,1)));
%                 w(6,2)=w(6,2)+(alpha*vizFn*(X(i,2)-w(6,2)));
%                 pause (0.01);
            case 3
                disp('result is 3')
%                 w(3,1)=w(3,1)+(alpha*(X(i,1)-w(3,1)));
%                 w(3,2)=w(3,2)+(alpha*(X(i,2)-w(3,2)));
%                 
%                 w(2,1)=w(2,1)+(alpha*vizFn*(X(i,1)-w(2,1)));
%                 w(2,2)=w(2,2)+(alpha*vizFn*(X(i,2)-w(2,2)));
%                 
%                 w(5,1)=w(5,1)+(alpha*vizFn*(X(i,1)-w(5,1)));
%                 w(5,2)=w(5,2)+(alpha*vizFn*(X(i,2)-w(5,2)));
%                 
%                 w(6,1)=w(6,1)+(alpha*vizFn*(X(i,1)-w(6,1)));
%                 w(6,2)=w(6,2)+(alpha*vizFn*(X(i,2)-w(6,2)));
%                 
%                 pause(0.01);
            case 4
                disp('result is 4')
%                 w(4,1)=w(4,1)+(alpha*(X(i,1)-w(4,1)));
%                 w(4,2)=w(4,2)+(alpha*(X(i,2)-w(4,2)));
%                 w(1,1)=w(1,1)+(alpha*vizFn*(X(i,1)-w(1,1)));
%                 w(1,2)=w(1,2)+(alpha*vizFn*(X(i,2)-w(1,2)));
%                 w(5,1)=w(5,1)+(alpha*vizFn*(X(i,1)-w(5,1)));
%                 w(5,2)=w(5,2)+(alpha*vizFn*(X(i,2)-w(5,2)));
%                 w(2,1)=w(2,1)+(alpha*vizFn*(X(i,1)-w(2,1)));
%                 w(2,2)=w(2,2)+(alpha*vizFn*(X(i,2)-w(2,2)));
%                 w(7,1)=w(7,1)+(alpha*vizFn*(X(i,1)-w(7,1)));
%                 w(7,2)=w(7,2)+(alpha*vizFn*(X(i,2)-w(7,2)));
%                 w(8,1)=w(8,1)+(alpha*vizFn*(X(i,1)-w(8,1)));
%                 w(8,2)=w(8,2)+(alpha*vizFn*(X(i,2)-w(8,2)));
%                 pause(0.01);
            case 5
                disp('result is 5')
%                 w(5,1)=w(5,1)+(alpha*(X(i,1)-w(5,1)));
%                 w(5,2)=w(5,2)+(alpha*(X(i,2)-w(5,2)));
%                 w(1,1)=w(1,1)+(alpha*vizFn*(X(i,1)-w(1,1)));
%                 w(1,2)=w(1,2)+(alpha*vizFn*(X(i,2)-w(1,2)));
%                 w(2,1)=w(2,1)+(alpha*vizFn*(X(i,1)-w(2,1)));
%                 w(2,2)=w(2,2)+(alpha*vizFn*(X(i,2)-w(2,2)));
%                 w(3,1)=w(3,1)+(alpha*vizFn*(X(i,1)-w(3,1)));
%                 w(3,2)=w(3,2)+(alpha*vizFn*(X(i,2)-w(3,2)));
%                 w(4,1)=w(4,1)+(alpha*vizFn*(X(i,1)-w(4,1)));
%                 w(4,2)=w(4,2)+(alpha*vizFn*(X(i,2)-w(4,2)));
%                 w(6,1)=w(6,1)+(alpha*vizFn*(X(i,1)-w(6,1)));
%                 w(6,2)=w(6,2)+(alpha*vizFn*(X(i,2)-w(6,2)));
%                 w(7,1)=w(7,1)+(alpha*vizFn*(X(i,1)-w(7,1)));
%                 w(7,2)=w(7,2)+(alpha*vizFn*(X(i,2)-w(7,2)));
%                 w(8,1)=w(8,1)+(alpha*vizFn*(X(i,1)-w(8,1)));
%                 w(8,2)=w(8,2)+(alpha*vizFn*(X(i,2)-w(8,2)));
%                 w(9,1)=w(9,1)+(alpha*vizFn*(X(i,1)-w(9,1)));
%                 w(9,2)=w(9,2)+(alpha*vizFn*(X(i,2)-w(9,2)));
%                 pause(0.01);
            case 6
                disp('result is 6')
%                 w(6,1)=w(6,1)+(alpha*vizFn*(X(i,1)-w(6,1)));
%                 w(6,2)=w(6,2)+(alpha*vizFn*(X(i,2)-w(6,2)));
%                 w(2,1)=w(2,1)+(alpha*vizFn*(X(i,1)-w(2,1)));
%                 w(2,2)=w(2,2)+(alpha*vizFn*(X(i,2)-w(2,2)));
%                 w(3,1)=w(3,1)+(alpha*vizFn*(X(i,1)-w(3,1)));
%                 w(3,2)=w(3,2)+(alpha*vizFn*(X(i,2)-w(3,2)));
%                 w(5,1)=w(5,1)+(alpha*vizFn*(X(i,1)-w(5,1)));
%                 w(5,2)=w(5,2)+(alpha*vizFn*(X(i,2)-w(5,2)));
%                 w(8,1)=w(8,1)+(alpha*vizFn*(X(i,1)-w(8,1)));
%                 w(8,2)=w(8,2)+(alpha*vizFn*(X(i,2)-w(8,2)));
%                 w(8,1)=w(8,1)+(alpha*vizFn*(X(i,1)-w(8,1)));
%                 w(8,2)=w(8,2)+(alpha*vizFn*(X(i,2)-w(8,2)));
%                 pause(0.01);
            case 7
                disp('result is 7')
%                 w(7,1)=w(7,1)+(alpha*(X(i,1)-w(7,1)));
%                 w(7,2)=w(7,2)+(alpha*(X(i,2)-w(7,2)));
%                 w(4,1)=w(4,1)+(alpha*vizFn*(X(i,1)-w(4,1)));
%                 w(4,2)=w(4,2)+(alpha*vizFn*(X(i,2)-w(4,2)));
%                 w(5,1)=w(5,1)+(alpha*vizFn*(X(i,1)-w(5,1)));
%                 w(5,2)=w(5,2)+(alpha*vizFn*(X(i,2)-w(5,2)));
%                 w(8,1)=w(8,1)+(alpha*vizFn*(X(i,1)-w(8,1)));
%                 w(8,2)=w(8,2)+(alpha*vizFn*(X(i,2)-w(8,2)));
%                 pause(0.01);
            case 8
                disp('result is 8')
%                 w(8,1)=w(8,1)+(alpha*(X(i,1)-w(8,1)));
%                 w(8,2)=w(8,2)+(alpha*(X(i,2)-w(8,2)));
%                 w(7,1)=w(7,1)+(alpha*vizFn*(X(i,1)-w(7,1)));
%                 w(7,2)=w(7,2)+(alpha*vizFn*(X(i,2)-w(7,2)));
%                 w(4,1)=w(4,1)+(alpha*vizFn*(X(i,1)-w(4,1)));
%                 w(4,2)=w(4,2)+(alpha*vizFn*(X(i,2)-w(4,2)));
%                 w(5,1)=w(5,1)+(alpha*vizFn*(X(i,1)-w(5,1)));
%                 w(5,2)=w(5,2)+(alpha*vizFn*(X(i,2)-w(5,2)));
%                 w(6,1)=w(6,1)+(alpha*vizFn*(X(i,1)-w(6,1)));
%                 w(6,2)=w(6,2)+(alpha*vizFn*(X(i,2)-w(6,2)));
%                 w(9,1)=w(9,1)+(alpha*vizFn*(X(i,1)-w(9,1)));
%                 w(9,2)=w(9,2)+(alpha*vizFn*(X(i,2)-w(9,2)));
%                 pause(0.01);
            case 9
                disp('result is 9')
%                 w(9,1)=w(9,1)+(alpha*(X(i,1)-w(9,1)));
%                 w(9,2)=w(9,2)+(alpha*(X(i,2)-w(9,2)));
%                 w(5,1)=w(5,1)+(alpha*vizFn*(X(i,1)-w(5,1)));
%                 w(5,2)=w(5,2)+(alpha*vizFn*(X(i,2)-w(5,2)));
%                 w(8,1)=w(8,1)+(alpha*vizFn*(X(i,1)-w(8,1)));
%                 w(8,2)=w(8,2)+(alpha*vizFn*(X(i,2)-w(8,2)));
%                 pause(0.01);
            otherwise
                disp('Resultado finalizado')
                
        end
        %set(h,'XData',w(:,1),'YData',w(:,2));
        %drawnow
        % w = reshape(w,[3 3 2]);
        hold off
        xlabel('X1');
ylabel('X2');
gscatter(X(:,1),X(:,2),species);

title('Self-Organizing Map');
% %         som = plot(w(:,:,1), w(:,:,2),'ro',w(:,1,1),w(:,1,2),'k-',w(:,2,1), ...
% %             w(:,2,2),'k-',w(:,3,1),w(:,3,2),'k-',w(:,4,1),w(:,4,2),'k-', ...
% %             w(:,5,1),w(:,5,2),'k-',w(:,6,1),w(:,6,2),'k-',w(:,7,1), ...
% %             w(:,7,2),'k-',w(:,8,1),w(:,8,2),'k-',w(1,:,1),w(1,:,2),'k-', ...
% %             w(2,:,1),w(2,:,2),'k-',w(3,:,1),w(3,:,2),'k-',w(4,:,1), ...
% %             w(4,:,2),'k-',w(5,:,1),w(5,:,2),'k-',w(6,:,1),w(6,:,2),'k-', ...
% %             w(7,:,1),w(7,:,2),'k-',w(8,:,1),w(8,:,2),'k-',w(:,3,1), ...
% %             w(:,3,2),'k-',w(:,4,1),w(:,4,2),'k-',0,0,'.',1,1,'.');
%           hold on
%          som = plot(w(:,:,1), w(:,:,2),'ro',w(:,1,1),w(:,1,2),'k-',w(:,2,1), ...
%     w(:,2,2),'k-',w(:,3,1),w(:,3,2),'k-',w(1,:,1),w(1,:,2),'k-', ...
%     w(2,:,1),w(2,:,2),'k-',w(3,:,1),w(3,:,2),'k',0,0,'.',1,1,'.');
%    
  vizFn= vizFn-0.00006
        ciclo=ciclo+1;
        %Error(k,1) = sum(pj)/n
        ind = randperm(size(X,1));
        X = X(ind,:);
        disp('Epoca Atualizada')
        disp(ciclo)
     %   w = reshape(w,[9 2]);
    end
    alpha = alpha*(1-(t/tmax));
end
    
