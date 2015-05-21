clear all,clc
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
%plot(meas,'g*');

title('Self-Organizing Map');
hold on
%%
t=0;
alpha = 0.3/(1+t/300)
M = rand(36,2);
%%

Q = zeros(36,1);
tic
for k = 1:5
for t = 1:150
    ind = randperm(size(V,1));
        V = V(ind,:);
        X=V(1,:)
    for i = 1:36
        Q(i,1) = norm(X(1,:) - M(i,:));
    end
    [C,c] = min(Q);
    
    denom = 1 + t/750;
    a = .3/denom;
    r = round(3/denom);
    M = reshape(M,[6 6 2]);
    X = reshape(X,[1 1 2]);
    ch = mod(c-1,6) +1;
    cv = floor((c-1)/6)+1;
    for h = max(ch-r,1):min(ch+r,6)
        for v = max(cv-r,1):min(cv+r,6)
            M(h,v,:) = M(h,v,:) + ...
                a*(X(1,1,:) - M(h,v,:));
        end
    end
   
    pause(0.01);
    hold off
    xlabel('X1');
ylabel('X2');
gscatter(V(:,1),V(:,2),species);
%plot(meas,'g*');
hold on

som = plot(M(:,:,1), M(:,:,2),'ro',M(:,1,1),M(:,1,2),'k-',M(:,2,1), ...
    M(:,2,2),'k-',M(:,3,1),M(:,3,2),'k',M(:,4,1),M(:,4,2),'k-',M(1,:,1),M(1,:,2),'k-', ...
    M(2,:,1),M(2,:,2),'k-',M(3,:,1),M(3,:,2),'k',...
    M(:,5,1),M(:,5,2),'k-',M(:,6,1),M(:,6,2),'k-',...
    M(5,:,1),M(5,:,2),'k-',M(6,:,1),M(6,:,2),'k-', ...
    M(4,:,1), M(4,:,2),'k-',0,0,'.',1,1,'.');


%----#  3x3 NAO FUNCIONOU
% som = plot(M(:,:,1), M(:,:,2),'ro',M(:,1,1),M(:,1,2),'k-',M(:,2,1), ...
%     M(:,2,2),'k-',M(:,3,1),M(:,3,2),'k-',M(1,:,1),M(1,:,2),'k-', ...
%     M(2,:,1),M(2,:,2),'k-',M(3,:,1),M(3,:,2),'k-',0,0,'.',1,1,'.');


%##------- 3 x 3
% som = plot(M(:,:,1), M(:,:,2),'ro',M(:,1,1),M(:,1,2),'k-',M(:,2,1), ...
%     M(:,2,2),'k-',M(:,3,1),M(:,3,2),'k',M(:,4,1),M(:,4,2),'k-',M(1,:,1),M(1,:,2),'k-', ...
%     M(2,:,1),M(2,:,2),'k-',M(3,:,1),M(3,:,2),'k',M(4,:,1), M(4,:,2),'k-',0,0,'.',1,1,'.');
   

%  som = plot(M(:,:,1), M(:,:,2),'ro',M(:,1,1),M(:,1,2),'k-',M(:,2,1), ...
% M(:,2,2),'k-',M(:,3,1),M(:,3,2),'k-',M(:,4,1),M(:,4,2),'k-', ...
% M(:,5,1),M(:,5,2),'k-',M(:,6,1),M(:,6,2),'k-',M(:,7,1), ...
% M(:,7,2),'k-',M(:,8,1),M(:,8,2),'k-',M(1,:,1),M(1,:,2),'k-', ...
% M(2,:,1),M(2,:,2),'k-',M(3,:,1),M(3,:,2),'k-',M(4,:,1), ...
% M(4,:,2),'k-',M(5,:,1),M(5,:,2),'k-',M(6,:,1),M(6,:,2),'k-', ...
% M(7,:,1),M(7,:,2),'k-',M(8,:,1),M(8,:,2),'k-',M(:,3,1), ...
%     M(:,3,2),'k-',M(:,4,1),M(:,4,2),'k-',0,0,'.',1,1,'.');

 

        M = reshape(M,[36 2]);
        X = reshape(X, [1 2]);
        
      
end

end
toc