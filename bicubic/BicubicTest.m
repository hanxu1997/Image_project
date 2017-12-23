clc;
close all;
clear;

baboon = imread('..\Set14\baboon.bmp');
figure(1);
subplot(2,3,1);
imshow(baboon);
imwrite(baboon, '..\output\BicubicTest\baboon.bmp');
matlab_baboon1 = imresize(baboon, 1/3, 'bicubic','Antialiasing',false);
subplot(2,3,2);
imshow(matlab_baboon1);
imwrite(matlab_baboon1, '..\output\BicubicTest\matlab_baboon1.bmp');
matlab_baboon2 = imresize(matlab_baboon1, 3, 'bicubic','Antialiasing',false);
subplot(2,3,3);
imshow(matlab_baboon2);
imwrite(matlab_baboon2, '..\output\BicubicTest\matlab_baboon2.bmp');
% -----------------------------
figure(1);
subplot(2,3,4);
imshow(baboon);
[m, n] = size(baboon(:,:,1));
tic
my_baboon1 = bicubic(baboon, round(m/3), round(n/3));
subplot(2,3,5);
imshow(my_baboon1);
imwrite(my_baboon1, '..\output\BicubicTest\my_baboon1.bmp');
my_baboon2 = bicubic(my_baboon1, m, n);
% my_baboon2 = imresize(my_baboon1, 3, 'bicubic','Antialiasing',false);
subplot(2,3,6);
imshow(my_baboon2);
imwrite(my_baboon2, '..\output\BicubicTest\my_baboon2.bmp');
toc
