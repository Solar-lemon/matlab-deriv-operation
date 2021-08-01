classdef(Abstract) FunDeriv < DerivOperation
    % FunDeriv(x) defines function evaluation for derivative values.
    % Given z = f(x), the derivVariable corresponding to z can be obtained
    % by calling FunDeriv().forward(x)
    % deriv(obj, x, n) defines the set of derivatives of f
    % with respect to x.
    methods(Abstract)
        % out = [f; df/dx; d^2f/dx^2; ..., d^nf/dx^n]
        % n: order
        out = deriv(obj, x, N);
    end
    
    methods
        % implement
        function z = forward(obj, var)
            x = var.deriv(0);
            N = var.order;
            derivValues = num2cell(obj.deriv(x, N));
            outerVar = DerivVariable(derivValues{:});
            
            z = DerivComposite(outerVar, var).forward();
        end
    end
end