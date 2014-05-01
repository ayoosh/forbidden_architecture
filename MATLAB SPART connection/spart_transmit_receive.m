clc;
clear all;
s = serial('COM1');
set(s,'BaudRate',38400);
% set(s, 'InputBufferSize', 1);
% set(s, 'OutputBufferSize', 1);
set(s,'DataBits',8);
set(s,'StopBit',1);
set(s,'Parity', 'none');
set(s, 'FlowControl', 'none');

fopen(s);
%out = get(s,'Timeout');
for i = 1:2000
    fwrite(s,i, 'uint32');
    [out1, count1, msg1] = fread(s,1, 'uint32');
    fprintf('out1 = %d\n', out1);
    if(out1 ~= i)
        fprintf('Error!! Values did not match');
        break;
    end
end


fclose(s)
delete(s)
clear s
fprintf('This part was executed\n');