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

baboon2 = imresize(baboon, 3, 'bicubic','Antialiasing',false);
