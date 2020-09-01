close all;
clear;
clc;

I=im2double(imread('SingaporeOne.jpg'));
% I=im2double(imread('HongQiaoTwo.jpg'));
B=reshape(I,1024*768,3);
C=transpose(B);

omega = [10;-10;10];
lambda = 8;
x0 = [omega; lambda];

timeSpan = 0: 0.01: 10;
options = odeset();
[t, x] = ode45(@ZNNCore, timeSpan, x0, options);

G = MatrixG;
vecB = [0, 0, 0, 1]';
for j = 1:length(t)
    err(j, :) = G * x(j,1:4)' - vecB;
    nerr(j) = norm(err(j, :));
end


set(gca,'FontSize',14)
plot(t, nerr, 'LineWidth', 2);
txt = {'||{\itE}(t)||_F'};
text(0.6,0,txt)
txt = {'{\itt} (s)'};
text(2,0.3,txt)
hold on;

% savefig('HQ_norm');