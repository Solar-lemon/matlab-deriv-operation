classdef SinDeriv < FunDeriv
    methods
        % implement
        function out = deriv(obj, x, N)
            out = nan(1 + N, 1);
            s = sin(x);
            c = cos(x);
            
            for n = 0:N
                switch mod(n, 4)
                    case 0
                        out(1 + n) = s;
                    case 1
                        out(1 + n) = c;
                    case 2
                        out(1 + n) = -s;
                    case 3
                        out(1 + n) = -c;
                end
            end
        end
    end
end