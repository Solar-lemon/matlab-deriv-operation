classdef DerivMinus < DerivOperation
    properties
        x1
        x2
    end
    methods
        function obj = DerivMinus(var1, var2)
            % var1: DerivVariable, var2: DerivVariable
            obj.x1 = var1;
            obj.x2 = var2;
        end
        
        % implement
        function z = forward(obj)
            N = max(obj.x1.order, obj.x2.order);
            values = cell(1 + N, 1);
            
            for n = 0:N
                values{1 + n} = obj.x1.deriv(n) - obj.x2.deriv(n);
            end
            z = DerivVariable(values{:});
        end 
    end
end