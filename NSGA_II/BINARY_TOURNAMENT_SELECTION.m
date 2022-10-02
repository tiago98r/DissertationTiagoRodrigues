

% CROWDED BINARY TOURNAMENT SELECTION  ALGORITHM   
 % só realiza o torneio 2x VER COMO FAZER

for m=1:2
     
     selected_set=randperm(pop_size,pop_size);
     count=0;
     selected_pairs=cell(1,pop_size/2);
     
     for i=1:1:pop_size/2  % Seleção dos pares
         selected_pairs{1,i}=union(selected_set(1,i+count),selected_set(1,i+1+count));
         count=count+1;
     end
     
     
     
     
     
     if m==1
         selected_from_tournament =  zeros(1,pop_size);
         for i=1:pop_size/2
             
             
             
             if ranks(1,selected_pairs{1,i}(1)) > ranks(1,selected_pairs{1,i}(2)) % comparar rank
                 
                 selected_from_tournament(1,i) =  selected_pairs{1,i}(2);
                 
             elseif ranks(1,selected_pairs{1,i}(1)) < ranks(1,selected_pairs{1,i}(2))
                 
                 selected_from_tournament(1,i) =  selected_pairs{1,i}(1);
             else
                 
                 if cd_sum(1,selected_pairs{1,i}(1)) > cd_sum(1,selected_pairs{1,i}(2))% compare by cd aqui iremos comparar com a soma das cd de todos os objetivos p/ ser mais justo
                     
                     selected_from_tournament(1,i) =  selected_pairs{1,i}(1);
                 elseif cd_sum(1,selected_pairs{1,i}(1)) < cd_sum(1,selected_pairs{1,i}(2))
                     selected_from_tournament(1,i) =  selected_pairs{1,i}(2);
                 else %if cd equal choose randomly
                     rnd=randi(2);
                     selected_from_tournament(1,i) =  selected_pairs{1,i}(rnd);
                     
                 end
             end
         end
     else
         for i=(pop_size/2)+1:pop_size
             
             
             
             if ranks(1,selected_pairs{1,i-(pop_size/2)}(1)) > ranks(1,selected_pairs{1,i-(pop_size/2)}(2)) % comparar rank
                 
                 selected_from_tournament(1,i) =  selected_pairs{1,i-(pop_size/2)}(2);
                 
             elseif ranks(1,selected_pairs{1,i-(pop_size/2)}(1)) < ranks(1,selected_pairs{1,i-(pop_size/2)}(2))
                 
                 selected_from_tournament(1,i) =  selected_pairs{1,i-(pop_size/2)}(1);
             else
                 
                 if cd_sum(1,selected_pairs{1,i-(pop_size/2)}(1)) > cd_sum(1,selected_pairs{1,i-(pop_size/2)}(2))% compare by cd aqui iremos comparar com a soma das cd de todos os objetivos p/ ser mais justo
                     
                     selected_from_tournament(1,i) =  selected_pairs{1,i-(pop_size/2)}(1);
                 elseif cd_sum(1,selected_pairs{1,i-(pop_size/2)}(1)) < cd_sum(1,selected_pairs{1,i-(pop_size/2)}(2))
                     selected_from_tournament(1,i) =  selected_pairs{1,i-(pop_size/2)}(2);
                 else %if cd equal choose randomly
                     rnd=randi(2);
                     selected_from_tournament(1,i) =  selected_pairs{1,i-(pop_size/2)}(rnd);
                     
                 end
             end
         end
     end
     
 end
 