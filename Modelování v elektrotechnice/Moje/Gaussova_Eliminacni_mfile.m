A = [4 3 4;5 3 2;4 0 1];
b = [10 0 13]';

x = Gaussova_Eliminacni(A,b)

function [x] = Gaussova_Eliminacni(A,b)

Ab = cat(2,A,b);

[row,column] = size(Ab);

% dopredna redukce
for i = 1 : column-1 % sloupec
     
    if Ab(i,i) ~= 1
         Ab(i,:) = Ab(i,:) ./ Ab(i,i);
     end 
     
    for j = i + 1 : row % radek
            
        if Ab(j,i) ~= 0
       
            Ab(j,:)= Ab(j,:) ./ Ab(j,i);
            Ab(j,:) = Ab(j,:) - Ab(i,:);
            
        end
    
    end
end

% zpetna substituce (dodelat)
for i = column-1:-1:2
    
    for j = i-1:-1:1 % radek
    
    Ab(j,:) = Ab(j,:) -(Ab(j,i) .* Ab(i,:)); 
    
    end
    
end

x = Ab(:,column);

end

