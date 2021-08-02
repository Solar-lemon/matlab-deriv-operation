classdef DerivMtimes < DerivOperation
    properties
        x1
        x2
    end
    methods
        function obj = DerivMtimes(var1, var2)
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
                z_n = z_n + nchoosek(n, k)*obj.x1.deriv(n - k)*obj.x2.deriv(k);
            end
        end
    end
    
    methods(Static)
        function test()
            clc
            
            fprintf("== Test for DerivMtimes == \n")
            t = 1;
            var1 = DerivVariable(...
                diag([t^2, t]),...
                diag([2*t, 1]),...
                diag([2, 0]));
            var2 = DerivVariable(...
                diag([t^3, t]),...
                diag([3*t^2, 1]),...
                diag([6*t, 0]));
            
            fprintf("1. Using forward method \n")
            var = DerivMtimes(var1, var2).forward();
            fprintf("var.deriv(0): \n")
            disp(var.deriv(0))
            fprintf("var.deriv(1): \n")
            disp(var.deriv(1))
            fprintf("var.deriv(2): \n")
            disp(var.deriv(2))
            
            fprintf("2. Analytic result \n")
            fprintf("0-th order deriv: \n")
            disp(diag([t^5, t^2]))
            fprintf("1-th order deriv: \n")
            disp(diag([5*t^4, 2*t]))
            fprintf("2-th order deriv: \n")
            disp(diag([20*t^3, 2]))
        end
    end
end