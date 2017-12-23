clc;
close all;
clear;
addpath(genpath('..\bicubic'));
% ���ֱ�������ָ�꣺��ֵ����Ȳ���
% RGBɫ�ʿռ�ת��YCbCr,ֻ��Yͨ��������PSNR

% ����Yͨ��
baboon = imread('..\set14\baboon.bmp');
baboon = rgb2ycbcr(baboon);
baboon1 = baboon(:,:,1);
[m, n] = size(baboon1);
baboon2 = anotherbicubic(baboon1, round(m/3), round(n/3));
baboon2 = anotherbicubic(baboon2, m, n);
psnr1 = PSNR(baboon1, baboon2)