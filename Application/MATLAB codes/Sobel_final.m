clear all;
close all;

A = imread('lena_gray_512', 'jpg');
A = rgb2gray(A);
newA = imresize(A,0.4);
BW1 = edge(newA, 'sobel');
figure(1);
imshow(BW1);

[Am, An] = size(newA);

rowIndex = 0;
columnIndex = 0;
mask_size = 3;


nnInputVector = [];
nnOutputVector = [];

fprintf('Calculating Input & Output for Lena\n');
offset = (mask_size-1)/2;

for rowIndex = 1+offset:1:Am-offset
    for columnIndex = 1+offset:1:An-offset
             nnInput1 = double(newA(rowIndex-offset:rowIndex+offset, columnIndex-offset:columnIndex+offset));
             nnOutput1 = double(BW1(rowIndex, columnIndex));
             nnInput1 = reshape(nnInput1, mask_size*mask_size, 1);
             nnInputVector = [nnInputVector nnInput1];
             nnOutputVector = [nnOutputVector nnOutput1];
    end
end

B = imread('mandril_gray', 'jpg');
B = rgb2gray(B);
newB = imresize(B, 0.4);
BW2 = edge(newB, 'sobel');

fprintf('Calculating Input & Output for Mandril\n');
[Bm, Bn] = size(newB);

for rowIndex = 1+offset:1:Bm-offset
    for columnIndex = 1+offset:1:Bn-offset
        nnInput2 = double(newB(rowIndex-offset:rowIndex+offset, columnIndex-offset:columnIndex+offset));
        nnOutput2 = double(BW2(rowIndex, columnIndex));
        nnInput2 = reshape(nnInput2, mask_size*mask_size, 1);
        nnInputVector = [nnInputVector nnInput2];
        nnOutputVector = [nnOutputVector nnOutput2];
    end
end

fprintf('Calculating Input & Output for Peppers\n');
C = imread('peppers_gray', 'jpg');
C = rgb2gray(C);
newC = imresize(C, 0.4);
BW3 = edge(newC, 'sobel');

[Cm, Cn] = size(newC);

for rowIndex = 1+offset:1:Cm-offset
    for columnIndex = 1+offset:1:Cn-offset
        nnInput3 = double(newC(rowIndex-offset:rowIndex+offset, columnIndex-offset:columnIndex+offset));
        nnOutput3 = double(BW3(rowIndex, columnIndex));
        nnInput3 = reshape(nnInput3, mask_size*mask_size, 1);
        nnInputVector = [nnInputVector nnInput3];
        nnOutputVector = [nnOutputVector nnOutput3];
    end
end
 
fprintf('Training On-going .... \n');

net = feedforwardnet([8]);
net.layers{1}.transferFcn = 'tansig';
net.layers{2}.transferFcn = 'tansig';
% net.layers{3}.transferFcn = 'tansig';
net.trainParam.epochs = 1000;

net = train(net,nnInputVector,nnOutputVector);
view(net);
Weight=getwb(net);
display(Weight);
size(Weight);

fprintf('Training Done \n');
fprintf('Calculating neural network outputs for Lena \n');


OutputVector = [];
for rowIndex = 1+offset:1:Am-offset
    for columnIndex = 1+offset:1:An-offset
            nnTest1 = double(newA(rowIndex-offset:rowIndex+offset, columnIndex-offset:columnIndex+offset));
            nnTest1 = reshape(nnTest1, mask_size*mask_size, 1);
            Output4 = 255*(sim(net,nnTest1));
            new_image1(rowIndex-1, columnIndex-1) = Output4;
            
            if(Output4 >= 128)
                new_image3(rowIndex-1, columnIndex-1) = 255;
            else
                new_image3(rowIndex-1, columnIndex-1) = 0;
            end
    end
end

fprintf('Displaying neural network output for Lena using 255 multiplication\n');
figure(2);
imshow(new_image1);

fprintf('Displaying neural network output for Lena with threshold value\n');
figure(5);
imshow(new_image3);

fprintf('Calculating neural network Outputs for HUGH LAURIE :)\n');

H = imread('Hugh', 'jpg');
H = rgb2gray(H);
newH = imresize(H, 0.7);
BW4 = edge(newH, 'sobel');
fprintf('sobel function generated image is \n');
figure(3);
imshow(BW4);
[Hm, Hn] = size(newH);

for rowIndex = 1+offset:1:Hm-offset
    for columnIndex = 1+offset:1:Hn-offset
            nnTest2 = double(newH(rowIndex-offset:rowIndex+offset, columnIndex-offset:columnIndex+offset));
            nnTest2 = reshape(nnTest2, mask_size*mask_size, 1);
            new_image2(rowIndex-1, columnIndex-1) = (sim(net,nnTest2));
%             if(Output5 >= 128)
%                 new_image2(rowIndex-1, columnIndex-1) = 255;
%             else
%                 new_image2(rowIndex-1, columnIndex-1) = 0;
%             end
    end
end

fprintf('Displaying neural network output for HUGH LAURIE :D \n');
figure(4);
imshow(new_image2);
