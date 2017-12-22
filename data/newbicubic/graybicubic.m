function output_img = graybicubic(input_img, height, width)
    input_img = double(input_img);
    [m, n] = size(input_img);
    a = height; 
    b = width;
    xscale = m/a;
    yscale = n/b;
    output_img = zeros(a,b);
    for p = 1:a
        x = floor(xscale*p);
        xparm = getFourpoints(x,m);
        for q = 1:b
            y = floor(yscale*q);
            yparm = getFourpoints(y,n);
            sum = 0;
            for i = 1:4
                for j = 1:4
                    p_xy = input_img(xparm(i),yparm(i));
                    wx = Weight(xscale*p - xparm(i));
                    wy = Weight(yscale*q - yparm(j));
                    item = p_xy * wx * wy;
                    sum = sum + item;
                end
            end
            output_img(p,q) = sum;
        end
    end
    output_img = uint8(output_img);
end

