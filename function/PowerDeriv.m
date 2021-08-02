classdef PowerDeriv < FunDeriv
    properties
        % r: power (real number)
        r
    end
    methods
        function obj = PowerDeriv(r)
            obj = obj@FunDeriv();
            obj.r = r;
        end
        
        % implement
        function out = deriv(obj, x, N)
            coeff = nan(1 + N, 1);
            basis = nan(1 + N, 1);
            
            coeffTemp = 1;
            basisTemp = power(x, obj.r - N);
            
            for n = 0:N
                coeff(1 + n) = coeffTemp;
                basis(1 + N - n) = basisTemp;
                
                coeffTemp = coeffTemp*(obj.r - n);
                basisTemp = basisTemp*x;
            end
            out = coeff.*basis;
        end
    end
    
    methods(Static)
        function test()
            clc
            
            fprintf("== Test for PowerDeriv == \n")
            power = PowerDeriv(3);
            derivValues = power.deriv(1, 3);
            fprintf("derivValues: \n")
            disp(derivValues.')
            
            fprintf("1. Using forward methods \n")
            t = 2;
            xVar = DerivVariable(...
                [1; t], ...
                [0; 1], ...
                [0; 0]);
            xTVar = DerivVariable(...
                [1, t], ...
                [0, 1], ...
                [0, 0]);
            normSqVar = DerivMtimes(xTVar, xVar).forward();
            normVar = PowerDeriv(1/2).forward(normSqVar);
            fprintf("[normVar.deriv(0), normVar.deriv(1), normVar.deriv(2)]: \n")
            disp([normVar.deriv(0), normVar.deriv(1), normVar.deriv(2)])
            
            fprintf("2. Analytic result \n")
            z = (1 + t^2)^(1/2);
            z_dot = t/(1 + t^2)^(1/2);
            z_2dot = 1/(1 + t^2)^(3/2);
            fprintf("[deriv(0), deriv(1), deriv(2)]: \n")
            disp([z, z_dot, z_2dot])
        end
    end
end