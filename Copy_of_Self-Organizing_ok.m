load fisheriris
V = meas(:,1:2);
%##----Plotar Graficos----##%
for i = 1:2,
    mi = min(V(:,i));
    ma = max(V(:,i));
    V(:,i) = (V(:,i)-mi)/(ma-mi);
end
figure;
xlabel('X1');
ylabel('X2');
gscatter(V(:,1),V(:,2),species);

%clear, clc

title('Self-Organizing Map');
hold on

%%
t=0;
%alpha = 0.3/(1+t/300000)
M = rand(9,2);
h = plot(M(:,1),M(:,2),'ro',M(:,1),M(:,2),'k')
%%

Q = zeros(9,1);
tic
for r=1:3
for t = 1:150
    ind = randperm(size(V,1));
        V = V(ind,:);
        X=V(1,:)
    for i = 1:9
        Q(i,1) = norm(X(1,:) - M(i,:));
        
%         for j=1:o
%             u(j)=0;
%             u(j)=sqrt(((w(j,1)-X(i,1))^2)+((w(j,2)-X(i,2))^2));
%         end
        
    end
    [C,c] = min(Q);
    
    denom = 1 + t/tmax;
    a = .2/denom;
    r = round(2/denom);
    M = reshape(M,[3 3 2]);
    X = reshape(X,[1 1 2]);
    ch = mod(c-1,3) +1;
    cv = floor((c-1)/3)+1;
    for h = max(ch-r,1):min(ch+r,3)
        for v = max(cv-r,1):min(cv+r,3)
            M(h,v,:) = M(h,v,:) + ...
                a*(X(1,1,:) - M(h,v,:));
        end
    end

    pause(0.01);
    hold off
    xlabel('X1');
ylabel('X2');
gscatter(V(:,1),V(:,2),species);
hold on
%  som = plot(M(:,:,1), M(:,:,2),'ro',M(:,1,1),M(:,1,2),'k-',M(:,2,1), ...
% M(:,2,2),'k-',M(:,3,1),M(:,3,2),'k-',M(:,4,1),M(:,4,2),'k-', ...
% M(:,5,1),M(:,5,2),'k-',M(:,6,1),M(:,6,2),'k-',M(:,7,1), ...
% M(:,7,2),'k-',M(:,8,1),M(:,8,2),'k-',M(1,:,1),M(1,:,2),'k-', ...
% M(2,:,1),M(2,:,2),'k-',M(3,:,1),M(3,:,2),'k-',M(4,:,1), ...
% M(4,:,2),'k-',M(5,:,1),M(5,:,2),'k-',M(6,:,1),M(6,:,2),'k-', ...
% M(7,:,1),M(7,:,2),'k-',M(8,:,1),M(8,:,2),'k-',M(:,3,1), ...
%     M(:,3,2),'k-',M(:,4,1),M(:,4,2),'k-',0,0,'.',1,1,'.');
    som = plot(M(:,:,1), M(:,:,2),'ro',M(:,1,1),M(:,1,2),'k-',M(:,2,1), ...
    M(:,2,2),'k-',M(:,3,1),M(:,3,2),'k-',M(1,:,1),M(1,:,2),'k-', ...
    M(2,:,1),M(2,:,2),'k-',M(3,:,1),M(3,:,2),'k',0,0,'.',1,1,'.');
   
 

        M = reshape(M,[9 2]);
        X = reshape(X, [1 2]);
        
      
end
disp(r)
end
toc
%%
%###############################################
%###############################################
%###############################################
%###############################################
clear all, clc
V = rands(2,1000);
%w = ones(25,2)
pos = gridtop(5,5); plotsom(pos)
pos =pos'
net = newsom(V,[5 5],'hextop','linkdist')
plotsompos(net,V)
[net, TR] = train(net,V)
selforgmap([8 8],1000,3,'hextop','linkdist')
%Normalizar o pos
for i = 1:2,
    mi = min(pos(:,i));
    ma = max(pos(:,i));
    pos(:,i) = (pos(:,i)-mi)/(ma-mi);
