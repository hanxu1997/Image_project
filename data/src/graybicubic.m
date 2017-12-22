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
            p_xy = input_img(xparm, yparm);
            xinput = [x-xparm(1), x-xparm(1), x-xparm(2), x-xparm(3)];
            wx = Weight(xinput);
            yinput = [y-yparm(1), y-yparm(2), y-yparm(3), y-yparm(4)];
            wy = Weight(yinput)';
            sumnum = wx * p_xy * wy;
            output_img(p,q) = sumnum;
        end
    end
    output_img = uint8(output_img);
end

