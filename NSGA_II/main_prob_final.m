clear all
close all
clc

%FAZER DEBUG A ISTO SÓ A VERIFICAR SE ESTÁ FIXE

% PARA DADA SIMULAÇÃO Tn Considerando um tempo de comunicação útil de 5
% seg 0.11 J necessários à comunicação, uma constate clock do rádio (alfa) de 0.02.
% potência de TX/RX de 10 dBm ~0.01 W, potência sleep de 60 microwatts,
% potência idle de 3.3 mW, Ttx e rx é 0.5 seg Tidle é 4 seg e Tsleep é 20
% seg e uma potência de recolha de 2.5 W constante

E_delta_C=  0.3 ;% [J] inicial

%f1 --- > alfa*Tch (T_delta_j = alfa*Tch)
%f2 ---> Tch/Peh (E_delta_Tch = Peh*Tch)

f1 = @(x1,x2) (x1*0.02*x2);  %min
f2 = @(x1,x2) (-1*(sin(x2+exp(cos(sqrt(7)+x2)))+1.73)*x1);  %min
% Adição de restrições lineares R.I1 E_delta_Tcg > E_delta_c

x1_li=0;% Limites -->  0<=x1<=6.5 
x1_ls=6.5;
x2_li=0;% Limites -->     0<=x2<=8.67
x2_ls=8.67;



pop_size = 100; % Tem que ser no. par
no_objectives = 2;
max_it = 26;
it=1;
crossover_prob=0.8; % costuma ser sempre alta, > 0.7
mutation_prob=0.2; % por norma costuma ser 1/n onde n é o no. de variáveis do problema
eta_m=20;
eta_c=15; % etas são os valores dados no problema ZDT pode ser alterado conforme o comportamento do algoritmo


x1=zeros(1,pop_size);
x2=zeros(1,pop_size);
fitness=zeros(no_objectives,pop_size); %min/máx para F1 é 0/1, min/máx para F2 é 0/4
f1_li=0;
f1_ls=0.845;
f2_li=-17.45;
f2_ls=0;


[x1,x2]=pop_rand(x1_li,x1_ls,x2_li,x2_ls,pop_size);  % Estabelecer uma pop. inicial aleatória


% RESTRIÇÕES PARA OS PAIS

for i=1:pop_size
   
    while ((sin(x2(1,i)+exp(cos(sqrt(7)+x2(1,i))))+1.73)*x1(1,i)) < E_delta_C % Restrição_1 
        
        r=randi(2);
        if r==1
            x1(1,i)= x1_ls-(x1_ls-x1_li)*rand();
        else
            x2(1,i)= x2_ls-(x2_ls-x2_li)*rand();         
        end
    end
    
end


[fitness]=calc_fitness(f1,f2,x1,x2,pop_size); % calcular f1 e f2 de cada partícula


while (it < max_it)
    
   % RESTRIÇÕES PARA OS PAIS

for i=1:pop_size
   
    while ((sin(x2(1,i)+exp(cos(sqrt(7)+x2(1,i))))+1.73)*x1(1,i)) < E_delta_C % Restrição_1 
        
        r=randi(2);
        if r==1
            x1(1,i)= x1_ls-(x1_ls-x1_li)*rand();
        else
            x2(1,i)= x2_ls-(x2_ls-x2_li)*rand();         
        end
    end
    
end


    % Plotting

plot(fitness(1,:),fitness(2,:),'ob');
axis([f1_li 0.15 f2_li f2_ls]);
% labs = {'1','2','3','4','5','6','7','8','9','10'};
% text(fitness(1,:),fitness(2,:),labs,'VerticalAlignment','bottom','HorizontalAlignment','right');
title ("Simulation",'FontSize',12,'FontWeight','bold');
xlabel('Function 1 (T_d_e_l_t_a_j)','FontSize',12,'FontWeight','bold');
ylabel('Function 2 (|E_d_e_l_t_a_T_c_h|)','FontSize',12,'FontWeight','bold');
txt = ['Iteration : ', num2str(it)];
text(0.7,0.5,txt);
grid on;
pause(0.1);


f1_max = max(fitness(1,:));
f2_max = max(fitness(2,:));
f1_min = min(fitness(1,:));
f2_min = min(fitness(2,:));
f_minmax = [f1_min,f1_max;f2_min,f2_max];


[Front,fr,ni,Si]=NSG_STAGE_1(fitness,pop_size);
[whole_Front,ranks]=NSG_STAGE_2(Front,fr,ni,Si,pop_size);
CROWDING_DISTANCE_ALGORITHM;
BINARY_TOURNAMENT_SELECTION;
crossover;
mutation;


% RESTRIÇÕES PARA OS FILHOS

for i=1:pop_size
   
    while ((sin(filho_x2(1,i)+exp(cos(sqrt(7)+filho_x2(1,i))))+1.73)*filho_x1(1,i)) < E_delta_C % Restrição_1 
        
        r=randi(2);
        if r==1
            filho_x1(1,i)= x1_ls-(x1_ls-x1_li)*rand();
        else
            filho_x2(1,i)= x2_ls-(x2_ls-x2_li)*rand();         
        end
    end
    
end

%novos fitness depois de crossover e mutacao

[new_fitness]=calc_fitness(f1,f2,filho_x1,filho_x2,pop_size);

% CALCULAR NOVAS FRONTS 

new_f = [fitness(1,:),new_fitness(1,:);fitness(2,:),new_fitness(2,:)];
[new_Front,fr,ni,Si]=NSG_STAGE_1(new_f,pop_size*2);
[new_Front,ranks]=NSG_STAGE_2(new_Front,fr,ni,Si,pop_size*2);
best_from_pop;  % calcular os n melhores da população  , n = pop_size

%calcular fitness novamente
[fitness]=calc_fitness(f1,f2,x1,x2,pop_size);

   
it = it +1 ;

end
