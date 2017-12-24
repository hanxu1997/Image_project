function output_img = singleBicubic(input_img, height, width)
    input_img = double(input_img);
    [m, n] = size(input_img);
    a = height; 
    b = width;
    output_img = zeros(a,b);
    xscale = m/a;
    yscale = n/b;
    input_img = padarray(input_img,[2, 2]);
    % 遍历输出图像中的每一个矩阵
    for x = 1:a
        for y = 1:b
            X = xscale * x + 2;
            Y = yscale * y + 2;
            j = floor(X);
            u = X - j;
            k = floor(Y);
            v = Y - k;
            xweight = [1+u, u, 1-u, 2-u];
            yweight = [1+v, v, 1-v, 2-v];
            xweight = Weight(xweight);
            yweight = Weight(yweight)';
%             xFour = [j-1, j, j+1, j+2];
%             yFour = [k-1, k, k+1, k+2];
%             p = input_img(xFour,yFour);
            p = [input_img(j-1,k-1), input_img(j-1, k), input_img(j-1, k+1), input_img(j-1, k+2);
                input_img(j,k-1), input_img(j, k), input_img(j, k+1), input_img(j, k+2);
                input_img(j+1,k-1), input_img(j+1, k), input_img(j+1, k+1), input_img(j+1, k+2);
                input_img(j+2,k-1), input_img(j+2, k), input_img(j+2, k+1), input_img(j+2, k+2);];
            item = xweight * p * yweight;
%             weight = yweight * xweight;
%             item = sum(sum(weight .* p));
            output_img(x,y) = item;
        end
    end
end

