function output_img = bicubic(input_img, height, width)
    input_img = double(input_img);
    R = input_img(:,:,1);
    G = input_img(:,:,2);
    B = input_img(:,:,3);
%     R = graybicubic(R, height, width);
%     G = graybicubic(G, height, width);
%     B = graybicubic(B, height, width);
    R = singleBicubic(R, height, width);
    G = singleBicubic(G, height, width);
    B = singleBicubic(B, height, width);
    output_img = uint8(cat(3, R, G, B));
end

