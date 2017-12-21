function w = Weight(x)
% ¼ÆËãÈ¨ÖØ
    x = abs(x);
    if x >= 0 && x <= 1
       w = 1.5*(x^3)-2.5*(x^2)+1;
    elseif  x > 1 && x <= 2
        w = (-0.5)*(x^3)+2.5*(x^2)-4*x+2;
    else 
        w = 0;
    end
end

