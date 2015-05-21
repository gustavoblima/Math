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

clear all, clc

title('Self-Organizing Map');
hold on
%%
t=0;
alpha = 0.3/(1+t/300000)
M = rand(64,2);
epoca = 100;
%%

Q = zeros(64,1);
tic
for k= 1:epoca
for t = 1:150
    ind = randperm(size(V,1));
        V = V(ind,:);
        X=V(1,:);
    for i = 1:64
        Q(i,1) = norm(X(1,:) - M(i,:));
    end
    [C,c] = min(Q);
    
    denom = 1 + t/15000;
    a = .1/denom;
    r = round(1/denom);
    M = reshape(M,[8 8 2]);
    X = reshape(X,[1 1 2]);
    ch = mod(c-1,8) +1;
    cv = floor((c-1)/8)+1;
    for h = max(ch-r,1):min(ch+r,8)
        for v = max(cv-r,1):min(cv+r,8)
            M(h,v,:) = M(h,v,:) + ...
                a*(X(1,1,:) - M(h,v,:));
        end
    end
   
%     pause(0.01);
    hold off
    xlabel('X1');
ylabel('X2');
gscatter(V(:,1),V(:,2),species);
hold on
 som = plot(M(:,:,1), M(:,:,2),'ro',M(:,1,1),M(:,1,2),'k-',M(:,2,1), ...
M(:,2,2),'k-',M(:,3,1),M(:,3,2),'k-',M(:,4,1),M(:,4,2),'k-', ...
M(:,5,1),M(:,5,2),'k-',M(:,6,1),M(:,6,2),'k-',M(:,7,1), ...
M(:,7,2),'k-',M(:,8,1),M(:,8,2),'k-',M(1,:,1),M(1,:,2),'k-', ...
M(2,:,1),M(2,:,2),'k-',M(3,:,1),M(3,:,2),'k-',M(4,:,1), ...
M(4,:,2),'k-',M(5,:,1),M(5,:,2),'k-',M(6,:,1),M(6,:,2),'k-', ...
M(7,:,1),M(7,:,2),'k-',M(8,:,1),M(8,:,2),'k-',M(:,3,1), ...
    M(:,3,2),'k-',M(:,4,1),M(:,4,2),'k-',0,0,'.',1,1,'.');

 

        M = reshape(M,[64 2]);
        X = reshape(X, [1 2]);
        
      
end
disp(k)
end
toc
%###############################################
pos = gridtop(3,3); plotsom(pos)
net = newsom(meas,[3 3],'gridtop','linkdist')
plotsompos(net,meas)
[net, TR] = train(net,meas)
%[dW, ls]=learnsom(w,p,[],[],a,[],[],[],[],d,lp,ls)
for t= 1:10
[dW, ls]=learnsom(w,p,[],[],a,[],[],[],[],d,lp,ls)
plotsompos(net,meas)
end
meas = meas'
lp.order_lr = 0.2
lp.order_steps = 150
lp.tune_lr = 0.02
lp.tune_nd = 1
a = rand(9,1)
p = meas
w = rand(9,2)
pos = gridtop(3,3); %plotsom(pos)
d = linkdist(pos)
plotsompos(net,meas)
ls = [];





