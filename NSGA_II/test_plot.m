clc
clear all
close all

syms x
f(x) = sin(x+exp(cos(sqrt(7)+x)))+1.73;



fplot(f)
hold on
axis([0 8.67 0 3.5]);
grid on
plot(3.025, 0.89, '.', 'MarkerSize', 15)
plot(2.167, 1.613, '.b', 'MarkerSize', 15)
plot(7.296, 2.715, '.b', 'MarkerSize', 15)
title ("Last known EH curve",'FontSize',12,'FontWeight','bold');
xlabel('Time [s]','FontSize',12,'FontWeight','bold');
ylabel('Harvested Power [p.d.u]','FontSize',12,'FontWeight','bold');
