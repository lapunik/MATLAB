classdef Dobiraci_balicek
    
    properties
        balicek
        trh
    end
    
    methods (Access = public)
        function obj = Dobiraci_balicek(b)
            obj.trh = b(1:2);
            obj.balicek = b(3:end);
        end
        
%         function [obj,karta] = Nakup(obj,k)
%             karta = obj.trh(k); 
%             obj.trh(k) = [];
%             if (~isempty(obj.balicek))
%                 obj.trh(k) = obj.balicek(1);
%                 obj.balicek(1) = [];
%             end
%         end
    end
end

