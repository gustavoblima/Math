%##############################
%##############################
%Algoritmo da Árvore de Decisão;


%Grafico escolhido abraixo para separação da flor;
load fisheriris;
%Graph 4 - NAO FOI UTILIZADO;
gscatter(meas(:,3), meas(:,4), species,'rgb','osd');
xlabel('Comprimento da Petala');
ylabel('Largura da Petala');
S = size(meas,1);

%Graph 6
gscatter(meas(:,2), meas(:,3), species,'rgb','osd');
xlabel('Largura da Setala');
ylabel('Comprimento da Petala');
K = size(meas,1);
hold on
plot([0,4.7],[2.5,2.5],'color','b');
figure();
figure();
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
    if (NC(I,4)>1.85) && (NC(I,4)<2.6)
        J=J+1;
        NCVIRN(J,:)=NC(I,:);
        speciesNCVIRN(J)=speciesNC(I);
    end
end
xp=speciesNCVIRN'

%##################################################
%Plotando grupo das Virginicas com problemas
gscatter(NCVIRN(:,2), NCVIRN(:,4), xp,'rgb','osd');
xlabel('Largura da Sepala');
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

%####################################################
%Criando classificação
%####################################################

%####################################################
%#########_____TESTE ALGORITMO__1__##################
%####################################################

Num = input('Digite o valor do comprimento da petala para verificar o tipo da Iris:');

if Num <2.5
    [n m]=size(meas);
    for I=1:n,
        if meas(I,3)<2.5
            disp('SETOSA');
        end
    end
end
break;
if Num >2.6 & Num<4.4
    [n m]=size(meas);
    for I=1:n,
        if meas(I,3)>2.4 && meas(I,3)<4.4
            disp('VERSICOLOR');
        end
    end
end
break;
if Num> 5.15,
    [n m]=size(meas);
    for I=1:n,
        if meas(I,3)>5.15
            disp('VIRGINICA');
        end
    end
end
break;
if Num >4.5 & Num < 5.15,
    [n m]=size(NCVIRN);
    
    for I=1:n
        if NCVIRN(I,3)>5.0 && NCVIRN(I,3)<5.1
            disp('VIRGINICA');
        else
            % Err=0;
            % Error = Err+1;
            % Total= (Error/150)*100;
            disp('Error');
        end
    end
end



%####################################################
%#########_____TESTE ALGORITMO__2__##################
%####################################################

Num = input('Digite o valor do comprimento da petala para verificar o tipo da Iris:');
[n m]=size(meas);

for k=1:n,
    if meas(k,3)<2.5
        disp('SETOSA');
    end
    if meas(k,3)>2.6 & meas(k,3)<4.4
        disp('VERSICOLOR');
    end
    if meas(k,3)>5.15,
        disp('VIRGINICA');
    end
    if meas(k,3)>=5.0 & meas(k,3)<=5.1,
        disp('VIRGINICA');
    else
        disp('Error');
    end
    
end


%####################################################
%#########_____TESTE ALGORITMO__3__##################
%####################################################

Num = input('Digite o valor do comprimento da petala para verificar o tipo da Iris:');

if Num <2.5
    disp('SETOSA');
end
break;
if Num >2.6 & Num<4.4
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
    elseif meas(k,3)>=2.6 & meas(k,3)<=4.4
        disp('VERSICOLOR');
    elseif meas(k,3)>=5.0 & meas(k,3)<=5.1
        disp('VIRGINICA');
    elseif meas(k,3)>5.15,
        disp('VIRGINICA');
    else
        disp('Error');
        J=J+1;
    end
end

Z=100-((J/150)*100);
disp('Acertos:');
disp(Z);