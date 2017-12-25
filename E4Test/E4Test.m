clc;
close all;
clear;
addpath(genpath('..\PSNR'));
addpath(genpath('..\SSIM'));
addpath(genpath('..\BICUBIC'));

imgPath = '../Set14/';
Files = dir([imgPath '*.bmp']);
length = length(Files);
psnr = zeros(1,14);
ssim = zeros(1,14);

for i = 1:length
    img = imread([imgPath Files(i).name]);
    if isrgbIMG(img) == 1
        img = rgb2ycbcr(img);
        img = img(:,:,1);
    end
    [m, n] = size(img);
    img1 = singleBicubic(img, round(m/3), round(n/3));
    img2 = singleBicubic(img1, m, n);
    [mssim, ssim_map] = SSIM(img, img2);
    psnr(i) = PSNR(img, img2);
    ssim(i) = mssim;
end
xlswrite('psnrResult.xls', psnr');
xlswrite('ssimResult.xls', ssim');

