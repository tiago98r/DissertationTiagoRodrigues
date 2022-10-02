
crowding_distance = zeros(no_objectives,pop_size);
tam_aux=1;
for i=1:length(Front)
    
    r = length(Front{1,i});
    aux=0;
    for j=1:no_objectives
        
        
        
        if j==1 % x1
            particles_to_sort = Front{1,i};
            for ii=1:r
                aux(1,ii)=fitness(1,particles_to_sort(1,ii));
            end
            aux_x = sort(aux); % sorted by value, agora precisamos de as orientar por num
            
            if r==1
                particle_sorted = particles_to_sort;
                
            else
                for t=1:r
                    for tt=1:pop_size
                        
                        if aux_x(1,t) == fitness(1,tt)
                            
                            particle_sorted(1,t)=tt;
                            break;
                            
                        end
                    end
                end
            end
            
            crowding_distance(j,particle_sorted(1,1))=inf;
            crowding_distance(j,particle_sorted(1,r))=inf;
            
            
            
            for jj=2:(r-1)
                crowding_distance(j,particle_sorted(1,jj)) = crowding_distance(j,particle_sorted(1,jj))+(abs(fitness(j,particle_sorted(1,jj+1))-fitness(j,particle_sorted(1,jj-1))))/(f_minmax(j,2)-f_minmax(j,1));
            end
            
                    
        else
            
            for ii=1:r
                aux(1,ii)=fitness(2,particles_to_sort(1,ii));
            end
            aux_x = sort(aux); % sorted by value, agora precisamos de as orientar por num
            
            
            for t=1:r
                for tt=1:pop_size
                    
                    if aux_x(1,t) == fitness(2,tt)
                        
                        particle_sorted(1,t)=tt;
                        break;
                        
                    end
                end
            end
            
            crowding_distance(j,particle_sorted(1,1))=inf;
            crowding_distance(j,particle_sorted(1,r))=inf;
            
            
            
            for jj=2:(r-1)
                crowding_distance(j,particle_sorted(1,jj)) = crowding_distance(j,particle_sorted(1,jj))+(abs(fitness(j,particle_sorted(1,jj+1))-fitness(j,particle_sorted(1,jj-1))))/(f_minmax(j,2)-f_minmax(j,1));
            end
            
            
            
            
        end
    end
    clear particle_sorted
end

 for i=1:pop_size
        cd_sum(1,i) =crowding_distance(1,i)+crowding_distance(2,i); % criar a soma das cd para ser mais justo o critério de seleção no torneio
    end