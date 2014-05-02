clc;
clear all;
close all;
delete(instrfindall) 

B = imread('emma_640_480', 'jpg');
A=rgb2gray(B);
% figure(1);
% imshow(A);
[Am, An] = size(A);
imgTrans = A';
img1D = imgTrans(:);
img1D = uint32(img1D);

s = serial('COM1');
set(s,'BaudRate',38400);
% set(s, 'InputBufferSize', 1);
% set(s, 'OutputBufferSize', 1);
set(s,'DataBits',8);
set(s,'StopBit',1);
set(s,'Parity', 'none');
set(s, 'FlowControl', 'none');

fopen(s);

while(1)
    count = 0;
    command = 0;
    
    while((count == 0)) 
        [command, count] = fread(s,1, 'uint32');
    end
    fprintf('Got command from FPGA\n');
    command
        
    if (command == 105)
        fprintf('Sending data\n');
        for index = 1:4:(640*480)
            datasend = bitor(img1D(index), bitor(bitshift(img1D(index+1), 8), bitor(bitshift(img1D(index+2), 16), bitshift(img1D(index+3), 24))));
            fwrite(s, datasend, 'uint32');
        end
        fprintf('Sending extra data\n');
        for index = 1:4:(640*48)
            datasend = bitor(img1D(index), bitor(bitshift(img1D(index+1), 8), bitor(bitshift(img1D(index+2), 16), bitshift(img1D(index+3), 24))));
            fwrite(s, datasend, 'uint32');
        end
        fprintf('Done sending data\n');
    end
end
 
fclose(s);
delete(s);
clear s;
