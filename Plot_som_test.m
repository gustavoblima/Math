figure();
Wx = [4;5;6;7];
Wy = [2.6;2;2;2];
Wx1 = Wx'
Wy1 = Wy'
w = reshape(w,[2 2 2])
plot(w(:,:,1), w(:,:,2),'ro',w(:,1,1),w(:,1,2),'k',w(:,2,1),w(:,2,2),'k',w(1,:,1),w(1,:,2),'k',w(2,:,1),w(1,:,2),'k',0,0,'.',1,1,'.')

x = w(:,1)
y = w(:,2)
h = plot(Wx,Wy,'ro',Wx,Wy,'k',Wx',Wy','k')
hold on

plot(w(:,1),w(:,2),'ro',w(:,1),w(:,2),'k',Wx1,Wy1,'y')
hold on
plot(Wx',Wy','y','linewidth',2)


w1 = w(1,1),w(1,2);

w2 = w(4,1),w(4,2)


%,w(4,1),w(1,2),'k',w(4,2),w(1,1),'k')




figure(1)
plot(var_1(1:50),var_2(1:50),'.b')
hold on
plot(var_1(50:100),var_2(50:100),'.r')
plot(var_1(100:150),var_2(100:150),'.k')

%Plota os neurônios
hold on
plot(Wx,Wy,'or','linewidth',2) %Plota neurônio vermelho em círculo
plot(Wx,Wy,'y','linewidth',2) %Plota caminho da vizinhança entre neurônios
plot(Wx',Wy','y','linewidth',2)  %Plota a inversa da matriz de localização dos neurônios
hold off;
title('t=0');

dentro do laço

        figure(1)
        plot(var_1(1:50),var_2(1:50),'.b')
        hold on
        plot(var_1(50:100),var_2(50:100),'.r')
        plot(var_1(100:150),var_2(100:150),'.k')
        hold on
        plot(w1,w2,'or','linewidth',3)
        plot(w1,w2,'y','linewidth',1)
        plot(w1',w2','y','linewidth',1)
        hold off
        title(['t=' num2str(t)]);
        pause(0.1)