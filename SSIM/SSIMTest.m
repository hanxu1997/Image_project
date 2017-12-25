clc;
close all;
clear;
addpath(genpath('..\BICUBIC'));
% ���ֱ�������ָ�꣺��ֵ����Ȳ���
% RGBɫ�ʿռ�ת��YCbCr,ֻ��Yͨ��������PSNR

% ����Yͨ��
baboon = imread('..\set14\baboon.bmp');
baboon = rgb2ycbcr(baboon);
baboon = baboon(:,:,1);
[m, n] = size(baboon);
baboon1 = singleBicubic(baboon, round(m/3), round(n/3));
baboon2 = singleBicubic(baboon1, m, n);
% [mssim, ssim_map] = ssim_index(baboon, baboon2);
[mssim, ssim_map] = SSIM(baboon, baboon2);
mssim
