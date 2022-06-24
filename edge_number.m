function W = edge_number(x, y)

% 1: up
% 2: left
% 3: down
% 4: right

W = -1;
if x == 1
    W = 1;
elseif x == 120
    W = 3;
elseif y == 1
    W = 2;
elseif y == 160
    W = 4;
end

end