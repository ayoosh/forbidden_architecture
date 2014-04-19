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
for i = 1:3000
    fwrite(s,i, 'uint32');
end

for i = 1:3000
    [out1, count1, msg1] = fread(s,1, 'uint32');
    fprintf('out1 = %d\n', out1);
    if(out1 ~= i)
        fprintf('Error!! Values did not match');
        break;
    end
end

% fwrite(s,'A', 'uchar');
% % pause(0.01);
% fwrite(s,'B', 'uchar');
% % pause(0.01);
% fwrite(s,'C', 'uchar');
% % pause(0.01);
% fwrite(s,'D', 'uchar');
% % pause(0.01);
% fwrite(s,'E', 'uchar');
% % pause(0.01);
% fwrite(s,'F', 'uchar');
% % pause(0.01);
% fwrite(s,'G', 'uchar');
% % pause(0.01);
% fwrite(s,'H', 'uchar');
% pause(0.01);
% pause(1);
% msg1 = '';
% reading = 1;
% readCounter = 10;
% while((reading == 1)&&(readCounter  > 0))
%     [out1, count1, msg1] = fread(s,1, 'uchar');
%     if(strcmpi(msg1,''))
%        reading = 0;
%     else
%         readCounter = readCounter - 1;
%     end
% end
% [out2, count2, msg2] = fread(s,1, 'uchar');
% [out3, count3, msg3] = fread(s,1, 'uchar');
% [out4, count4, msg4] = fread(s,1, 'uchar');
% [out5, count5, msg5] = fread(s,1, 'uchar');
% [out6, count6, msg6] = fread(s,1, 'uchar');
% [out7, count7, msg7] = fread(s,1, 'uchar');
% [out8, count8, msg8] = fread(s,1, 'uchar');
% 
% out1
% out2
% out3
% out4
% out5
% out6
% out7
% out8
% fprintf(s,'R');
% pause(0.001);
% % out1 = fscanf(s)
% fprintf(s,'O');
% pause(0.001);
% fprintf(s,'H');
% pause(0.001);
% fprintf(s,'I');
% pause(0.001);
% fprintf(s,'K');
% pause(0.001);
% fprintf(s,'U');
% pause(0.001);
% fprintf(s,'S');
% pause(0.001);
% fprintf(s,'H');
% pause(0.001);
% out1 = fscanf(s)
% pause(0.001);
% out2 = fscanf(s)
% pause(0.001);
% out3 = fscanf(s)
% pause(0.001);
% out4 = fscanf(s)
% pause(0.001);
% % pause(0.01);
% 
% out5 = fscanf(s)
% pause(0.001);
% out6 = fscanf(s)
% pause(0.001);
% out7 = fscanf(s)
% pause(0.001);
% out8 = fscanf(s)
% pause(0.001);
% % fprintf(s,'I ');
% % out1 = fscanf(s)
% % fprintf(s,'S');
% % out1 = fscanf(s)
% % fprintf(s,'K');
% % out1 = fscanf(s)
fclose(s)
delete(s)
clear s
fprintf('This part was executed\n');