classdef ExpDeriv < FunDeriv
    methods
        % implement
        function out = deriv(obj, x, N)
            out = exp(x)*ones(N + 1, 1);
        end
    end
    
    methods(Static)
        function test()
            clc
            
            fprintf("== Test for ExpDeriv == \n")
            t = 0.5;
            xVar = DerivVariable(t^2, 2*t, 2);
            expVar = ExpDeriv().forward(xVar);
            
            fprintf("1. Using forward methods \n")
            fprintf("[expVar.deriv(0), expVar.deriv(1), expVar.deriv(2)] \n")
            disp([expVar.deriv(0), expVar.deriv(1), expVar.deriv(2)])
            
            fprintf("2. Analytic result \n")
            z = exp(t^2);
            z_dot = 2*t*exp(t^2);
            z_2dot = 2*(1 + 2*t^2)*exp(t^2);
            fprintf("[deriv(0), deriv(1), deriv(2)]: \n")
            disp([z, z_dot, z_2dot])
        end
    end
end