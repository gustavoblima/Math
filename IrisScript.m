load fisheriris;

gscatter(meas(:,1), meas(:,2), species,'rgb','osd');
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

gscatter(meas(:,1), meas(:,3), species,'rgb','osd');
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


gscatter(meas(:,1), meas(:,4), species,'rgb','osd');
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

gscatter(meas(:,2), meas(:,3), species,'rgb','osd');
xlabel('Largura da Setala');
ylabel('Comprimento da Petala');
K = size(meas,1);
hold on
plot([0,4.7],[2.5,2.5],'color','b');
%if x1 > 2.5
%    x1.x2(m,n)
%end

%Teste Plot Graph
gscatter(NC(:,2), NC(:,3), speciesNC,'rgb','osd');
xlabel('Largura da Setala');
ylabel('Comprimento da Petala');
figure();


%subplot(2,3,4);
%linclass = classify(meas(:,2:3),meas(:,2:3),species);
%bad = ~strcmp (linclass,species);
%numobs = size(meas,1);
%100-(sum(bad) / numobs *100)
%hold on;
%plot(meas(bad,1), meas(bad,2), 'kx');
%hold off;
figure();

gscatter(meas(:,2), meas(:,4), species,'rgb','osd');
xlabel('Largura da Sepala');
ylabel('Largura da Petala');
O = size(meas,1);
%subplot(2,3,5);
%linclass = classify(meas(:,2),meas(:,4),species);
%bad = ~strcmp (linclass,species);
%numobs = size(meas,1);
%100-(sum(bad) / numobs *100)
%hold on;
%plot(meas(bad,1), meas(bad,2), 'kx');
%hold off;
figure();

gscatter(meas(:,3), meas(:,4), species,'rgb','osd');
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
%class = classify(meas,meas,species)

%ldaClass = classify(meas(:,3),meas(:,4),species);
%bad = ~strcmp(ldaClass,species);
%ldaResubErr = sum(bad) / N
%[ldaResubCM,grpOrder] = confusionmat(species,ldaClass)







%[N NN]=size(meas)
%J=0;
%for I=1:N,
%    if meas(I,3)>2.5
%        J=J+1;
%        CM=(J,:)= meas(I,:);
%    end
    
%J=0;    
%    [n m]=size(meas)
%for I=1:n,
%    if meas(I,3)<2.5   
%        J=J+1;
%        CM = meas(J,:)=  meas(:,I);
%    end
%end
    
        
 
  


