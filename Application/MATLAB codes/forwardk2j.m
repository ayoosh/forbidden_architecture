clear all;
clear all;

l1 = 0.5;
l2 = 0.5;
InputVector = [];
OutputVector = [];
A = mod(abs(randn(15)), pi/2);
[Am, An] = size(A);
theta1 = 0;
theta2 = 0;
% for theta1 = 0:0.005:pi/2
%     for theta2 = 0:0.005:pi/2

fprintf('Calculating Inputs & Outputs for Inversek2j\n');
for theta1 = 1:1:Am*An
    for theta2 = 1:1:Am*An
            new_theta = theta1 + theta2;
            x = l1*cos(theta1) + l2*cos(new_theta);
            y = l1*sin(theta1) + l2*sin(new_theta);
            new_theta2 = acos((x*x + y*y - l1*l1 - l2*l2)/(2*l1*l2));
            new_theta1 = asin(((y*(l1+l2*cos(new_theta2))) - (x*l2*sin(new_theta2)))/(x*x + y*y));
            if((isreal(new_theta2) == 1) && (isreal(new_theta1) == 1))
                input = [x y];
                input = transpose(input);
                InputVector = [InputVector input];
                output = [new_theta1 new_theta2];
                output = transpose(output);
                OutputVector = [OutputVector output];
            end
    end
end
fprintf('Begin training \n');

net = feedforwardnet([4]);
net.layers{1}.transferFcn = 'tansig';
net.layers{2}.transferFcn = 'tansig';
% net.layers{3}.transferFcn = 'tansig';
net.trainParam.epochs = 10000;
net = configure(net, InputVector, OutputVector);
net = train(net,InputVector, OutputVector);

view(net);
Weight=getwb(net);
display(Weight);
size(Weight);

fprintf('Training Done \n');
fprintf('Calculating neural network outputs \n');

nnOutputVector = [];
faultyInput = [];
faultyOutput = [];
faultyorigOutput = [];

validInput = [];
validOutput = [];
validorigOutput = [];
% for theta1 = 0.1:0.005:pi/2
%     for theta2 = 0.1:0.005:pi/2
for theta1 = 1:1:Am*An
    for theta2 = 1:1:Am*An
            new_theta = theta1 + theta2;
            x = l1*cos(theta1) + l2*cos(new_theta);
            y = l1*sin(theta1) + l2*sin(new_theta);
            new_theta2 = acos((x*x + y*y - l1*l1 - l2*l2)/(2*l1*l2));
            new_theta1 = asin(((y*(l1+l2*cos(new_theta2))) - (x*l2*sin(new_theta2)))/(x*x + y*y));
            if((isreal(new_theta2) == 1) && (isreal(new_theta1) == 1))
                nninput = [x y];
                original_output = [new_theta1 new_theta2];
                original_output = transpose(original_output);
                nninput = transpose(nninput);
                output = sim(net, nninput);
                difference = output(1,1) - new_theta1;
                nnOutputVector = [nnOutputVector output];
                if(difference < 0.02 && difference > -0.02)
%                     faultyInput = [faultyInput nninput];
%                     faultyOutput = [faultyOutput output];
%                     faultyorigOutput = [faultyorigOutput original_output];
%                 else
                    validInput = [validInput nninput];
                    validOutput = [validOutput output];
                    validorigOutput = [validorigOutput original_output];
                end                    
            end
    end
end
