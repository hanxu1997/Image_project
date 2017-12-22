function output = PSNR(X, Y)
    % X 原图
    % Y 近似图像
    [M, N] = size(X);
    % 遍历每一点算均方差
    parm1 = 1/(M*N);
    parm2 = (X - Y).^2;
    sumnum = sum(sum(parm2));
    MSE = sumnum .* parm1;   
    % 由公式计算PSNR
    parm3 = sqrt(MSE);
    output = 20 * log10(255/parm3);
end

