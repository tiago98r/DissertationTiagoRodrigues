
% NOVA POPULAÇÃO Q(T) COM N=POP_SIZE

new_pop=0;
count=1;

for i=1:length(new_Front)
    if length(new_pop) == pop_size
        break;
    end
    for j=1:length(new_Front{1,i})
        
        
        new_pop(1,count) = new_Front{1,i}(j);
        count=count+1;
        if length(new_pop) == pop_size
            break;
        end
        
    end
    
end

whole_pop = [x1(1,:),filho_x1(1,:);x2(1,:),filho_x2(1,:)];
%nova posição das partículas

for i=1:pop_size
   
     x1(1,i)= whole_pop(1,new_pop(1,i));
     x2(1,i)= whole_pop(2,new_pop(1,i));
    
end
