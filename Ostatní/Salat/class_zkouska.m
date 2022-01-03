classdef class_zkouska
    %CLASS_ZKOUSKA Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
       a
       vysledek
    end
    
    methods (Access = public)
        function obj = class_zkouska(aa)

            obj.a = aa;
        end
        
        function obj = inkrement(obj,diff)
            obj.vysledek = obj.a + diff;
        end
    end
end

