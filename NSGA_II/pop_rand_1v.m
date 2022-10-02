function [x1,x2] = pop_rand_1v(x1_li,x1_ls,pop_size)

for i=1:pop_size  % Estabelecer uma pop. inicial aleatória
    
    t1(1,i)= x1_ls-(x1_ls-x1_li)*rand();
    
    
    
end

x1=t1;


end

