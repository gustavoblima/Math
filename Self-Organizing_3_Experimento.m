clear all, clc
V = rands(2,1000);
%w = ones(25,2)
pos = gridtop(5,5); plotsom(pos)
D = linkdist(pos);
pdist2(x,W)
ind = D(1,:) <= 1
W =(ind,:)
pos =pos'
net = newsom(V,[5 5],'gridtop','linkdist')
plotsompos(net,V)
[net, TR] = train(net,V)
%Normalizar o pos
for i = 1:2,
    mi = min(pos(:,i));
    ma = max(pos(:,i));
    pos(:,i) = (pos(:,i)-mi)/(ma-mi);
end
%% USANDO FUNÇÂO MATLAB ACIMA
clear all, clc
% load fisheriris
% V = meas(:,1:2);
 V = rands(2,1000);
% plot(V(:,1),V(:,2),'.g')
%hold on
V = V'
e=1;
%%
M =zeros(25,2);
format long
%%
while e<=1
epoca=200;
%M =zeros(25,2);
a = .05;
vizFn = 1;
[n m]= size(V);
tmax = n*epoca
Q = zeros(25,1);
rate =0;
J=0;
I=0;
for k=1:epoca
    for t=1:n
        ind = randperm(size(V,1));
        V = V(ind,:);
        X=V(1,:);
        for i=1:25
            Q(i,1) = norm(X(1,:) - M(i,:));
        end
        [C,c] = min(Q);
        
        
        % Updating
        M = reshape(M,[5 5 2]);
        X = reshape(X,[1 1 2]);
        ch = mod(c-1,5) + 1;
        cv = floor((c-1)/5) + 1;
        
        
        
        
        %coefv1= I/tmax;
        % % %         coefv1= I/tmax;
        % % %          viz= 1*(0.01/1)^coefv1;
        % % %         vizFn=1*exp(viz);
        % % % %
        % % %         vizFMtrix(t,1)=vizFn;
        % % %
        % % %         I=I+1;
        %Coeficiente de Aprendizado
        %J = J+1;
        %coef = 1 - J/tmax;
        coef = J/tmax;
        
        a = 0.05*(0.0001/0.05)^coef; % learning rate
        
        if mod(t,2) == 0 % for every 50th input
            r = 1; % SOM neighborhood radius
        else
            r = 0; % k-means clustering step
        end
        %Coeficiente de Aprendizado
        J = J+1;
        %coef = 1 - J/tmax;
        % coef = J/tmax;
        %a= a/(1+(t/tmax));
        for h = max(1,ch-r):min(5,ch+r)
            for v = max(1,cv-r):min(5,cv+r)
                M(h,v,:) = M(h,v,:) + a*(X(1,1,:) - M(h,v,:));
            end
        end
        
%         
%                   hold off
%         % %             xlabel('X1');
%         % %     ylabel('X2');
%       %   plot(V(:,1),V(:,2),'.g')
%               pause(0.1)
         %   title('Self-Organizing Map - GUSTAVO BLIMA');
      %  M = reshape(M,[5 5 2]);
            
          
%                 som = plot(M(:,:,1), M(:,:,2),'ro',M(:,1,1),M(:,1,2),'k-',M(:,2,1), ...
%                 M(:,2,2),'k-',M(:,3,1),M(:,3,2),'k',M(:,4,1),M(:,4,2),'k-',M(1,:,1),M(1,:,2),'k-', ...
%                 M(2,:,1),M(2,:,2),'k-',M(3,:,1),M(3,:,2),'k',...
%                 M(:,5,1),M(:,5,2),'k-',M(5,:,1),M(5,:,2),'k-',...
%                 M(4,:,1), M(4,:,2),'k-',0,0,'.',1,1,'.');
%        hold on
        %
        M = reshape(M,[25 2]);
        X = reshape(X,[1 2]);
        
        Error(t,1) =  min(Q);
        
        %rate(k,1)= a;
    end
    Er_epoca(k,1)= mean(Error)
   % a = 0.1*(0.0001/0.1)^coef; % learning rate
    rate(k,1)= a;
    disp('Treinamento...')
    disp('Epoca Atualizada')
    disp(k)
end
Erro_FINAL_M(:,e)= Er_epoca
e=e+1;
beep
filename = ['C:\Users\Claudia\Documents\MATLAB\SOMx5_Test\SOM_x5_Rand_Test', int2str(e), '.mat'];
save(filename)
disp('GustavoBlima')
end

%%
%IMPRIMIR
filename = 'C:\Users\Claudia\Documents\MATLAB\SOM_x5_Rand_';
save(filename)

