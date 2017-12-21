function output_img = graybicubic(input_img, height, width)
    input_img = double(input_img);
    [m, n] = size(input_img);
    a = height; 
    b = width;
    xscale = m/a;
    yscale = n/b;
    xlabels = zeros(a,b);
    xlabels = xscale .* find(xlabels == 0);
    
end

