classdef CosDeriv < FunDeriv
    methods
        % implement
        function out = deriv(obj, x, N)
            out = nan(N + 1, 1);
            s = sin(x);
            c = cos(x);
            
            for n = 0:N
                switch mod(n, 4)
                    case 0
                        out(n + 1) = c;
                    case 1
                        out(n + 1) = -s;
                    case 2
                        out(n + 1) = -c;
                    case 3
                        out(n + 1) = s;
                end
            end
        end
    end
end