clc;
clear all;
close all;
delete(instrfindall)
% uint32 datasend;
B = imread('emma_640_480', 'jpg');
A=rgb2gray(B);
% figure(1);
% imshow(A);
[Am, An] = size(A);
imgTrans = A';
img1D = imgTrans(:);
img1D = uint32(img1D);

while(1)
    s = serial('COM1');
    set(s,'BaudRate',38400);
    % set(s, 'InputBufferSize', 1);
    % set(s, 'OutputBufferSize', 1);
    set(s,'DataBits',8);
    set(s,'StopBit',1);
    set(s,'Parity', 'none');
    set(s, 'FlowControl', 'none');
    fopen(s);
    
    count = 0;
    command = 0;
    
    while((count == 0) || (command ~=105))
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
        %         fprintf('Sending extra data\n');
        %         for index = 1:4:(640*480)
        %             datasend = bitor(img1D(index), bitor(bitshift(img1D(index+1), 8), bitor(bitshift(img1D(index+2), 16), bitshift(img1D(index+3), 24))));
        %             fwrite(s, datasend, 'uint32');
        %         end
        fprintf('Done sending data\n');
    end
    
    while(1)
        %if (command == 100)
        userin = input('Enter: o - original image, a - sobel algo image, n - npu image\nx - exit local program, r - restart\n', 's');
        if (userin == 'o')
            datasend = 115;
            fwrite(s, datasend, 'uint32');
            fprintf('Sent Original image display command to FPGA\n');
%             while((count == 0))
%                 [tics_o, count] = fread(s,1, 'uint32');
%             end
%             tics_o
        elseif (userin == 'a')
            datasend = 116;
            fwrite(s, datasend, 'uint32');
            fprintf('Sent Algo image display command to FPGA\n');
%             while((count == 0))
%                 [tics_a, count] = fread(s,1, 'uint32');
%             end
%             tics_a
        elseif (userin == 'n')
            datasend = 117;
            fwrite(s, datasend, 'uint32');
            fprintf('Sent Algo image display command to FPGA\n');
%             while((count == 0))
%                 [tics_n, count] = fread(s,1, 'uint32');
%             end
%             tics_n
        elseif (userin == 'x')
            break;
        elseif (userin == 'r')
            break;
        else
            datasend = 0;
            fwrite(s, datasend, 'uint32');
            fprintf('Sent junk command to FPGA\n');
        end
        
    end
    
    
    fclose(s);
    delete(s);
    clear s;
    if (userin ~= 'r')
        break;
    end
end


