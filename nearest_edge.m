function [X, Y] =  nearest_edge(x, y)

X = x;  Y = y;

top_d = abs(1 - x);
below_d = abs(120 - x);

if top_d < below_d 
    xd = top_d; 
else 
    xd = below_d; 
end

left_d = abs(1 - y);
right_d = abs(160 - y);

if left_d < right_d 
    yd = left_d; 
else 
    yd = right_d; 
end

if xd < yd
    if top_d < below_d  
        X = 1; 
    else 
        X = 120; 
    end
else
    if left_d < right_d
        Y = 1; 
    else
        Y = 160; 
    end
end

if X < 1
    X = 1;
end
if Y < 1
    Y = 1;
end

end