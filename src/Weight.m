function w = Weight(x)
% 计算权重
    absx = abs(x);
    absx2 = absx.^2;
    absx3 = absx.^3;
    w = (1.5*absx3 - 2.5*absx2 + 1) .* (absx <= 1) + ...
                    (-0.5*absx3 + 2.5*absx2 - 4*absx + 2) .* ...
                    ((1 < absx) & (absx <= 2));
end


% function w = Weight(x)

% % 计算权重
%     x = abs(x);
%     if x >= 0 && x <= 1
%        w = 1.5*(x^3)-2.5*(x^2)+1;
%     elseif  x > 1 && x <= 2
%         w = (-0.5)*(x^3)+2.5*(x^2)-4*x+2;
%     else 
%         w = 0;
%     end
% end