end


format long
e=1;
V=V'
while e<=1
    epoca=200;
    M =pos
    a = .1;
    viz = 1;
    [n m]= size(V);
    tmax = n*epoca
    Q = zeros(25,1);
    rate =0;
    J=0;
    I=0;
    Error=0;
    Er_epoca=0;
    for k=1:epoca
        for t=1:n
            ind = randperm(size(V,1));
            V = V(ind,:);
            X=V(1,:);
            for i=1:25
                Q(i,1) = norm(X(1,:) - M(i,:));
            end
            [C,c] = min(Q);
            
            M = reshape(M,[5 5 2]);
            X = reshape(X,[1 1 2]);
            ch = mod(c-1,5) + 1;
            cv = floor((c-1)/5) + 1;
            
            %coefv1= I/tmax;
                     coefv1= I/tmax;
                      viz= 1*(0.01/1)^coefv1;
            %           denom = 1 + I/tmax;
            %          %a = .1/denom;
            %            r = round(1/denom);
            % vizFn=1*exp(-viz);
            %
            I=I+1;
            
            if mod(t,50) == 0 % for every 50th input
                r = 1; % SOM neighborhood radius
            else
                r = 0; % k-means clustering step
            end
            %Coeficiente de Aprendizado
            
            %coef = 1 - J/tmax;
            coef = J/tmax;
            %a= a/(1+(t/tmax));
            a = 0.1*(0.001/0.1)^coef; % learning rate
            rate(t,1)= a;
            for h = max(1,ch-r):min(5,ch+r)
                for v = max(1,cv-r):min(5,cv+r)
                    M(h,v,:) = M(h,v,:) + a*(X(1,1,:) - M(h,v,:));
                end
            end
            
            
            %          hold off
            % %             xlabel('X1');
            % %     ylabel('X2');
%              plot(V(:,1),V(:,2),'.g')
%                   pause(0.1)
%                 title('Self-Organizing Map - GUSTAVO BLIMA');
%                  hold on
%                    M = reshape(M,[5 5 2]);
%                     som = plot(M(:,:,1), M(:,:,2),'ro',M(:,1,1),M(:,1,2),'b-',M(:,2,1), ...
%                     M(:,2,2),'b-',M(:,3,1),M(:,3,2),'b',M(:,4,1),M(:,4,2),'b-',M(1,:,1),M(1,:,2),'b-', ...
%                     M(2,:,1),M(2,:,2),'b-',M(3,:,1),M(3,:,2),'b',...
%                     M(:,5,1),M(:,5,2),'b-',M(5,:,1),M(5,:,2),'b-',...
%                     M(4,:,1), M(4,:,2),'b-',0,0,'.',1,1,'.');
%             
            
            M = reshape(M,[25 2]);
            X = reshape(X,[1 2]);
            J = J+1;
            
           
                Error(t,1) =  min(Q);
           
            rate(k,1)= a;    
        end
            Er_epoca(k,1)= mean(Error)
          disp('Treinamento...')
            disp('Epoca Atualizada')
            disp(k)
    end
        Erro_Tr_M(e,1)= mean(Er_epoca)
        e=e+1;
        beep
        filename = ['C:\Users\Claudia\Documents\MATLAB\SOMx5_Test\SOM_x5_Rand_Test', int2str(e), '.mat'];
        save(filename)
        disp('GustavoBlima')
end











%%

















%%

%%[dW, ls]=learnsom(w,p,[],[],a,[],[],[],[],d,lp,ls)
for t= 1:10
[dW, ls]=learnsom(w,p,[],[],a,[],[],[],[],d,lp,ls)
plotsompos(net,X)
end
meas = meas'
lp.order_lr = 0.2
lp.order_steps = 150
lp.tune_lr = 0.02
lp.tune_nd = 1
a = rand(9,1)
p = X
w = rand(9,2)
pos = gridtop(3,3); %plotsom(pos)
d = linkdist(pos)
plotsompos(net,meas)
ls = [];





