clear all;
close all;

B = imread('emma_640_480', 'jpg');
%PQR = imread('Hermi', 'jpg');
A=rgb2gray(B);

A = imresize(A,0.1);
BW = edge(A, 'sobel', 0.1);
figure(1);
imshow(A);
figure(10);
imshow(BW);

[Am, An] = size(A);

% Image Transpose
imgTrans = A';
% iD conversion
img1D = imgTrans(:);
% Decimal to Hex value conversion
%imgHex = dec2hex(img1D);
% New txt file creation
fid = fopen('inputHex.coe', 'wt');
% Hex value write to the txt file
fprintf(fid,'memory_initialization_radix=16;\n');
fprintf(fid,'memory_initialization_vector=\n');

for rowIndex = 1:8:Am*An

    for temp = 1:1:8
if(img1D(rowIndex+8-temp) > 15)    
%fprintf(fid, '000000');
fprintf(fid, '%x', img1D(rowIndex+8-temp));

else
fprintf(fid, '0');
fprintf(fid, '%x', img1D(rowIndex+8-temp));
end    

    end

%if(mod(rowIndex,8) == 0 )
    
if(rowIndex == Am*An)
fprintf(fid, ';\n', img1D(rowIndex));
else
fprintf(fid, ',\n', img1D(rowIndex));
end



end

% Close the txt file
fclose(fid)