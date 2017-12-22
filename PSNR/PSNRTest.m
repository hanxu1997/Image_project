clc;
close all;
clear;
addpath(genpath('..\bicubic'));
% 超分辨率评价指标：峰值信噪比测试
% RGB色彩空间转到YCbCr,只有Y通道来计算PSNR

% 计算Y通道
baboon = imread('..\set14\baboon.bmp');
baboon = rgb2ycbcr(baboon);
baboon1 = baboon(:,:,1);

baboon2 = imresize(baboon, 3, 'bicubic','Antialiasing',false);
