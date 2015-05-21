%Vistas modificado!

load fisheriris;

gscatter(NC(:,1), NC(:,2), speciesNC,'rgb','osd');
xlabel('Comprimento da Sepala');
ylabel('Largura da Sepala');
G = size(meas,1);

%linclass = classify(meas(:,1:2),meas(:,1:2),species);
%bad = ~strcmp (linclass,species);
%numobs = size(meas,1);
%100-(sum(bad) / numobs *100)
%hold on;
%plot(meas(bad,1), meas(bad,2), 'kx');
%hold off;
figure();
%subplot(2,3,1);

gscatter(NC(:,1), NC(:,3), speciesNC,'rgb','osd');
xlabel('Comprimento da Sepala');
ylabel('Comprimento da Petala');
N = size(meas,1);
%subplot(2,3,2);
%linclass = classify(meas(:,1),meas(:,3),species);
%bad = ~strcmp (linclass,species);
%numobs = size(meas,1);
%100-(sum(bad) / numobs *100)
%hold on;
%plot(meas(bad,1), meas(bad,2), 'kx');
%hold off;
figure();


gscatter(NC(:,1), NC(:,4), speciesNC,'rgb','osd');
xlabel('Comprimento da Sepala');
ylabel('Largura da Petala');
L = size(meas,1);
%subplot(2,3,3);
%linclass = classify(meas(:,1),meas(:,4),species);
%bad = ~strcmp (linclass,species);
%numobs = size(meas,1);
%100-(sum(bad) / numobs *100)
%hold on;
%plot(meas(bad,1), meas(bad,2), 'kx');
%hold off;
figure();

gscatter(NC(:,2), NC(:,3), speciesNC,'rgb','osd');
xlabel('Largura da Setala');
ylabel('Comprimento da Petala');
figure();

K = size(meas,1);

%if x1 > 2.5
%    x1.x2(m,n)
%end

%Teste Plot Graph
%gscatter(NC(:,2), NC(:,3), speciesNC,'rgb','osd');
%xlabel('Largura da Setala');
%ylabel('Comprimento da Petala');
figure(4);


%subplot(2,3,4);
%linclass = classify(meas(:,2:3),meas(:,2:3),species);
%bad = ~strcmp (linclass,species);
%numobs = size(meas,1);
%100-(sum(bad) / numobs *100)
%hold on;
%plot(meas(bad,1), meas(bad,2), 'kx');
%hold off;
%figure();

%Grafico MANIPULADO
gscatter(NC(:,2), NC(:,4), speciesNC,'rgb','osd');
xlabel('Largura da Sepala');
ylabel('Largura da Petala');
hold on
plot([0,4.0],[1.8,1.8],'color','b');
O = size(meas,1);
figure();
%subplot(2,3,5);
%linclass = classify(meas(:,2),meas(:,4),species);
%bad = ~strcmp (linclass,species);
%numobs = size(meas,1);
%100-(sum(bad) / numobs *100)
%hold on;
%plot(meas(bad,1), meas(bad,2), 'kx');
%hold off;
figure();

gscatter(NC(:,3), NC(:,4), speciesNC,'rgb','osd');
xlabel('Comprimento da Petala');
ylabel('Largura da Petala');
S = size(meas,1);
%subplot(2,3,6);
%linclass = classify(meas(:,3:4),meas(:,3:4),species);
%bad = ~strcmp (linclass,species);
%numobs = size(meas,1);
%100-(sum(bad) / numobs *100)
%hold on;
%plot(meas(bad,1), meas(bad,2), 'kx');
%hold off;
figure();