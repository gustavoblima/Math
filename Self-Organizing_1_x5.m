clear all, clc
delete(h)
load fisheriris
X = meas(:,1:2);
V = rands(2,1000);
plot(V(:,1),V(:,2),'.g')
V = V'
X=V
for i = 1:2,
    mi = min(X(:,i));
    ma = max(X(:,i));
    X(:,i) = (X(:,i)-mi)/(ma-mi);
end

%##----Plotar Graficos----##%
fig = figure;
xlabel('Eixo X1');
ylabel('Eixo Y1');
gscatter(X(:,1),X(:,2),species);

title('Self-Organizing Map - GUSTAVO BLIMA');
hold on

 %w = [4.5 2.2;3.5 2;4.5 2.6;4.5 3.7;4.5 2;6 2;6.5 2;7 2;8 2;4.5 2.2;3.5 2;4.5 2.6;4.5 3.7;4.5 2;6 2;6.5 2;0 0;8 2;4.5 2.2;3.5 2;4.5 2.6;4.5 3.7;4.5 2;6 2;6.5 2];
w =zeros(25,2)
h = plot(w(:,1),w(:,2),'ro') %,w(:,1),w(:,2),'k')
%#####--Teste com 64 pesos aleatorios--###
%w = rands([2 6],64,2)
%###

