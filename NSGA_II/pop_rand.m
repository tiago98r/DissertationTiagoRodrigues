function [x1,x2] = pop_rand(x1_li,x1_ls,x2_li,x2_ls,pop_size)

for i=1:pop_size  % Estabelecer uma pop. inicial aleatória
    
    t1(1,i)= x1_ls-(x1_ls-x1_li)*rand();
    t2(1,i)= x2_ls-(x2_ls-x2_li)*rand();
    
    
end

x1=t1;
x2=t2;

end

