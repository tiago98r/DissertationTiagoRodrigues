
%Exemplo de como passar os valores lidos do LPC para um script

close all
clear all
clc

valores_tensao=zeros(1,10);
load('test.mat')


for i=1:10
    
valores_tensao(1,i)=exp(last_10_values(1,i));

end