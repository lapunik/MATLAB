function [x, y, tau celkove_iterace] = aeuler_upgrade_II(fce, xa, xb, y0, h, tolerance)
y = [y0]; x = [xa];
i = 1;
decrease = true;
was_down = false; % priznak, že podruhe za sebou dekrementuji, ne pokud neni krok = 2.... 
f = fce;


tau = [];
celkove_iterace = 0;

while (x(end) < xb)
    
    for j = 1:100
        
        celkove_iterace = celkove_iterace+1;
        
        if(~decrease)
            h = h*2;
        else
            h = h/2;
        end
        
         if(was_down)
         y0 = y1;
         was_down = false;
         else
        y0 = y(i,:) + f(x(i), y(i,:))*h;
         end
        y1 = y(i,:) + f(x(i), y(i,:))*(h/2);
        y2 = y1 + f(x(i)+(h/2), y1)*(h/2);
        
        difference = (max(abs(y0 - y2)));
        
        if(j == 1)
            if (tolerance < difference)
                decrease = true;
            else % pokud nam vyjde zvysovani kroku hned v prvni iteraci, vypocitame si eulera s dvojnasobnym krokem a pokud bude chyba moc velka, tak hodnoty vypocitane v hlavni smycce jsou ty spravne
                
                % odhad s dvojnasobnym krokem
                h=h*2;
                y0_hvezdicka = y(i,:) + f(x(i), y(i,:))*h;
                
                y1_hvezdicka = y(i,:) + f(x(i), y(i,:))*(h/2);
                y2_hvezdicka = y1_hvezdicka + f(x(i)+(h/2), y1)*(h/2);
                h = h/2;
                
                difference_hvezdicka = (max(abs(y0_hvezdicka - y2_hvezdicka)));
                
                if (tolerance < difference_hvezdicka) % uloz hodnoty vypocitane v hlavni smycce
                    x(i+1) = x(i) + h;
                    y(i+1,:) = y0;
                    tau(i) = difference;
                    break;
                else
                  decrease = false;                                  
                end
            end
        end
        
        if(decrease)
            if (tolerance >= difference)
                x(i+1) = x(i) + h;
                y(i+1,:) = y0;
                tau(i) = difference;
                break;
            end
             was_down = true;
         else
            if (tolerance < difference)
                
                 % ted uz vim ze jeden krok zpatky byl ten spravny..
                h=h/2;
                y0 = y(i,:) + f(x(i), y(i,:))*h;
                
                x(i+1) = x(i) + h;
                y(i+1,:) = y0;
                break;
            end
        end
        
    end
    
    i = i + 1;
end
end