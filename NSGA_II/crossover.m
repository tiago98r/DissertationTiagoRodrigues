% CROSSOVER ALGORITHM W/ SBX CROSSOVER OPERATOR


% Pai 1 vão ser os escolhidos do torneio o Pai 2 iremos escolher
% aleatoriamente nos escolhidos do torneio no entanto 2 pais não podem ser
% os mesmos, isto é pai 1 ~= pai 2
clear filho_x1
clear filho_x2
for m=1:no_objectives
    for i=1:pop_size
        
        ui=rand();
        cross_aux=rand();
        
        rnd=randi(pop_size);
        while rnd==i
            rnd=randi(pop_size);
        end
        
        if ui <= 0.5
            
            Beta_i = (2*ui)^(1/(eta_c+1));
            
        else
            
            Beta_i = (1/(2*(1-ui)))^(1/(eta_c+1));
            
        end
        
        if m==1 && crossover_prob > cross_aux
            if rem(i,2)~=0 % filhos impar por esta fórmula
                filho_x1(1,i) = 0.5*(1+Beta_i)*x1(1,selected_from_tournament(1,i))+(1-Beta_i)*x1(1,selected_from_tournament(1,rnd));
            else % filhos par por esta fórmula
                filho_x1(1,i) = 0.5*(1-Beta_i)*x1(1,selected_from_tournament(1,i))+(1+Beta_i)*x1(1,selected_from_tournament(1,rnd));
            end
            
            if filho_x1(1,i) > x1_ls % colocar nas boundaries se passar do limite
                filho_x1(1,i)=x1_ls-(x1_ls-x1_li)*rand();
            elseif filho_x1 (1,i) < x1_li
                filho_x1(1,i) = x1_ls-(x1_ls-x1_li)*rand();
            end
            
            
        elseif m==2 &&  crossover_prob > cross_aux
            if rem(i,2)~=0 % filhos impar por esta fórmula
                filho_x2(1,i) = 0.5*(1+Beta_i)*x2(1,selected_from_tournament(1,i))+(1-Beta_i)*x2(1,selected_from_tournament(1,rnd));
            else % filhos par por esta fórmula
                filho_x2(1,i) = 0.5*(1-Beta_i)*x2(1,selected_from_tournament(1,i))+(1+Beta_i)*x2(1,selected_from_tournament(1,rnd));
            end
            
            if filho_x2(1,i) > x2_ls % colocar aleatoriamente nas boundaries se passar do limite
                filho_x2(1,i)=x2_ls-(x2_ls-x2_li)*rand();
            elseif filho_x2 (1,i) < x2_li
                filho_x2(1,i) = x2_ls-(x2_ls-x2_li)*rand();
            end
        else
            if m==1
            filho_x1(1,i)=x1(1,i);
            else
            filho_x2(1,i)=x2(1,i);
            end
        end
    end
end