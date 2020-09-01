close all;
clear;
clc;

% I=im2double(imread('HongQiaoTwo.jpg'));
I=im2double(imread('SingaporeOne.jpg'));

% SingaporeOne
B=reshape(I,1024*768,3);

omega = [5;-5;5];
lambda = 1;
x0 = [omega; lambda];

timeSpan = 0: 0.01: 10;
options = odeset();                                                    

[t, x] = ode45(@ZNNCore, timeSpan, x0, options);

temp = x(1001,:)';
beta = temp(1:3);

W=beta';
y=B*beta;

Y=reshape(y,768,1024);

BinY = Y;

% =======================================
T = graythresh(Y);
bw_img = imbinarize(Y, T);

foremm = bwmorph(bw_img,'dilate', 1);
labeled = bwlabel(foremm,4);

for myCountLen = 550 : 768
%     for myCountWid = 1 : 166
    for myCountWid = 1 : 240
        labeled(myCountLen, myCountWid) = 0;
    end
end

% find the largest connected region
img_reg = regionprops(labeled,  'area', 'boundingbox');
areas = [img_reg.Area];
rects = cat(1,img_reg.BoundingBox);

for countNum = 1 : length(rects)
    if rects(countNum, 3) * rects(countNum, 4) < 32
        rects(countNum, 3) = 0;
        rects(countNum, 4) = 0;
    end
end

% d1=GetTarget_d(I,bw_img,768,1024);%获取目标光谱d

figure(1),
imshow(bw_img)

imshow(labeled);
for i = 1:size(rects, 1)
    rectangle('position', rects(i, :), 'EdgeColor', 'g', 'LineWidth', 2);
end

hold on;
% =======================================

% subplot(121)
figure;
imshow(Y);
hold on;

% subplot(122)
figure;
imshow(I);
hold on;
