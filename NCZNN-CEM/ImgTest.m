close all;
clear;
clc;

Img = im2double(imread('HongQiaoThree.jpg'));
[M, N, L] = size(Img);
vecImg = reshape(Img, M * N, L);
tranVecImg = vecImg';
R = (tranVecImg * vecImg)/(M*N);