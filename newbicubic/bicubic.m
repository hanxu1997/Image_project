function output_img = bicubic(input_img, height, width)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    input_img = double(input_img);
    R = input_img(:,:,1);
    G = input_img(:,:,2);
    B = input_img(:,:,3);
    R = graybicubic(R, height, width);
    G = graybicubic(G, height, width);
    B = graybicubic(B, height, width);
    output_img = cat(3, R, G, B);
    
   
end

