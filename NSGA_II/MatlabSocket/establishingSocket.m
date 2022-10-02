% Run this to establish connection to the LPC

clear all
clc

server=tcpserver("172.20.10.2",5204);
last_10_values=zeros(1,10);


while ~server.Connected
   
    fprintf("Trying to connect Client...\n");
    pause(1);
    
end

 fprintf("Client Connected!\n");

 var=1;
 
while server.Connected==var
    
    count=0;
    
   for i=1:10
    
    aux=read(server,20,"string");
    last_10_values(1,i) = str2double(aux)
    count=count+1;
    pause(0.5);
    
    if count==10
        var=0;
    end
    
   end
    
    
end

clear server
save('test.mat','last_10_values');
return_test  % run return_test