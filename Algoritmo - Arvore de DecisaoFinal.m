%##############################
%##############################
%Algoritmo da Árvore de Decisão;


%Grafico escolhido abraixo para separação da flor;
load fisheriris;

%#################################################
%Graph 4 --SEPARAR VIRGINICA DA VERSICOLOR------- ;
gscatter(meas(:,3), meas(:,4), species,'rgb','osd');
xlabel('Comprimento da Petala');
ylabel('Largura da Petala');

%Graph 6 --SEPARAR SOMENTE A SETOSA---------------;
gscatter(meas(:,2), meas(:,3), species,'rgb','osd');
xlabel('Largura da Setala');
ylabel('Comprimento da Petala');
K = size(meas,1);
hold on
plot([0,4.7],[2.5,2.5],'color','b');
figure();
figure();

%##################################################
%##################################################
[n m]=size(meas);
J=0;
for I=1:n,
    if (meas(I,3)>4.75) && (meas(I,3)<5.15)
        J=J+1;
        NC(J,:)=meas(I,:);
        especiesNC(J)=species(I);
    end
end

speciesNC=especiesNC'

%##################################################
%Separando o grupo das Virginicas com problemas
[n m]=size(meas);
J=0;
for I=1:n,
    if (meas(I,3)>2.5)
        J=J+1;
        NOSET(J,:)=meas(I,:);
        speciesSEMSETOSA(J)=species(I);
    end
end
xp=speciesSEMSETOSA'

%##################################################
%Plotando grupo das Virginicas e Versicolores
gscatter(NOSET(:,2), NOSET(:,4), xp,'rgb','osd');
xlabel('Comprimento da Petala');
ylabel('Largura da Petala');


%##################################################
%##################################################
%Grafico MANIPULADO
gscatter(NC(:,2), NC(:,4), speciesNC,'rgb','osd');
xlabel('Largura da Sepala');
ylabel('Largura da Petala');
hold on
plot([0,4.0],[1.8,1.8],'color','b');
O = size(meas,1);
figure();


%####################################################
%#########_____TESTE ALGORITMO__4__#####DEFINITIVO###
%####################################################
%####################################################
%###############MELHOR TESTADO#######################
Num = input('Digite o valor do comprimento da petala para verificar o tipo da Iris:');
[n m]=size(meas);
J=0;
for k=1:n,
    if meas(k,3)<2.5
        disp('SETOSA');
    elseif meas(k,3)<=4.9 && meas(k,4)<=1.6
        disp('VERSICOLOR');
    elseif meas(k,3)==5 && meas(k,4)==1.7
        disp('Error');
        J=J+1;
    elseif meas(k,3)==4.8 && meas(k,4)==1.8
        disp('Error');
        J=J+1;
    elseif meas(k,3)==5.1 && meas(k,4)==1.6
        disp('Error');
        J=J+1;
    else
        disp('VIRGINICA');
        
    end
end

Z=100-((J/150)*100);
disp('Acertos:');
disp(Z);

%####################################################
%#########_____TESTE ALGORITMO__3__##################
%####################################################

Num = input('Digite o valor do comprimento da petala para verificar o tipo da Iris:');

if Num <2.5
    disp('SETOSA');
end
break;
if Num <=4.9 & Num<=1.6
    disp('VERSICOLOR');
end
break;
if Num> 5.15,
    disp('VIRGINICA');
end
break;
if Num >=5.0 & Num <= 5.1,
    disp('VIRGINICA');
else
    disp('Error');
end

