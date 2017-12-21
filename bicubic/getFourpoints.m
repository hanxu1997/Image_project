function points = getFourpoints(x, m)
% x: ����ĳ��������
% m: �˷�����ֵ����
    points = zeros(1,4);
    points(1) = x-1;
    points(2) = x;
    points(3) = x+1;
    points(4) = x+2;
    
    points(points < 1) = 1;
    points(points > m) = m;
end

