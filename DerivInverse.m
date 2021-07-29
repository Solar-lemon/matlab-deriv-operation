classdef DerivInverse < DerivOperation
    properties
        x
    end
    methods
        function obj = DerivInverse(var)
            % var: DerivVariable
            obj.x = var;
        end
        
        % implement
        function z = forward(obj)
            z = DerivVariable();
            z.order = obj.x.order;
            
            x_0 = obj.x.deriv(0);
            z_0 = inv(x_0);
            z.setDeriv(0, z_0);
            for n = 1:z.order
                sum = 0;
                for k = 0:n - 1
                	sum = sum + ...
                        nchoosek(n, k)*obj.x.deriv(n - k)*z.deriv(k);
                end
                z_n = -z_0*sum;
                z.setDeriv(n, z_n);
            end
        end
    end
    
    methods(Static)
        function test()
            clc
            
            fprintf("== Test for DerivMtimes == \n")
            t = 1;
            var = DerivVariable(...
                diag([t^2, t]),...
                diag([2*t, 1]),...
                diag([2, 0]));
            
            fprintf("1. Using forward method \n")
            invVar = DerivInverse(var).forward();
            fprintf("var.deriv(0): \n")
            disp(invVar.deriv(0))
            fprintf("var.deriv(1): \n")
            disp(invVar.deriv(1))
            fprintf("var.deriv(2): \n")
            disp(invVar.deriv(2))
            
            fprintf("2. Analytic result \n")
            fprintf("0-th order deriv: \n")
            disp(diag([1/t^2, 1/t]))
            fprintf("1-th order deriv: \n")
            disp(diag([-2/t^3, -1/t^2]))
            fprintf("2-th order deriv: \n")
            disp(diag([6/t^4, 2/t^3]))
        end
    end
end