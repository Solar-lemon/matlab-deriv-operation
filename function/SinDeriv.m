classdef SinDeriv < FunDeriv
    methods
        % implement
        function out = deriv(obj, x, N)
            out = nan(N + 1, 1);
            s = sin(x);
            c = cos(x);
            
            for n = 0:N
                switch mod(n, 4)
                    case 0
                        out(n + 1) = s;
                    case 1
                        out(n + 1) = c;
                    case 2
                        out(n + 1) = -s;
                    case 3
                        out(n + 1) = -c;
                end
            end
        end
    end
end