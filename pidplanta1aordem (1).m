clear all;clc;
Kp=2301.724777;
Td=0.001061482;
Ti=0.015553181;

%Kp=2523.061; %usando ITAE
%Td=0.000909;
%Ti=0.265886;



%fun��o de transfer�ncia do PID ideal
numpid=[Kp*Ti*Td Kp*Ti Kp];
denpid=[Ti 0];
pid=tf(numpid,denpid)

 
%fun��o de transfer�ncia da planta
nump=[0.01948258160];
denp=[0.2040800422 1];
planta=tf(nump,denp)


ramodireto=series(pid,planta);

malhafechada=feedback(ramodireto,tf([1],[1])) %realimenta��o unit�ria


step(malhafechada)


