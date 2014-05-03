% 1 - original image

clc;
clear all;
close all;
delete(instrfindall) 
datasend1 = 3200952220; 
datasend2 = 3155140636 ; 

s = serial('COM1');
set(s,'BaudRate',38400);
set(s,'DataBits',8);
set(s,'StopBit',1);
set(s,'Parity', 'none');
set(s, 'FlowControl', 'none');
fopen(s);


while(1)
count = 0;
command = 0;
fprintf('Waiting for command');

while((count == 0) || (command ~=105)) 
    [command, count] = fread(s,1, 'uint32');
end

fprintf('Got command from FPGA\n');

if(command == 105)
    fprintf('Sending data\n');
    fwrite(s, datasend1, 'uint32');
	fwrite(s, datasend2, 'uint32');
    fprintf('Done sending data\n');
end

count = 0;
received_data_1 = 0;

while((count == 0)) 
    [received_data1, count] = fread(s,1, 'uint32');
end

count = 0;
received_data_2 = 0;

while((count == 0)) 
    [received_data_2, count] = fread(s,1, 'uint32');
end

fprintf('Received data1 - %d\n', received_data_1);
fprintf('Received data2 - %d\n', received_data_2);

end

    
    fclose(s);
    delete(s);
    clear s;
   

