
% MUTATION ALGORITHM estou só a aplicar a mutação às particulas de
% crossover, mas posso aplicar aos pais tb, na simulação vejo o melhor a
% fazer



for m=1:no_objectives
    for i=1:pop_size
        
        cross_mut=rand();
        
        if mutation_prob > cross_mut
            
            ri=rand();
            
            if ri < 0.5
                
                sigma_i = (2*ri)^(1/(eta_m+1))-1;
                
            else
                
                sigma_i = 1-((2*(1-ri))^(1/(eta_m+1)));
                
            end
            
            if m==1
                filho_x1(1,i)=filho_x1(1,i)+(x1_ls-x1_li)*sigma_i;
            else
                filho_x2(1,i)=filho_x2(1,i)+(x2_ls-x2_li)*sigma_i;
            end
            
        else
            if m==1
                filho_x1(1,i)=filho_x1(1,i);
            else
                filho_x2(1,i)=filho_x2(1,i);
            end
        end
        
        if m==1 && filho_x1(1,i) > x1_ls % colocar  nas boundaries se passar do limite
            filho_x1(1,i)= x1_ls-(x1_ls-x1_li)*rand();
        elseif m==1 && filho_x1 (1,i) < x1_li
            filho_x1(1,i) = x1_ls-(x1_ls-x1_li)*rand();
          
        elseif m==2 && filho_x2(1,i) > x2_ls
            filho_x2(1,i)=x2_ls-(x2_ls-x2_li)*rand();
        elseif m==2 && filho_x2 (1,i) < x2_li
            filho_x2(1,i) = x2_ls-(x2_ls-x2_li)*rand();
        end
    end
end