%%
result=0;
epoca=100;
ciclo=0;
alpha = 0.3
vizFn = 1
%Ui=min(u)
[n m]= size(X)
[o p]= size(w)
t= n
tmax = n*epoca
Q = zeros(25,1);
J=0;
%%
for k=1:epoca
    for i=1:n
         ind = randperm(size(V,1));
                 V = V(ind,:);
                X = V(1,:)
        for j=1:o
            u(j)=0;
            u(j)=sqrt(((w(j,1)-X(1,1))^2)+((w(j,2)-X(1,2))^2));
        end
        Q(i,1) = min(u);
        [C,c] = min(u);
        J = J+1;
        coef = 1 - J/tmax;
        alpha = 0.3*coef; % learning rate
        %Taxa vizinhaca
        coefv1= i/tmax;
            vizFn= 1*(0.01/1)^coefv1;
            vizFMtrix(i,1)=vizFn;
            coefv2= vizFn^2
            
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
        elseif u(1,17) == min(u)
            result=17;
        elseif u(1,18) == min(u)
            result=18;
        elseif u(1,19) == min(u)
            result=19;
        elseif u(1,20) == min(u)
            result=20;
        elseif u(1,21) == min(u)
            result=21;
        elseif u(1,22) == min(u)
            result=22;
        elseif u(1,23) == min(u)
            result=23;
        elseif u(1,24) == min(u)
            result=24;
        elseif u(1,25) == min(u)
            result=25;
        end
        
        switch(result)
            case 1
                %                 disp('result is 1');
                w(1,1)=w(1,1)+(alpha*vizFn*(X(i,1)-w(1,1)));
                w(1,2)=w(1,2)+(alpha*vizFn*(X(i,2)-w(1,2)));
                %hci=exp(-w(1,:)-w(2,:))/coefv2
                w(2,1)=w(2,1)+(alpha*vizFn*(X(i,1)-w(2,1)));
                w(2,2)=w(2,2)+(alpha*vizFn*(X(i,2)-w(2,2)));
                w(6,1)=w(6,1)+(alpha*vizFn*(X(i,1)-w(6,1)));
                w(6,2)=w(6,2)+(alpha*vizFn*(X(i,2)-w(6,2)));
                pause (0.01);
                pj(i,1)=sqrt(((w(1,1)-X(i,1))^2)+((w(1,2)-X(i,2))^2));
            case 2
                %                 disp('result is 2');
                w(2,1)=w(2,1)+(alpha*vizFn*(X(i,1)-w(2,1)));
                w(2,2)=w(2,2)+(alpha*vizFn*(X(i,2)-w(2,2)));
                w(7,1)=w(7,1)+(alpha*vizFn*(X(i,1)-w(7,1)));
                w(7,2)=w(7,2)+(alpha*vizFn*(X(i,2)-w(7,2)));
                w(1,1)=w(1,1)+(alpha*vizFn*(X(i,1)-w(1,1)));
                w(1,2)=w(1,2)+(alpha*vizFn*(X(i,2)-w(1,2)));
                w(3,1)=w(3,1)+(alpha*vizFn*(X(i,1)-w(3,1)));
                w(3,2)=w(3,2)+(alpha*vizFn*(X(i,2)-w(3,2)));
                pause (0.01);
                pj(i,1)=sqrt(((w(2,1)-X(i,1))^2)+((w(2,2)-X(i,2))^2));
            case 3
                %                 disp('result is 3');
                w(3,1)=w(3,1)+(alpha*vizFn*(X(i,1)-w(3,1)));
                w(3,2)=w(3,2)+(alpha*vizFn*(X(i,2)-w(3,2)));
                w(2,1)=w(2,1)+(alpha*vizFn*(X(i,1)-w(2,1)));
                w(2,2)=w(2,2)+(alpha*vizFn*(X(i,2)-w(2,2)));
                w(8,1)=w(8,1)+(alpha*vizFn*(X(i,1)-w(8,1)));
                w(8,2)=w(8,2)+(alpha*vizFn*(X(i,2)-w(8,2)));
                w(4,1)=w(4,1)+(alpha*vizFn*(X(i,1)-w(4,1)));
                w(4,2)=w(4,2)+(alpha*vizFn*(X(i,2)-w(4,2)));
                
                
                pause(0.01);
                pj(i,1)=sqrt(((w(3,1)-X(i,1))^2)+((w(3,2)-X(i,2))^2));
            case 4
                %                 disp('result is 4')
                w(4,1)=w(4,1)+(alpha*vizFn*(X(i,1)-w(4,1)));
                w(4,2)=w(4,2)+(alpha*vizFn*(X(i,2)-w(4,2)));
                w(3,1)=w(3,1)+(alpha*vizFn*(X(i,1)-w(3,1)));
                w(3,2)=w(3,2)+(alpha*vizFn*(X(i,2)-w(3,2)));
                w(9,1)=w(9,1)+(alpha*vizFn*(X(i,1)-w(9,1)));
                w(9,2)=w(9,2)+(alpha*vizFn*(X(i,2)-w(9,2)));
                w(5,1)=w(5,1)+(alpha*vizFn*(X(i,1)-w(5,1)));
                w(5,2)=w(5,2)+(alpha*vizFn*(X(i,2)-w(5,2)));
                pause(0.01);
                pj(i,1)=sqrt(((w(4,1)-X(i,1))^2)+((w(4,2)-X(i,2))^2));
            case 5
                %                 disp('result is 5');
                w(5,1)=w(5,1)+(alpha*vizFn*(X(i,1)-w(5,1)));
                w(5,2)=w(5,2)+(alpha*vizFn*(X(i,2)-w(5,2)));
                w(4,1)=w(4,1)+(alpha*vizFn*(X(i,1)-w(4,1)));
                w(4,2)=w(4,2)+(alpha*vizFn*(X(i,2)-w(4,2)));
                w(10,1)=w(10,1)+(alpha*vizFn*(X(i,1)-w(10,1)));
                w(10,2)=w(10,2)+(alpha*vizFn*(X(i,2)-w(10,2)));
                
                pause(0.01);
                pj(i,1)=sqrt(((w(5,1)-X(i,1))^2)+((w(5,2)-X(i,2))^2));
            case 6
                %                 disp('result is 6')
                w(6,1)=w(6,1)+(alpha*vizFn*(X(i,1)-w(6,1)));
                w(6,2)=w(6,2)+(alpha*vizFn*(X(i,2)-w(6,2)));
                w(1,1)=w(1,1)+(alpha*vizFn*(X(i,1)-w(1,1)));
                w(1,2)=w(1,2)+(alpha*vizFn*(X(i,2)-w(1,2)));
                w(7,1)=w(7,1)+(alpha*vizFn*(X(i,1)-w(7,1)));
                w(7,2)=w(7,2)+(alpha*vizFn*(X(i,2)-w(7,2)));
                w(11,1)=w(11,1)+(alpha*vizFn*(X(i,1)-w(11,1)));
                w(11,2)=w(11,2)+(alpha*vizFn*(X(i,2)-w(11,2)));
                
                pause(0.01);
                pj(i,1)=sqrt(((w(6,1)-X(i,1))^2)+((w(6,2)-X(i,2))^2));
            case 7
                %                 disp('result is 7');
                w(7,1)=w(7,1)+(alpha*vizFn*(X(i,1)-w(7,1)));
                w(7,2)=w(7,2)+(alpha*vizFn*(X(i,2)-w(7,2)));
                w(2,1)=w(2,1)+(alpha*vizFn*(X(i,1)-w(2,1)));
                w(2,2)=w(2,2)+(alpha*vizFn*(X(i,2)-w(2,2)));
                w(6,1)=w(6,1)+(alpha*vizFn*(X(i,1)-w(6,1)));
                w(6,2)=w(6,2)+(alpha*vizFn*(X(i,2)-w(6,2)));
                w(12,1)=w(12,1)+(alpha*vizFn*(X(i,1)-w(12,1)));
                w(12,2)=w(12,2)+(alpha*vizFn*(X(i,2)-w(12,2)));
                w(8,1)=w(8,1)+(alpha*vizFn*(X(i,1)-w(8,1)));
                w(8,2)=w(8,2)+(alpha*vizFn*(X(i,2)-w(8,2)));
                pause(0.01);
                pj(i,1)=sqrt(((w(7,1)-X(i,1))^2)+((w(7,2)-X(i,2))^2));
            case 8
                %                 disp('result is 8');
                w(8,1)=w(8,1)+(alpha*vizFn*(X(i,1)-w(8,1)));
                w(8,2)=w(8,2)+(alpha*vizFn*(X(i,2)-w(8,2)));
                w(3,1)=w(3,1)+(alpha*vizFn*(X(i,1)-w(3,1)));
                w(3,2)=w(3,2)+(alpha*vizFn*(X(i,2)-w(3,2)));
                w(7,1)=w(7,1)+(alpha*vizFn*(X(i,1)-w(7,1)));
                w(7,2)=w(7,2)+(alpha*vizFn*(X(i,2)-w(7,2)));
                w(9,1)=w(9,1)+(alpha*vizFn*(X(i,1)-w(9,1)));
                w(9,2)=w(9,2)+(alpha*vizFn*(X(i,2)-w(9,2)));
                w(13,1)=w(9,1)+(alpha*vizFn*(X(i,1)-w(13,1)));
                w(13,2)=w(9,2)+(alpha*vizFn*(X(i,2)-w(13,2)));
                pause(0.01);
                pj(i,1)=sqrt(((w(8,1)-X(i,1))^2)+((w(8,2)-X(i,2))^2));
            case 9
                %                 disp('result is 9');
                w(9,1)=w(9,1)+(alpha*vizFn*(X(i,1)-w(9,1)));
                w(9,2)=w(9,2)+(alpha*vizFn*(X(i,2)-w(9,2)));
                w(8,1)=w(8,1)+(alpha*vizFn*(X(i,1)-w(8,1)));
                w(8,2)=w(8,2)+(alpha*vizFn*(X(i,2)-w(8,2)));
                w(4,1)=w(4,1)+(alpha*vizFn*(X(i,1)-w(4,1)));
                w(4,2)=w(4,2)+(alpha*vizFn*(X(i,2)-w(4,2)));
                w(10,1)=w(10,1)+(alpha*vizFn*(X(i,1)-w(10,1)));
                w(10,2)=w(10,2)+(alpha*vizFn*(X(i,2)-w(10,2)));
                w(14,1)=w(14,1)+(alpha*vizFn*(X(i,1)-w(14,1)));
                w(14,2)=w(14,2)+(alpha*vizFn*(X(i,2)-w(14,2)));
                pause(0.01);
                pj(i,1)=sqrt(((w(9,1)-X(i,1))^2)+((w(9,2)-X(i,2))^2));
            case 10
                w(10,1)=w(10,1)+(alpha*vizFn*(X(i,1)-w(10,1)));
                w(10,2)=w(10,2)+(alpha*vizFn*(X(i,2)-w(10,2)));
                w(5,1)=w(5,1)+(alpha*vizFn*(X(i,1)-w(5,1)));
                w(5,2)=w(5,2)+(alpha*vizFn*(X(i,2)-w(5,2)));
                w(9,1)=w(9,1)+(alpha*vizFn*(X(i,1)-w(9,1)));
                w(9,2)=w(9,2)+(alpha*vizFn*(X(i,2)-w(9,2)));
                w(15,1)=w(15,1)+(alpha*vizFn*(X(i,1)-w(15,1)));
                w(15,2)=w(15,2)+(alpha*vizFn*(X(i,2)-w(15,2)));
                pause(0.01);
                pj(i,1)=sqrt(((w(10,1)-X(i,1))^2)+((w(10,2)-X(i,2))^2));
            case 11
                w(11,1)=w(11,1)+(alpha*vizFn*(X(i,1)-w(11,1)));
                w(11,2)=w(11,2)+(alpha*vizFn*(X(i,2)-w(11,2)));
                w(6,1)=w(6,1)+(alpha*vizFn*(X(i,1)-w(6,1)));
                w(6,2)=w(6,2)+(alpha*vizFn*(X(i,2)-w(6,2)));
                w(16,1)=w(16,1)+(alpha*vizFn*(X(i,1)-w(16,1)));
                w(16,2)=w(16,2)+(alpha*vizFn*(X(i,2)-w(16,2)));
                w(12,1)=w(12,1)+(alpha*vizFn*(X(i,1)-w(12,1)));
                w(12,2)=w(12,2)+(alpha*vizFn*(X(i,2)-w(12,2)));
              
                pause(0.01);
                pj(i,1)=sqrt(((w(11,1)-X(i,1))^2)+((w(11,2)-X(i,2))^2));
            case 12
                w(12,1)=w(12,1)+(alpha*vizFn*(X(i,1)-w(12,1)));
                w(12,2)=w(12,2)+(alpha*vizFn*(X(i,2)-w(12,2)));
                w(7,1)=w(7,1)+(alpha*vizFn*(X(i,1)-w(7,1)));
                w(7,2)=w(7,2)+(alpha*vizFn*(X(i,2)-w(7,2)));
                w(17,1)=w(17,1)+(alpha*vizFn*(X(i,1)-w(17,1)));
                w(17,2)=w(17,2)+(alpha*vizFn*(X(i,2)-w(17,2)));
                w(11,1)=w(11,1)+(alpha*vizFn*(X(i,1)-w(11,1)));
                w(11,2)=w(11,2)+(alpha*vizFn*(X(i,2)-w(11,2)));
                w(13,1)=w(13,1)+(alpha*vizFn*(X(i,1)-w(13,1)));
                w(13,2)=w(13,2)+(alpha*vizFn*(X(i,2)-w(13,2)));
                pause(0.01);
                pj(i,1)=sqrt(((w(12,1)-X(i,1))^2)+((w(12,2)-X(i,2))^2));
            case 13
                w(13,1)=w(13,1)+(alpha*vizFn*(X(i,1)-w(13,1)));
                w(13,2)=w(13,2)+(alpha*vizFn*(X(i,2)-w(13,2)));
                w(8,1)=w(8,1)+(alpha*vizFn*(X(i,1)-w(8,1)));
                w(8,2)=w(8,2)+(alpha*vizFn*(X(i,2)-w(8,2)));
                w(14,1)=w(14,1)+(alpha*vizFn*(X(i,1)-w(14,1)));
                w(14,2)=w(14,2)+(alpha*vizFn*(X(i,2)-w(14,2)));
                w(12,1)=w(12,1)+(alpha*vizFn*(X(i,1)-w(12,1)));
                w(12,2)=w(12,2)+(alpha*vizFn*(X(i,2)-w(12,2)));
                w(18,1)=w(18,1)+(alpha*vizFn*(X(i,1)-w(18,1)));
                w(18,2)=w(18,2)+(alpha*vizFn*(X(i,2)-w(18,2)));
                pause(0.01);
                pj(i,1)=sqrt(((w(13,1)-X(i,1))^2)+((w(13,2)-X(i,2))^2));
            case 14
                w(14,1)=w(14,1)+(alpha*vizFn*(X(i,1)-w(14,1)));
                w(14,2)=w(14,2)+(alpha*vizFn*(X(i,2)-w(14,2)));
                w(9,1)=w(9,1)+(alpha*vizFn*(X(i,1)-w(9,1)));
                w(9,2)=w(9,2)+(alpha*vizFn*(X(i,2)-w(9,2)));
                w(15,1)=w(15,1)+(alpha*vizFn*(X(i,1)-w(15,1)));
                w(15,2)=w(15,2)+(alpha*vizFn*(X(i,2)-w(15,2)));
                w(13,1)=w(13,1)+(alpha*vizFn*(X(i,1)-w(13,1)));
                w(13,2)=w(13,2)+(alpha*vizFn*(X(i,2)-w(13,2)));
                w(19,1)=w(19,1)+(alpha*vizFn*(X(i,1)-w(19,1)));
                w(19,2)=w(19,2)+(alpha*vizFn*(X(i,2)-w(19,2)));
                pause(0.01);
                pj(i,1)=sqrt(((w(14,1)-X(i,1))^2)+((w(14,2)-X(i,2))^2));
            case 15
                w(15,1)=w(15,1)+(alpha*vizFn*(X(i,1)-w(15,1)));
                w(15,2)=w(15,2)+(alpha*vizFn*(X(i,2)-w(15,2)));
                w(14,1)=w(14,1)+(alpha*vizFn*(X(i,1)-w(14,1)));
                w(14,2)=w(14,2)+(alpha*vizFn*(X(i,2)-w(14,2)));
                w(10,1)=w(10,1)+(alpha*vizFn*(X(i,1)-w(10,1)));
                w(10,2)=w(10,2)+(alpha*vizFn*(X(i,2)-w(10,2)));
                w(20,1)=w(20,1)+(alpha*vizFn*(X(i,1)-w(20,1)));
                w(20,2)=w(20,2)+(alpha*vizFn*(X(i,2)-w(20,2)));
                pause(0.01);
                pj(i,1)=sqrt(((w(15,1)-X(i,1))^2)+((w(15,2)-X(i,2))^2));
            case 16
                w(16,1)=w(16,1)+(alpha*vizFn*(X(i,1)-w(16,1)));
                w(16,2)=w(16,2)+(alpha*vizFn*(X(i,2)-w(16,2)));
                w(11,1)=w(11,1)+(alpha*vizFn*(X(i,1)-w(11,1)));
                w(11,2)=w(11,2)+(alpha*vizFn*(X(i,2)-w(11,2)));
                w(17,1)=w(17,1)+(alpha*vizFn*(X(i,1)-w(17,1)));
                w(17,2)=w(17,2)+(alpha*vizFn*(X(i,2)-w(17,2)));
                w(21,1)=w(21,1)+(alpha*vizFn*(X(i,1)-w(21,1)));
                w(21,2)=w(21,2)+(alpha*vizFn*(X(i,2)-w(21,2)));
                pause(0.01);
                pj(i,1)=sqrt(((w(16,1)-X(i,1))^2)+((w(16,2)-X(i,2))^2));
            case 17
                w(17,1)=w(17,1)+(alpha*vizFn*(X(i,1)-w(17,1)));
                w(17,2)=w(17,2)+(alpha*vizFn*(X(i,2)-w(17,2)));
                w(16,1)=w(16,1)+(alpha*vizFn*(X(i,1)-w(16,1)));
                w(16,2)=w(16,2)+(alpha*vizFn*(X(i,2)-w(16,2)));
                w(12,1)=w(12,1)+(alpha*vizFn*(X(i,1)-w(12,1)));
                w(12,2)=w(12,2)+(alpha*vizFn*(X(i,2)-w(12,2)));
                w(22,1)=w(22,1)+(alpha*vizFn*(X(i,1)-w(22,1)));
                w(22,2)=w(22,2)+(alpha*vizFn*(X(i,2)-w(22,2)));
                w(18,1)=w(18,1)+(alpha*vizFn*(X(i,1)-w(18,1)));
                w(18,2)=w(18,2)+(alpha*vizFn*(X(i,2)-w(18,2)));
                pause(0.01);
                pj(i,1)=sqrt(((w(17,1)-X(i,1))^2)+((w(17,2)-X(i,2))^2));
            case 18
                w(18,1)=w(18,1)+(alpha*vizFn*(X(i,1)-w(18,1)));
                w(18,2)=w(18,2)+(alpha*vizFn*(X(i,2)-w(18,2)));
                w(13,1)=w(13,1)+(alpha*vizFn*(X(i,1)-w(13,1)));
                w(13,2)=w(13,2)+(alpha*vizFn*(X(i,2)-w(13,2)));
                w(17,1)=w(17,1)+(alpha*vizFn*(X(i,1)-w(17,1)));
                w(17,2)=w(17,2)+(alpha*vizFn*(X(i,2)-w(17,2)));
                w(19,1)=w(19,1)+(alpha*vizFn*(X(i,1)-w(19,1)));
                w(19,2)=w(19,2)+(alpha*vizFn*(X(i,2)-w(19,2)));
                w(23,1)=w(23,1)+(alpha*vizFn*(X(i,1)-w(23,1)));
                w(23,2)=w(23,2)+(alpha*vizFn*(X(i,2)-w(23,2)));
                pause(0.01);
                pj(i,1)=sqrt(((w(18,1)-X(i,1))^2)+((w(18,2)-X(i,2))^2));
            case 19
                w(19,1)=w(19,1)+(alpha*vizFn*(X(i,1)-w(19,1)));
                w(19,2)=w(19,2)+(alpha*vizFn*(X(i,2)-w(19,2)));
                w(18,1)=w(18,1)+(alpha*vizFn*(X(i,1)-w(18,1)));
                w(18,2)=w(18,2)+(alpha*vizFn*(X(i,2)-w(18,2)));
                w(20,1)=w(20,1)+(alpha*vizFn*(X(i,1)-w(20,1)));
                w(20,2)=w(20,2)+(alpha*vizFn*(X(i,2)-w(20,2)));
                w(14,1)=w(14,1)+(alpha*vizFn*(X(i,1)-w(14,1)));
                w(14,2)=w(14,2)+(alpha*vizFn*(X(i,2)-w(14,2)));
                w(24,1)=w(24,1)+(alpha*vizFn*(X(i,1)-w(24,1)));
                w(24,2)=w(24,2)+(alpha*vizFn*(X(i,2)-w(24,2)));
                pause(0.01);
                pj(i,1)=sqrt(((w(19,1)-X(i,1))^2)+((w(19,2)-X(i,2))^2));
            case 20
                w(20,1)=w(20,1)+(alpha*vizFn*(X(i,1)-w(20,1)));
                w(20,2)=w(20,2)+(alpha*vizFn*(X(i,2)-w(20,2)));
                w(19,1)=w(19,1)+(alpha*vizFn*(X(i,1)-w(19,1)));
                w(19,2)=w(19,2)+(alpha*vizFn*(X(i,2)-w(19,2)));
                w(15,1)=w(15,1)+(alpha*vizFn*(X(i,1)-w(15,1)));
                w(15,2)=w(15,2)+(alpha*vizFn*(X(i,2)-w(15,2)));
                w(25,1)=w(25,1)+(alpha*vizFn*(X(i,1)-w(25,1)));
                w(25,2)=w(25,2)+(alpha*vizFn*(X(i,2)-w(25,2)));
                pause(0.01);
                pj(i,1)=sqrt(((w(20,1)-X(i,1))^2)+((w(20,2)-X(i,2))^2));
            case 21
                w(21,1)=w(21,1)+(alpha*vizFn*(X(i,1)-w(21,1)));
                w(21,2)=w(21,2)+(alpha*vizFn*(X(i,2)-w(21,2)));
                w(16,1)=w(16,1)+(alpha*vizFn*(X(i,1)-w(16,1)));
                w(16,2)=w(16,2)+(alpha*vizFn*(X(i,2)-w(16,2)));
                w(22,1)=w(22,1)+(alpha*vizFn*(X(i,1)-w(22,1)));
                w(22,2)=w(22,2)+(alpha*vizFn*(X(i,2)-w(22,2)));
                pause(0.01);
                pj(i,1)=sqrt(((w(21,1)-X(i,1))^2)+((w(21,2)-X(i,2))^2));
            case 22
                w(22,1)=w(22,1)+(alpha*vizFn*(X(i,1)-w(22,1)));
                w(22,2)=w(22,2)+(alpha*vizFn*(X(i,2)-w(22,2)));
                w(21,1)=w(21,1)+(alpha*vizFn*(X(i,1)-w(21,1)));
                w(21,2)=w(21,2)+(alpha*vizFn*(X(i,2)-w(21,2)));
                w(17,1)=w(17,1)+(alpha*vizFn*(X(i,1)-w(17,1)));
                w(17,2)=w(17,2)+(alpha*vizFn*(X(i,2)-w(17,2)));
                w(23,1)=w(23,1)+(alpha*vizFn*(X(i,1)-w(23,1)));
                w(23,2)=w(23,2)+(alpha*vizFn*(X(i,2)-w(23,2)));
                pause(0.01);
                pj(i,1)=sqrt(((w(22,1)-X(i,1))^2)+((w(22,2)-X(i,2))^2));
            case 23
                w(23,1)=w(23,1)+(alpha*vizFn*(X(i,1)-w(23,1)));
                w(23,2)=w(23,2)+(alpha*vizFn*(X(i,2)-w(23,2)));
                w(22,1)=w(22,1)+(alpha*vizFn*(X(i,1)-w(22,1)));
                w(22,2)=w(22,2)+(alpha*vizFn*(X(i,2)-w(22,2)));
                w(24,1)=w(24,1)+(alpha*vizFn*(X(i,1)-w(24,1)));
                w(24,2)=w(24,2)+(alpha*vizFn*(X(i,2)-w(24,2)));
                w(18,1)=w(18,1)+(alpha*vizFn*(X(i,1)-w(18,1)));
                w(18,2)=w(18,2)+(alpha*vizFn*(X(i,2)-w(18,2)));
                pause(0.01);
                pj(i,1)=sqrt(((w(23,1)-X(i,1))^2)+((w(23,2)-X(i,2))^2));
            case 24
                w(24,1)=w(24,1)+(alpha*vizFn*(X(i,1)-w(24,1)));
                w(24,2)=w(24,2)+(alpha*vizFn*(X(i,2)-w(24,2)));
                w(19,1)=w(8,1)+(alpha*vizFn*(X(i,1)-w(19,1)));
                w(19,2)=w(8,2)+(alpha*vizFn*(X(i,2)-w(19,2)));
                w(23,1)=w(23,1)+(alpha*vizFn*(X(i,1)-w(23,1)));
                w(23,2)=w(23,2)+(alpha*vizFn*(X(i,2)-w(23,2)));
                w(25,1)=w(25,1)+(alpha*vizFn*(X(i,1)-w(25,1)));
                w(25,2)=w(25,2)+(alpha*vizFn*(X(i,2)-w(25,2)));
                pause(0.01);
                pj(i,1)=sqrt(((w(24,1)-X(i,1))^2)+((w(24,2)-X(i,2))^2));
            case 25
                w(25,1)=w(25,1)+(alpha*vizFn*(X(i,1)-w(25,1)));
                w(25,2)=w(25,2)+(alpha*vizFn*(X(i,2)-w(25,2)));
                w(24,1)=w(24,1)+(alpha*vizFn*(X(i,1)-w(24,1)));
                w(24,2)=w(24,2)+(alpha*vizFn*(X(i,2)-w(24,2)));
                w(20,1)=w(20,1)+(alpha*vizFn*(X(i,1)-w(20,1)));
                w(20,2)=w(20,2)+(alpha*vizFn*(X(i,2)-w(20,2)));
                pause(0.01);
                pj(i,1)=sqrt(((w(25,1)-X(i,1))^2)+((w(25,2)-X(i,2))^2));
            otherwise
                %                 disp('Resultado finalizado')
                
        end
        %set(h,'XData',w(:,1),'YData',w(:,2));
        %drawnow
        w = reshape(w,[5 5 2]);
        
        % Updating
        % %          M = reshape(M,[5 5 2]);
                  X = reshape(X,[1 1 2]);