filename = ['C:\Users\Claudia\Documents\MATLAB\SOM_x5_Rand_', int2str(e), '.mat'];
save(filename)
%save(filename, 'bb', '-ascii');


%%
for h=1:150
    jail(h,1) = 0.04*exp(-h/150)
end

%testesss

 %Calular o Erro de quantização
%         if Q(1,1) == min(Q)
%             pj(i,1)=sqrt(((M(1,1)-X(1,1))^2)+((M(1,2)-X(1,2))^2));
%         elseif Q(2,1) == min(Q)
%               pj(i,1)=sqrt(((M(2,1)-X(1,1))^2)+((M(2,2)-X(1,2))^2));
%         elseif Q(3,1) == min(Q)
%                pj(i,1)=sqrt(((M(3,1)-X(1,1))^2)+((M(3,2)-X(1,2))^2));
%         elseif Q(4,1) == min(Q)
%                  pj(i,1)=sqrt(((M(4,1)-X(1,1))^2)+((M(4,2)-X(1,2))^2));
%         elseif Q(5,1) == min(Q)
%              pj(i,1)=sqrt(((M(5,1)-X(1,1))^2)+((M(5,2)-X(1,2))^2));
%         elseif Q(6,1) == min(Q)
%             pj(i,1)=sqrt(((M(6,1)-X(1,1))^2)+((M(6,2)-X(1,2))^2));
%         elseif Q(7,1) == min(Q)
%              pj(i,1)=sqrt(((M(7,1)-X(1,1))^2)+((M(7,2)-X(1,2))^2));
%         elseif Q(8,1) == min(Q)
%              pj(i,1)=sqrt(((M(8,1)-X(1,1))^2)+((M(8,2)-X(1,2))^2));
%         elseif Q(9,1) == min(Q)
%             pj(i,1)=sqrt(((M(9,1)-X(1,1))^2)+((M(9,2)-X(1,2))^2));
%         elseif Q(10,1) == min(Q)
%              pj(i,1)=sqrt(((M(10,1)-X(1,1))^2)+((M(10,2)-X(1,2))^2));
%         elseif Q(11,1) == min(Q)
%              pj(i,1)=sqrt(((M(11,1)-X(1,1))^2)+((M(11,2)-X(1,2))^2));
%         elseif Q(12,1) == min(Q)
%              pj(i,1)=sqrt(((M(12,1)-X(1,1))^2)+((M(12,2)-X(1,2))^2));
%         elseif Q(13,1) == min(Q)
%             pj(i,1)=sqrt(((M(13,1)-X(1,1))^2)+((M(13,2)-X(1,2))^2));
%         elseif Q(14,1) == min(Q)
%             pj(i,1)=sqrt(((M(14,1)-X(1,1))^2)+((M(14,2)-X(1,2))^2));
%         elseif Q(15,1) == min(Q)
%             pj(i,1)=sqrt(((M(15,1)-X(1,1))^2)+((M(15,2)-X(1,2))^2));
%         elseif Q(16,1) == min(Q)
%             pj(i,1)=sqrt(((M(16,1)-X(1,1))^2)+((M(16,2)-X(1,2))^2));
%         elseif Q(17,1) == min(Q)
%             pj(i,1)=sqrt(((M(17,1)-X(1,1))^2)+((M(17,2)-X(1,2))^2));
%         elseif Q(18,1) == min(Q)
%             pj(i,1)=sqrt(((M(18,1)-X(1,1))^2)+((M(18,2)-X(1,2))^2));
%         elseif Q(19,1) == min(Q)
%             pj(i,1)=sqrt(((M(19,1)-X(1,1))^2)+((M(19,2)-X(1,2))^2));
%         elseif Q(20,1) == min(Q)
%             pj(i,1)=sqrt(((M(20,1)-X(1,1))^2)+((M(20,2)-X(1,2))^2));
%         elseif Q(21,1) == min(Q)
%             pj(i,1)=sqrt(((M(21,1)-X(1,1))^2)+((M(21,2)-X(1,2))^2));
%         elseif Q(22,1) == min(Q)
%             pj(i,1)=sqrt(((M(22,1)-X(1,1))^2)+((M(22,2)-X(1,2))^2));
%         elseif Q(23,1) == min(Q)
%             pj(i,1)=sqrt(((M(23,1)-X(1,1))^2)+((M(23,2)-X(1,2))^2));
%         elseif Q(24,1) == min(Q)
%             pj(i,1)=sqrt(((M(24,1)-X(1,1))^2)+((M(24,2)-X(1,2))^2));
%         elseif Q(25,1) == min(Q)
%             pj(i,1)=sqrt(((M(25,1)-X(1,1))^2)+((M(25,2)-X(1,2))^2));
%         end