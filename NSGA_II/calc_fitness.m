function [fitness] = calc_fitness(f1,f2,x1,x2,pop_size)


for i=1:pop_size  % calcular f1 e f2 de cada partícula
    for j=1:2
        
        if j==1
            aux(j,i) =f1(x1(1,i),x2(1,i));
        else
            aux(j,i)=f2(x1(1,i),x2(1,i));
        end
        
    end
end

fitness=aux;

end

