%% SCRIPT MATLAB SELF-ORGANIZING MAP NETWORK
clear all, clc
pos = gridtop(8,8);
D = linkdist(pos);
%------------------------------
%ind = D(1,:) <= 1
%M(:,ind)
%------------------------------
% load fisheriris
% V = meas(:,1:2);
 V = rands(2,1000);
 V=V'
% plot(V(:,1),V(:,2),'.g')
%hold on
e=1;
%%
M =zeros(64,2);
format long
%%
while e<=1
    epoca=400;
    %M =zeros(25,2);
    a = .1;
    vizFn = 1;
    [n m]= size(V);
    tmax = n*epoca
    Q = zeros(64,1);
    rate =0;
    Er_epoca=0;
    J=0;
    %I=0;
    for k=1:epoca,
        for t=1:n,
            ind = randperm(size(V,1));
            V = V(ind,:);
            X=V(1,:);
            for i=1:64
                Q(i,1) = norm(X(1,:) - M(i,:));
            end
            [C,c] = min(Q);
            %Separa o indice do valor minimo na matrix Q
            in2 = Q(:,1) ==(min(Q));
            %Pega indice achado acima e atualiza na matrix de Distancia na
            %respectiva linha do neuronio vencedor.
            win = D(:,in2);
            %Pega o indice da linha e verifica a vizinhança menor ou igual a 1
            %entao atualiza os respectivos neuronios;
                ind = win(:,1) <= 1;
            %Busca os valores dos indices
            viz = find(ind);
           
            [z f]=size(viz);
            %Atualizando valores dos Neuronios
            for j=1:z,
                M(viz(j),1)=M(viz(j),1)+(a*(X(1,1)-M(viz(j),1)));
                M(viz(j),2)=M(viz(j),2)+(a*(X(1,2)-M(viz(j),2)));
            end
            J = J+1;
            %Coeficiente de Aprendizado
            coef = J/tmax;
            
            a = 0.1*(0.00001/0.1)^coef; % learning rate
            
            %
            Error(t,1) = min(Q);
            
            rate(k,1)= a;
        
        end
          
        Er_epoca(k,1)= mean(Error)
        %rate(k,1)= a;
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

plot(Er_epoca)

%% PLOT SELF-ORGANIZING MAP NETWORK


    M = reshape(M,[8 8 2]);
            X = reshape(X,[1 1 2]);
            som = plot_nodes(M);
            M = reshape(M,[64 2]);
            X = reshape(X,[1 2]);




       %  Update to plot
                   M = reshape(M,[8 8 2]);
                    X = reshape(X,[1 1 2]);
                   hold off
                            plot(V(:,1),V(:,2),'.g')
                             hold on
%                             som = plot(M(:,:,1), M(:,:,2),'ro',M(:,1,1),M(:,1,2),'k-',M(:,2,1), ...
%                             M(:,2,2),'k-',M(:,3,1),M(:,3,2),'k',M(:,4,1),M(:,4,2),'k-',M(1,:,1),M(1,:,2),'k-', ...
%                             M(2,:,1),M(2,:,2),'k-',M(3,:,1),M(3,:,2),'k',...
%                             M(:,5,1),M(:,5,2),'k-',M(5,:,1),M(5,:,2),'k-',...
%                             M(4,:,1), M(4,:,2),'k-',0,0,'.',1,1,'.');
%                         
%                         som = plot(M(:,:,1), M(:,:,2),'ro',M(:,1,1),M(:,1,2),'b-',M(:,2,1), ...
%                             M(:,2,2),'b-',M(:,3,1),M(:,3,2),'b-',M(:,4,1),M(:,4,2),'b-', ...
%                             M(:,5,1),M(:,5,2),'b-',M(:,6,1),M(:,6,2),'b-',M(:,7,1), ...
%                             M(:,7,2),'b-',M(:,8,1),M(:,8,2),'b-',M(1,:,1),M(1,:,2),'b-', ...
%                             M(2,:,1),M(2,:,2),'b-',M(3,:,1),M(3,:,2),'b-',M(4,:,1), ...
%                             M(4,:,2),'b-',M(5,:,1),M(5,:,2),'b-',M(6,:,1),M(6,:,2),'b-', ...
%                             M(7,:,1),M(7,:,2),'b-',M(8,:,1),M(8,:,2),'b-',M(:,3,1), ...
%                             M(:,3,2),'b-',M(:,4,1),M(:,4,2),'b-',0,0,'.',1,1,'.');
%                         
                        
%                     M = reshape(M,[25 2]);
%                     X = reshape(X,[1 2]);
            %