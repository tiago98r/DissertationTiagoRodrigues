function [whole_Front,ranks] = NSG_STAGE_2(Front,fr,ni,Si,pop_size)


p_from_last_F = Front{1,fr};
set = [];
tam=0;
ni_compare= zeros(1,pop_size);


while ~isequal(ni,ni_compare)

aux=1;
Fn_data=0;
    

for i=1:length(p_from_last_F)
        
    
    set = Si{1,p_from_last_F(1,i)};
       
    for j=1:length(set)
        ni(1,set(1,j))=ni(1,set(1,j))-1;
        if ni(1,set(1,j))==0
            Fn_data(1,aux) = set(1,j);
            aux=aux+1;
        end
    end
    
    
end

fr=fr+1;
Front{1,fr}=Fn_data(1,:);
p_from_last_F = Front{1,fr};

end

for j=1:length(Front)
    for i=1:length(Front{1,j})  %Atribuição do rank || rank = front
       
        for m=1:pop_size
            if m==Front{1,j}(i)
                rank_aux(1,m)=j;
            end
            
        end
    end
end

ranks=rank_aux;
whole_Front = Front;
end

