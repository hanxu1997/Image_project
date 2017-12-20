function points = getFourpoints(x, m)
% x: 输入某方向坐标
% m: 此方向数值上限
    points = zeros(1,4);
    points(1) = x-1;
    points(2) = x;
    points(3) = x+1;
    points(4) = x+2;
%     if x == 1 
%         points(1) = 1;
%     end
%     if x < 1
%         points(1) = 1;
%         points(2) = 1;
%     end
%     if x > m - 1
%         points(3) = m;
%         points(4) = m;
%     end
%     if x > m-2
%         points(4) = m;
%     end
    points(points < 1) = 1;
    points(points > m) = m;
end

