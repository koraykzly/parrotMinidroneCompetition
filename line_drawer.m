function [distance] = line_drawer(x1,y1, x2, y2, u, compare)
    swapepd = 0;
    if abs(y2 - y1) > abs(x2 - x1)
        
        swapepd = 1;
        [x1,y1] = deal(y1,x1);
        [x2,y2] = deal(y2,x2);
        xk = 1; yk = 1;
        if (x2 < x1) 
            xk = -1; 
        end
        if (y2 < y1) 
            yk = -1; 
        end
    else
        xk = -1; yk = -1;
        if (x2 > x1) 
            xk = 1; 
        end
        if (y2 > y1) 
            yk = 1; 
        end
    end
    dy = abs(y2-y1);
    dx = abs(x2-x1);
    
    % --------------------------------------

    distance = 0;
    m = 2 * dy;
    slope_error = m - 2*dx;
  
    y = y1;
    range = 1;
    for x = x1:xk:x2
        if swapepd == 1
            if u(y,x) == compare
                distance = range;
                break;
            end
        else
            if u(x,y) == compare
                distance = range;
                break;
            end
        end
        range = range + 1;
   
        slope_error = slope_error + m;
        if (slope_error > 0)
            y = y + yk;
            slope_error = slope_error - 2 * dx;
        end
    end
end
