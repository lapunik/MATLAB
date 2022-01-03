classdef Hrac
    
    properties
        recept
        ingredience
    end
    
    methods (Access = public)
        
        function obj = Hrac()
        end
        
        function [obj,balicek] = Nakup(obj, balicek ,karta)
        
            [obj,balicek] = balicek.Nakup(karta);
        end
    end
    
    methods(Static)
        function hraci = Vytvor_hrace(pocet_hracu)
            for i = 1:pocet_hracu
                hraci(i) = Hrac();
            end 
        end
    end
end

