classdef DerivPlus < DerivOperation
    properties
        x1
        x2
    end
    methods
        function obj = DerivPlus(var1, var2)
            % var1: DerivVariable, var2: DerivVariable
            obj.x1 = var1;
            obj.x2 = var2;
        end
        
        % implement
        function z = forward(obj)
            z = DerivVariable();
            z.order = max(obj.x1.order, obj.x2.order);
            
            for k = 0:z.order
                z_k = obj.x1.deriv(k) + obj.x2.deriv(k);
                z.setDeriv(k, z_k);
            end
        end   
    end
end