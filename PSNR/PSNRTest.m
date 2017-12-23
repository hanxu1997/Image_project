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
[m, n] = size(baboon1);
baboon2 = anotherbicubic(baboon1, round(m/3), round(n/3));
baboon2 = anotherbicubic(baboon2, m, n);
psnr1 = PSNR(baboon1, baboon2)