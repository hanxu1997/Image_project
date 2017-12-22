function output = PSNR(X, Y)
    % X ԭͼ
    % Y ����ͼ��
    [M, N] = size(X);
    % ����ÿһ���������
    parm1 = 1/(M*N);
    parm2 = (X - Y).^2;
    sumnum = sum(sum(parm2));
    MSE = sumnum .* parm1;   
    % �ɹ�ʽ����PSNR
    parm3 = sqrt(MSE);
    output = 20 * log10(255/parm3);
end

