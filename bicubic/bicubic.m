function output_img = bicubic(input_img, height, width)
    input_img = double(input_img);
    R = input_img(:,:,1);
    G = input_img(:,:,2);
    B = input_img(:,:,3);
%     R = graybicubic(R, height, width);
%     G = graybicubic(G, height, width);
%     B = graybicubic(B, height, width);
    R = anotherbicubic(R, height, width);
    G = anotherbicubic(G, height, width);
    B = anotherbicubic(B, height, width);
    output_img = uint8(cat(3, R, G, B));
end

