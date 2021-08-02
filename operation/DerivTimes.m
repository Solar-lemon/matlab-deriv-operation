classdef DerivTimes < DerivOperation
    properties
        x1
        x2
    end
    methods
        function obj = DerivTimes(var1, var2)
            % var1: DerivVariable, var: DerivVariable
            obj.x1 = var1;
            obj.x2 = var2;
        end
        
        % implement
        function z = forward(obj)
            N = max(obj.x1.order, obj.x2.order);
            values = cell(1 + N, 1);
            
            for n = 0:N
                values{1 + n} = obj.deriv(n);
            end
            z = DerivVariable(values{:});
        end
        
        function z_n = deriv(obj, n)
            % n: order
            z_n = 0;
            for k = 0:n
                z_n = z_n + nchoosek(n, k)*obj.x1.deriv(n - k).*obj.x2.deriv(k);
            end
        end
    end
    
    methods(Static)
        function test()
            clc
            
            fprintf("== Test for DerivTimes == \n")
            t = 1;
            var = DerivVariable(...
                [1, t], [0, 1]);
            
            fprintf("1. Using forward method \n")
            newVar = DerivTimes(var, var).forward();
            fprintf("var.deriv(0): \n")
            disp(newVar.deriv(0))
            fprintf("var.deriv(1): \n")
            disp(newVar.deriv(1))
            
            fprintf("2. Analytic result \n")
            fprintf("0-th order deriv: \n")
            disp([1, t^2])
            fprintf("1-th order deriv: \n")
            disp([0, 2*t])
        end
    end
end