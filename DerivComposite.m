classdef DerivComposite < DerivOperation
    properties
        var1
        var2
    end
    methods
        function obj = DerivComposite(var1, var2)
            % var1: DerivVariable
            % var2: DerivVariable
            % var1 is for the outer variable
            % var2 is for the inner variable
            obj.var1 = var1;
            obj.var2 = var2;
        end
        
        function z_n = deriv(obj, n, bellValues)
            % n: order
            % bellValues = [B_(n, 0), B_(n, 1), ..., B_(n, n)];
            if n == 0
                z_n = obj.var1.deriv(0);
            else
                f_bar = obj.var1.flatValue();
                f_bar = f_bar(2:end);
                
                z_n = 0;
                for k = 1:n
                    z_n = z_n + ...
                        f_bar(k)*bellValues(k + 1);
                end
            end
        end
        
        % implement
        function z = forward(obj)
            z = DerivVariable();
            z.order = obj.var1.order;
            
            g_bar = obj.var2.flatValue();
            g_bar = g_bar(2:end);
            bellValuesMatrix = ...
                DerivComposite.partialBellPoly(g_bar, z.order, z.order);
            for k = 0:z.order
                bellValues = bellValuesMatrix(k + 1, :);
                z.setDeriv(k, obj.deriv(k, bellValues));
            end
        end
    end
    
    methods(Static)
        function bellValuesMatrix = partialBellPoly(x, n_in, k_in)
            % bellValuesMatrix = ...
            % [B_(0, 0), ...
            % B_(1, 0), B_(0, 1), ...
            % ...
            % B_(n_in, 0), B_(n_in, 1), ..., B_(n_in, k_in)];
            bellValuesMatrix = zeros(n_in + 1, k_in + 1);
            bellValuesMatrix(1, 1) = 1;
            for n = 1:n_in
                for k = 1:k_in
                    b = 0;
                    for i = 1:n - k + 1
                        b = b + nchoosek(n - 1, i - 1)*x(i)*...
                            bellValuesMatrix((n - i) + 1, (k - 1) + 1);
                    end
                    bellValuesMatrix(n + 1, k + 1) = b;
                end
            end
        end
        
        function test()
            clc
            
            fprintf("x = [1, 2, 3], n = 3, k = 3 \n")
            fprintf("B = DerivComposite.partialBellPoly(x, n, k) \n")
            fprintf("B = \n")
            x = [1, 2, 3];
            n = 3;
            k = 3;
            B = DerivComposite.partialBellPoly(x, n, k);
            disp(B)
        end
    end
end