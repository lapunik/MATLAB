function [x, y, tau celkove_iterace] = aeuler_upgrade(fce, xa, xb, y0, h, tolerance)
y = [y0]; x = [xa];
i = 1;
decrease = true;
f = fce;

tau = [];
celkove_iterace = 0;

while (x(end) < xb)
    
    for j = 1:100
        celkove_iterace = celkove_iterace+1;
        if(~decrease)
            h = h*4;
        end
        
        y0 = y(i,:) + f(x(i), y(i,:))*h;
        
        h = h/2;
        
        y1 = y(i,:) + f(x(i), y(i,:))*h;
        y2 = y1 + f(x(i)+h, y1)*h;
        
        
        
        if(j == 1)
            if (tolerance < (max(abs(y0 - y2))))
                decrease = true;
            else
                decrease = false;
            end
        else
            if(decrease)
                if (tolerance >= (max(abs(y0 - y2))))
                    x(i+1) = x(i) + 2*h;
                    y(i+1,:) = y0;
                    tau(i) = (max(abs(y0 - y2)));
                    h = h*2;
                    break
                end
            else
                if (tolerance < (max(abs(y0 - y2))))
                    decrease = true;
                    h = h*2;
                end
            end
        end
    end
    
    i = i + 1;
end
end