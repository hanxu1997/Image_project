clc;
close all;
clear;
addpath(genpath('..\bicubic'));
% ���ֱ�������ָ�꣺��ֵ����Ȳ���
% RGBɫ�ʿռ�ת��YCbCr,ֻ��Yͨ��������PSNR

% ����Yͨ��
baboon = imread('..\set14\baboon.bmp');
baboon = rgb2ycbcr(baboon);
baboon = baboon(:,:,1);
[m, n] = size(baboon);
baboon1 = singleBicubic(baboon, round(m/3), round(n/3));
baboon2 = singleBicubic(baboon1, m, n);
psnr1 = PSNR(baboon, baboon2)
