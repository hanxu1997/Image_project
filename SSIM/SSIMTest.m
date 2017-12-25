clc;
close all;
clear;
addpath(genpath('..\BICUBIC'));
% 超分辨率评价指标：峰值信噪比测试
% RGB色彩空间转到YCbCr,只有Y通道来计算PSNR

% 计算Y通道
baboon = imread('..\set14\baboon.bmp');
baboon = rgb2ycbcr(baboon);
baboon = baboon(:,:,1);
[m, n] = size(baboon);
baboon1 = singleBicubic(baboon, round(m/3), round(n/3));
baboon2 = singleBicubic(baboon1, m, n);
% [mssim, ssim_map] = ssim_index(baboon, baboon2);
[mssim, ssim_map] = SSIM(baboon, baboon2);
mssim
