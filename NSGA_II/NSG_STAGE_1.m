function [Front,fr,ni,Si] = NSG_STAGE_1(fitness,pop_size)





%NON-DOMINATED SORTING STAGE-1 Calcular front 1 CHECKED BY DEBUGGING !


dominates = zeros (pop_size,pop_size); % primeiras 8 colunas p/ no_dominancias, 8 a 16 colunas p/ no_dominados
ni=zeros(1,pop_size); %is_dominated_by


for i=1:pop_size
    count=1;
    
    for j=1:pop_size
        
        if i==j
            continue;
        
        
        elseif fitness(1,i) < fitness(1,j) && fitness(2,i) < fitness(2,j) 
               
            dominates(i,count) =  j;
            count=count+1;
            
        elseif fitness(1,i) > fitness(1,j) && fitness(2,i) > fitness(2,j)
            
             ni(1,i)=ni(1,i)+1;
            
        end
        
        
        
        
        
    end
     
    
end

clear Si
for i=1:pop_size %% TENTAR ARMAZENAR AQUI OS VALORES DE DOMINACIAS EM FORMA DE ARRAYS
Si{1,i}=dominates(i,1:pop_size);  %Dominates [SET]
Si{1,i} = Si{1,i}(find(Si{1,i}~=0));

end

clear dominates;
clear count;


aux=1;
clear F1_data
clear Front
for i=1:pop_size
  
        
        if ni(1,i) == 0 
            
            F1_data(1,aux)= i;
            aux=aux+1;
            
        end
end
fr=1;
aux=cell(1);
aux{1,fr}=F1_data(1,:); %% retificar erro aqui



Front=aux;

end

