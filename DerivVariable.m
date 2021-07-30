classdef DerivVariable < handle
    properties
        order
        shape
        derivValues
    end
    methods
        function obj = DerivVariable(varargin)
            % valueList = {x^(0), x^(1), ... x^(order)}
            if numel(varargin) > 0
                obj.order = numel(varargin) - 1;
                obj.shape = size(varargin{1});
                obj.derivValues = varargin;
            end
        end
        
        function out = deriv(obj, order)
            assert(order >= 0,...
                "The order must be greater than or equal to 0.")
            if order > obj.order
                out = zeros(obj.shape);
                return
            end
            out = obj.derivValues{order + 1};
        end
    end
    % set and get methods
    methods
        function setDeriv(obj, order, value)
            assert(order >= 0,...
                "The order must be greater than or equal to 0.")
            if order > obj.order
                return
            end
            obj.derivValues{order + 1} = value;
        end
        
        function setDerivValues(obj, varargin)
            if isempty(obj.order)
                obj.order = numel(varargin) - 1;
                obj.shape = size(varargin{1});
            end
            obj.derivValues = varargin;
        end
    end
    
    methods(Static)
        function test()
            clc
            
            fprintf("== Test for DerivVariable == \n")
            fprintf("t = 1 \n")
            fprintf("x = [t, t^2, t^3] \n")
            t = 1;
            x = [1, t, t^2];
            x_dot = [0, 1, 2*t];
            x_2dot = [0, 0, 2];
            
            variable = DerivVariable();
            variable.setDerivValues(x, x_dot, x_2dot);
            fprintf("variable.deriv(0): \n")
            disp(variable.deriv(0))
            fprintf("variable.deriv(1): \n")
            disp(variable.deriv(1))
            fprintf("variable.deriv(2): \n")
            disp(variable.deriv(2))
            fprintf("variable.deriv(3): \n")
            fprintf("(not defined, the result can be different from the true value) \n")
            disp(variable.deriv(3))
        end
    end
end