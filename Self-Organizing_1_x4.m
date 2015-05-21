clear all, clc
delete(h)
load fisheriris
X = meas(:,1:2);
%X = meas
%##----Plotar Graficos----##%
fig = figure;
xlabel('Eixo X1');
ylabel('Eixo Y1');
gscatter(X(:,1),X(:,2),species);

title('Self-Organizing Map - GUSTAVO BLIMA');
hold on

w = [4.5 2.2;3.5 2;4.5 2.6;4.5 3.7;4.5 2;6 2;6.5 2;7 2;8 2;4.5 2.2;3.5 2;4.5 2.6;4.5 3.7;4.5 2;6 2;6.5 2];
h = plot(w(:,1),w(:,2),'ro') %,w(:,1),w(:,2),'k')
%#####--Teste com 64 pesos aleatorios--###
%w = rands([2 6],64,2)
%###

%%
result=0;
epoca=100;
ciclo=0;
alpha = 0.15
vizFn = 1
%Ui=min(u)
[n m]= size(X)
[o p]= size(w)
t= n
tmax = n*epoca
Q = zeros(16,1)
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
        elseif u(1,10) == min(u)
            result=10;
        elseif u(1,11) == min(u)
            result=11;
        elseif u(1,12) == min(u)
            result=12;
        elseif u(1,13) == min(u)
            result=13;
        elseif u(1,14) == min(u)
            result=14;
        elseif u(1,15) == min(u)
            result=15;
        elseif u(1,16) == min(u)
            result=16;
            
        end
        
        switch(result)
            case 1
                disp('result is 1')
                w(1,1)=w(1,1)+(alpha*(X(i,1)-w(1,1)));
                w(1,2)=w(1,2)+(alpha*(X(i,2)-w(1,2)));
                w(2,1)=w(2,1)+(alpha*vizFn*(X(i,1)-w(2,1)));
                w(2,2)=w(2,2)+(alpha*vizFn*(X(i,2)-w(2,2)));
                w(5,1)=w(5,1)+(alpha*vizFn*(X(i,1)-w(5,1)));
                w(5,2)=w(5,2)+(alpha*vizFn*(X(i,2)-w(5,2)));
                %                 w(6,1)=w(6,1)+(alpha*vizFn*(X(i,1)-w(6,1)));
                %                 w(6,2)=w(6,2)+(alpha*vizFn*(X(i,2)-w(6,2)));
                pause (0.01);
            case 2
                disp('result is 2')
                w(2,1)=w(2,1)+(alpha*(X(i,1)-w(2,1)));
                w(2,2)=w(2,2)+(alpha*(X(i,2)-w(2,2)));
                w(6,1)=w(6,1)+(alpha*vizFn*(X(i,1)-w(6,1)));
                w(6,2)=w(6,2)+(alpha*vizFn*(X(i,2)-w(6,2)));
                w(1,1)=w(1,1)+(alpha*vizFn*(X(i,1)-w(1,1)));
                w(1,2)=w(1,2)+(alpha*vizFn*(X(i,2)-w(1,2)));
                w(3,1)=w(3,1)+(alpha*vizFn*(X(i,1)-w(3,1)));
                w(3,2)=w(3,2)+(alpha*vizFn*(X(i,2)-w(3,2)));
                pause (0.01);
            case 3
                disp('result is 3')
                w(3,1)=w(3,1)+(alpha*(X(i,1)-w(3,1)));
                w(3,2)=w(3,2)+(alpha*(X(i,2)-w(3,2)));
                w(2,1)=w(2,1)+(alpha*vizFn*(X(i,1)-w(2,1)));
                w(2,2)=w(2,2)+(alpha*vizFn*(X(i,2)-w(2,2)));
                w(7,1)=w(7,1)+(alpha*vizFn*(X(i,1)-w(7,1)));
                w(7,2)=w(7,2)+(alpha*vizFn*(X(i,2)-w(7,2)));
                w(4,1)=w(4,1)+(alpha*vizFn*(X(i,1)-w(4,1)));
                w(4,2)=w(4,2)+(alpha*vizFn*(X(i,2)-w(4,2)));
                
                
                pause(0.01);
            case 4
                disp('result is 4')
                w(4,1)=w(4,1)+(alpha*(X(i,1)-w(4,1)));
                w(4,2)=w(4,2)+(alpha*(X(i,2)-w(4,2)));
                w(3,1)=w(3,1)+(alpha*vizFn*(X(i,1)-w(3,1)));
                w(3,2)=w(3,2)+(alpha*vizFn*(X(i,2)-w(3,2)));
                %                 w(7,1)=w(7,1)+(alpha*vizFn*(X(i,1)-w(7,1)));
                %                 w(7,2)=w(7,2)+(alpha*vizFn*(X(i,2)-w(7,2)));
                w(8,1)=w(8,1)+(alpha*vizFn*(X(i,1)-w(8,1)));
                w(8,2)=w(8,2)+(alpha*vizFn*(X(i,2)-w(8,2)));
                pause(0.01);
            case 5
                disp('result is 5')
                w(5,1)=w(5,1)+(alpha*(X(i,1)-w(5,1)));
                w(5,2)=w(5,2)+(alpha*(X(i,2)-w(5,2)));
                w(1,1)=w(1,1)+(alpha*vizFn*(X(i,1)-w(1,1)));
                w(1,2)=w(1,2)+(alpha*vizFn*(X(i,2)-w(1,2)));
                w(9,1)=w(9,1)+(alpha*vizFn*(X(i,1)-w(9,1)));
                w(9,2)=w(9,2)+(alpha*vizFn*(X(i,2)-w(9,2)));
                w(6,1)=w(6,1)+(alpha*vizFn*(X(i,1)-w(6,1)));
                w(6,2)=w(6,2)+(alpha*vizFn*(X(i,2)-w(6,2)));
                pause(0.01);
            case 6
                disp('result is 6')
                w(6,1)=w(6,1)+(alpha*(X(i,1)-w(6,1)));
                w(6,2)=w(6,2)+(alpha*(X(i,2)-w(6,2)));
                w(2,1)=w(2,1)+(alpha*vizFn*(X(i,1)-w(2,1)));
                w(2,2)=w(2,2)+(alpha*vizFn*(X(i,2)-w(2,2)));
                w(5,1)=w(5,1)+(alpha*vizFn*(X(i,1)-w(5,1)));
                w(5,2)=w(5,2)+(alpha*vizFn*(X(i,2)-w(5,2)));
                w(10,1)=w(10,1)+(alpha*vizFn*(X(i,1)-w(10,1)));
                w(10,2)=w(10,2)+(alpha*vizFn*(X(i,2)-w(10,2)));
                w(7,1)=w(7,1)+(alpha*vizFn*(X(i,1)-w(7,1)));
                w(7,2)=w(7,2)+(alpha*vizFn*(X(i,2)-w(7,2)));
                pause(0.01);
            case 7
                disp('result is 7')
                w(7,1)=w(7,1)+(alpha*(X(i,1)-w(7,1)));
                w(7,2)=w(7,2)+(alpha*(X(i,2)-w(7,2)));
                w(3,1)=w(3,1)+(alpha*vizFn*(X(i,1)-w(3,1)));
                w(3,2)=w(3,2)+(alpha*vizFn*(X(i,2)-w(3,2)));
                w(6,1)=w(6,1)+(alpha*vizFn*(X(i,1)-w(6,1)));
                w(6,2)=w(6,2)+(alpha*vizFn*(X(i,2)-w(6,2)));
                w(11,1)=w(11,1)+(alpha*vizFn*(X(i,1)-w(11,1)));
                w(11,2)=w(11,2)+(alpha*vizFn*(X(i,2)-w(11,2)));
                w(8,1)=w(8,1)+(alpha*vizFn*(X(i,1)-w(8,1)));
                w(8,2)=w(8,2)+(alpha*vizFn*(X(i,2)-w(8,2)));
                pause(0.01);
            case 8
                disp('result is 8')
                w(8,1)=w(8,1)+(alpha*(X(i,1)-w(8,1)));
                w(8,2)=w(8,2)+(alpha*(X(i,2)-w(8,2)));
                w(7,1)=w(7,1)+(alpha*vizFn*(X(i,1)-w(7,1)));
                w(7,2)=w(7,2)+(alpha*vizFn*(X(i,2)-w(7,2)));
                w(4,1)=w(4,1)+(alpha*vizFn*(X(i,1)-w(4,1)));
                w(4,2)=w(4,2)+(alpha*vizFn*(X(i,2)-w(4,2)));
                w(12,1)=w(12,1)+(alpha*vizFn*(X(i,1)-w(12,1)));
                w(12,2)=w(12,2)+(alpha*vizFn*(X(i,2)-w(12,2)));
                pause(0.01);
            case 9
                disp('result is 9')
                w(9,1)=w(9,1)+(alpha*(X(i,1)-w(9,1)));
                w(9,2)=w(9,2)+(alpha*(X(i,2)-w(9,2)));
                w(5,1)=w(5,1)+(alpha*vizFn*(X(i,1)-w(5,1)));
                w(5,2)=w(5,2)+(alpha*vizFn*(X(i,2)-w(5,2)));
                w(10,1)=w(10,1)+(alpha*vizFn*(X(i,1)-w(10,1)));
                w(10,2)=w(10,2)+(alpha*vizFn*(X(i,2)-w(10,2)));
                w(13,1)=w(13,1)+(alpha*vizFn*(X(i,1)-w(13,1)));
                w(13,2)=w(13,2)+(alpha*vizFn*(X(i,2)-w(13,2)));
                pause(0.01);
            case 10
                w(10,1)=w(10,1)+(alpha*(X(i,1)-w(10,1)));
                w(10,2)=w(10,2)+(alpha*(X(i,2)-w(10,2)));
                w(6,1)=w(6,1)+(alpha*vizFn*(X(i,1)-w(6,1)));
                w(6,2)=w(6,2)+(alpha*vizFn*(X(i,2)-w(6,2)));
                w(9,1)=w(9,1)+(alpha*vizFn*(X(i,1)-w(9,1)));
                w(9,2)=w(9,2)+(alpha*vizFn*(X(i,2)-w(9,2)));
                w(11,1)=w(11,1)+(alpha*vizFn*(X(i,1)-w(11,1)));
                w(11,2)=w(11,2)+(alpha*vizFn*(X(i,2)-w(11,2)));
                w(14,1)=w(14,1)+(alpha*vizFn*(X(i,1)-w(14,1)));
                w(14,2)=w(14,2)+(alpha*vizFn*(X(i,2)-w(14,2)));
            case 11
                w(11,1)=w(11,1)+(alpha*(X(i,1)-w(11,1)));
                w(11,2)=w(11,2)+(alpha*(X(i,2)-w(11,2)));
                w(10,1)=w(10,1)+(alpha*vizFn*(X(i,1)-w(10,1)));
                w(10,2)=w(10,2)+(alpha*vizFn*(X(i,2)-w(10,2)));
                w(7,1)=w(7,1)+(alpha*vizFn*(X(i,1)-w(7,1)));
                w(7,2)=w(7,2)+(alpha*vizFn*(X(i,2)-w(7,2)));
                w(15,1)=w(15,1)+(alpha*vizFn*(X(i,1)-w(15,1)));
                w(15,2)=w(15,2)+(alpha*vizFn*(X(i,2)-w(15,2)));
                w(12,1)=w(12,1)+(alpha*vizFn*(X(i,1)-w(12,1)));
                w(12,2)=w(12,2)+(alpha*vizFn*(X(i,2)-w(12,2)));
            case 12
                w(12,1)=w(12,1)+(alpha*(X(i,1)-w(12,1)));
                w(12,2)=w(12,2)+(alpha*(X(i,2)-w(12,2)));
                w(8,1)=w(8,1)+(alpha*vizFn*(X(i,1)-w(8,1)));
                w(8,2)=w(8,2)+(alpha*vizFn*(X(i,2)-w(8,2)));
                w(16,1)=w(16,1)+(alpha*vizFn*(X(i,1)-w(16,1)));
                w(16,2)=w(16,2)+(alpha*vizFn*(X(i,2)-w(16,2)));
                w(11,1)=w(11,1)+(alpha*vizFn*(X(i,1)-w(11,1)));
                w(11,2)=w(11,2)+(alpha*vizFn*(X(i,2)-w(11,2)));
            case 13
                w(13,1)=w(13,1)+(alpha*(X(i,1)-w(13,1)));
                w(13,2)=w(13,2)+(alpha*(X(i,2)-w(13,2)));
                w(9,1)=w(9,1)+(alpha*vizFn*(X(i,1)-w(9,1)));
                w(9,2)=w(9,2)+(alpha*vizFn*(X(i,2)-w(9,2)));
                w(14,1)=w(14,1)+(alpha*vizFn*(X(i,1)-w(14,1)));
                w(14,2)=w(14,2)+(alpha*vizFn*(X(i,2)-w(14,2)));
            case 14
                w(14,1)=w(14,1)+(alpha*(X(i,1)-w(14,1)));
                w(14,2)=w(14,2)+(alpha*(X(i,2)-w(14,2)));
                w(10,1)=w(10,1)+(alpha*vizFn*(X(i,1)-w(10,1)));
                w(10,2)=w(10,2)+(alpha*vizFn*(X(i,2)-w(10,2)));
                w(15,1)=w(15,1)+(alpha*vizFn*(X(i,1)-w(15,1)));
                w(15,2)=w(15,2)+(alpha*vizFn*(X(i,2)-w(15,2)));
                w(13,1)=w(13,1)+(alpha*vizFn*(X(i,1)-w(13,1)));
                w(13,2)=w(13,2)+(alpha*vizFn*(X(i,2)-w(13,2)));
            case 15
                w(15,1)=w(15,1)+(alpha*(X(i,1)-w(15,1)));
                w(15,2)=w(15,2)+(alpha*(X(i,2)-w(15,2)));
                w(14,1)=w(14,1)+(alpha*vizFn*(X(i,1)-w(14,1)));
                w(14,2)=w(14,2)+(alpha*vizFn*(X(i,2)-w(14,2)));
                w(11,1)=w(11,1)+(alpha*vizFn*(X(i,1)-w(11,1)));
                w(11,2)=w(11,2)+(alpha*vizFn*(X(i,2)-w(11,2)));
                w(16,1)=w(16,1)+(alpha*vizFn*(X(i,1)-w(16,1)));
                w(16,2)=w(16,2)+(alpha*vizFn*(X(i,2)-w(16,2)));
            case 16
                w(16,1)=w(16,1)+(alpha*(X(i,1)-w(16,1)));
                w(16,2)=w(16,2)+(alpha*(X(i,2)-w(16,2)));
                w(15,1)=w(15,1)+(alpha*vizFn*(X(i,1)-w(15,1)));
                w(15,2)=w(15,2)+(alpha*vizFn*(X(i,2)-w(15,2)));
                w(12,1)=w(12,1)+(alpha*vizFn*(X(i,1)-w(12,1)));
                w(12,2)=w(12,2)+(alpha*vizFn*(X(i,2)-w(12,2)));
                
            otherwise
                disp('Resultado finalizado')
                
        end
        %set(h,'XData',w(:,1),'YData',w(:,2));
        %drawnow
         w = reshape(w,[4 4 2]);
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
           hold on
