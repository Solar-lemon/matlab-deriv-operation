classdef LogDeriv < FunDeriv
    methods
        % implement
        function out = deriv(obj, x, N)
            out = nan(N + 1, 1);
            out(1) = log(x);
            if N > 0
                derivValues = PowerDeriv(-1).deriv(x, N - 1);
                out(2:end) = derivValues;
            end
        end
    end
    
    methods(Static)
        function test()
            clc
            
            fprintf("== Test for LogDeriv == \n")
            t = 2;
            xVar = DerivVariable(t^2, 2*t, 2);
            logVar = LogDeriv().forward(xVar);
            
            fprintf("1. Using forward methods \n")
            fprintf("[logVar.deriv(0), logVar.deriv(1), logVar.deriv(2)] \n")
            disp([logVar.deriv(0), logVar.deriv(1), logVar.deriv(2)])
            
            fprintf("2. Analytic result \n")
            z = log(t^2);
            z_dot = 2/t;
            z_2dot = -2/t^2;
            fprintf("[deriv(0), deriv(1), deriv(2)]: \n")
            disp([z, z_dot, z_2dot])
        end
    end
end
    