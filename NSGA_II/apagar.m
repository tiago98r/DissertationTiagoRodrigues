clc 
clear all
close all

alfa=0.2;
Peh=2.5;
Tch=0:0.01:10;


for i=1:size(Tch,2)
    T_Delta_j(1,i)=alfa*Tch(1,i);
    E_ch(1,i)=-1*(sin(Tch(1,i)+exp(cos(sqrt(7)*Tch(1,i))))+1.73);% Tem que estar invertida para minimizar as duas
    %f3(1,i)= T_Delta_j(1,i)-E_ch(1,i);
end

plot(Tch,T_Delta_j);
hold on
grid on
axis([0,6.5,-8,6.5])
xlabel('Tch');
ylabel('f1,f2');
plot(Tch,E_ch);
%plot(Tch,f3);