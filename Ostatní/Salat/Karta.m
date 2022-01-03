classdef Karta
    
    properties
        zelenina
        bodovani
    end
    
    methods
        function obj = Karta(z,b)
            obj.zelenina = z;
            obj.bodovani = b;
        end
    end
    
    methods(Static)
        function balik = Zamichej(pocet_hracu)
            karty = [ones(1,18) ones(1,18).*2 ones(1,18).*3 ones(1,18).*4 ones(1,18).*5 ones(1,18).*6; 1:18 1:18 1:18 1:18 1:18 1:18];
            karty = karty(:,randperm(108,pocet_hracu*18));
                        
            for i = 1:pocet_hracu*18
                balik(i) = Karta(karty(1,i),karty(2,i));
            end

        end
    end
end