%                  ch = mod(c-1,5) + 1;
%                  cv = floor((c-1)/5) + 1;
%                  if mod(i,50) == 0 % for every 50th input
%                      r = 1; % SOM neighborhood radius
%                  else
%                      r = 0; % k-means clustering step
%                  end
%         %          %alpha = .01; % learning rate
%                  for h = max(1,ch-r):min(5,ch+r)
%                       for v = max(1,cv-r):min(5,cv+r)
%                           w(h,v,:) = w(h,v,:) + alpha*(X(1,1,:) - w(h,v,:));
%                       end
%                   end
%         %
        
        
        %          end
     %   hold off
%                 xlabel('X1');
%         ylabel('X2');
%         title('Self-Organizing Map - GUSTAVO BLIMA');
%         gscatter(X(:,1),X(:,2),species);
% % plot(V(:,1),V(:,2),'.g')
%         pause(0.01)
       
        % %         som = plot(w(:,:,1), w(:,:,2),'ro',w(:,1,1),w(:,1,2),'k-',w(:,2,1), ...
        % %             w(:,2,2),'k-',w(:,3,1),w(:,3,2),'k-',w(:,4,1),w(:,4,2),'k-', ...
        % %             w(:,5,1),w(:,5,2),'k-',w(:,6,1),w(:,6,2),'k-',w(:,7,1), ...
        % %             w(:,7,2),'k-',w(:,8,1),w(:,8,2),'k-',w(1,:,1),w(1,:,2),'k-', ...
        % %             w(2,:,1),w(2,:,2),'k-',w(3,:,1),w(3,:,2),'k-',w(4,:,1), ...
        % %             w(4,:,2),'k-',w(5,:,1),w(5,:,2),'k-',w(6,:,1),w(6,:,2),'k-', ...
        % %             w(7,:,1),w(7,:,2),'k-',w(8,:,1),w(8,:,2),'k-',w(:,3,1), ...
        % %             w(:,3,2),'k-',w(:,4,1),w(:,4,2),'k-',0,0,'.',1,1,'.');
