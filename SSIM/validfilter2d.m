function output_img = validfilter2d( input_img, filter)
%用滤波器filter对输入图像滤波
% valid 返回在卷积过程中，
% 未使用边缘补 0 部分进行计算的卷积结果部分
    [m,n] = size(input_img);
    [a,b] = size(filter);
    temp1 = double(input_img);
    output_img = temp1;
    for i = 1:m-a+1
        for j = 1:n-b+1
            matrix1 = temp1(i:i+(a-1),j:j+(b-1)).* filter;
            midnum = sum(sum(matrix1));
            output_img(i,j) = midnum;
        end
    end
    output_img = output_img(1:m-a+1,1:n-b+1);
end