%          som = plot(w(:,:,1), w(:,:,2),'ro',w(:,1,1),w(:,1,2),'k-',w(:,2,1), ...
%     w(:,2,2),'k-',w(:,3,1),w(:,3,2),'k-',w(1,:,1),w(1,:,2),'k-', ...
%     w(2,:,1),w(2,:,2),'k-',w(3,:,1),w(3,:,2),'k',0,0,'.',1,1,'.');
   
  som = plot(w(:,:,1), w(:,:,2),'ro',w(:,1,1),w(:,1,2),'k-',w(:,2,1), ...
    w(:,2,2),'k-',w(:,3,1),w(:,3,2),'k',w(:,4,1),w(:,4,2),'k-',w(1,:,1),w(1,:,2),'k-', ...
    w(2,:,1),w(2,:,2),'k-',w(3,:,1),w(3,:,2),'k',...
    w(4,:,1), w(4,:,2),'k-',0,0,'.',1,1,'.');

    if vizFn > 0
        vizFn= vizFn-0.00007
    else
        vizFn = 0;
    end
        ciclo=ciclo+1;
        %Error(k,1) = sum(pj)/n
        ind = randperm(size(X,1));
        X = X(ind,:);
        disp('Epoca Atualizada')
        disp(ciclo)
        w = reshape(w,[16 2]);
    end
    alpha = alpha*(1-(i/tmax));
end
    