%                      hold on
        % %          som = plot(w(:,:,1), w(:,:,2),'ro',w(:,1,1),w(:,1,2),'k-',w(:,2,1), ...
        % %     w(:,2,2),'k-',w(:,3,1),w(:,3,2),'k-',w(1,:,1),w(1,:,2),'k-', ...
        % %     w(2,:,1),w(2,:,2),'k-',w(3,:,1),w(3,:,2),'k',0,0,'.',1,1,'.');
        % %
        som = plot(w(:,:,1), w(:,:,2),'ro',w(:,1,1),w(:,1,2),'k-',w(:,2,1), ...
            w(:,2,2),'k-',w(:,3,1),w(:,3,2),'k',w(:,4,1),w(:,4,2),'k-',w(1,:,1),w(1,:,2),'k-', ...
            w(2,:,1),w(2,:,2),'k-',w(3,:,1),w(3,:,2),'k',...
            w(:,5,1),w(:,5,2),'k-',w(5,:,1),w(5,:,2),'k-',...
            w(4,:,1), w(4,:,2),'k-',0,0,'.',1,1,'.');
        
        if vizFn > 0
            %vizFn= vizFn-0.00007;
            
        else
            vizFn = 0;
        end
        ciclo=ciclo+1;
        Error(k,1) = sum(pj)/n 
        w = reshape(w,[25 2]);
        X = reshape(X,[1 2]);
       
    end
    disp('Epoca - By GustavoBlima')
    disp(k)
end
I=0;
coefv=0;
tmax=750;
perR=0;
for ts=1:750
 
% coefv= 1*(0.01/1)^coefv1
% coefv2= coefv^2
% hci=exp(-2-2.1)/coefv2
coefv1= I/tmax;
per=1*exp(-coefv1);
perR(ts,1) = per
end

I=I+1;

% KNN DESCOBRIR ROTULOS DE NEURONIOS
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