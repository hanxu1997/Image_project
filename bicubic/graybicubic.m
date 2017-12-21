function output_img = graybicubic(input_img, height, width)
    input_img = double(input_img);
    [m, n] = size(input_img);
    a = height; 
    b = width;
    output_img = zeros(a,b);
    xscale = m/a;
    yscale = n/b;
    % xindice: x�����±����
    % yindice: y�����±����
    xlabels = zeros(a,b);
    xindice = rem(find(xlabels==0)-1,a)+1;
    xindice = reshape(xindice, a, b);
    ylabels = zeros(a,b);
    yindice = rem(find(ylabels==0)-1,b)+1;
    yindice = reshape(yindice, b, a);
    yindice = yindice';

    % �����Ӧԭͼ16���������
    % ÿ�����ص��Ӧԭͼx����
    xinImg = xscale .* xindice;
    xfloor = floor(xinImg);
    x0 = xfloor - 1;
    x1 = xfloor;
    x2 = xfloor + 1;
    x3 = xfloor + 2;
    xpoints = cat(4, x0, x1, x2, x3);
    xpoints(find(xpoints < 1)) = 1;
    xpoints(find(xpoints > m)) = m;
    % ÿ�����ص��Ӧԭͼy����
    yinImg = yscale .* yindice;
    yfloor = floor(yinImg);
    y0 = yfloor - 1;
    y1 = yfloor;
    y2 = yfloor + 1;
    y3 = yfloor + 2;
    ypoints = cat(4, y0, y1, y2, y3);
    % ypoints = permute(ypoints, [1,2,4,3]);
    ypoints(find(ypoints < 1)) = 1;
    ypoints(find(ypoints > n)) = n;

    % ����Ȩ��
    w_x0 = xinImg - (xfloor - 1);
    w_x1 = xinImg - xfloor;
    w_x2 = xinImg - (xfloor + 1);
    w_x3 = xinImg - (xfloor + 2);
    xWeightparms = cat(4, w_x0, w_x1, w_x2, w_x3);
    xWeightparms = abs(xWeightparms);
    w_y0 = yinImg - (yfloor - 1);
    w_y1 = yinImg - yfloor;
    w_y2 = yinImg - (yfloor + 1);
    w_y3 = yinImg - (yfloor + 2);
    yWeightparms = cat(4, w_y0, w_y1, w_y2, w_y3);
    yWeightparms = abs(yWeightparms);
    yWeightparms = permute(yWeightparms, [1,2,4,3]);
    wx = Weight(xWeightparms);
    wy = Weight(yWeightparms);

    % �������ͼ���е�ÿһ������
    for x = 1:a
        for y = 1:b
            xFour = squeeze(xpoints(x,y,:,:));
            yFour = squeeze(ypoints(x,y,:,:));
            p = input_img(xFour,yFour);
            xweight = squeeze(wx(x,y,:,:))';
            yweight = squeeze(wy(x,y,:,:));
            item = xweight * p * yweight;
            result = sum(sum(item));
            output_img(x,y) = result;
        end
    end
end

