function output_img = validfilter2d( input_img, filter)
%���˲���filter������ͼ���˲�
% valid �����ھ�������У�
% δʹ�ñ�Ե�� 0 ���ֽ��м���ľ���������
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

