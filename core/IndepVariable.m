classdef IndepVariable < DerivVariable
    methods
        function obj = IndepVariable(value, order)
            derivValues = zeros(order + 1, 1);
            derivValues(1) = value;
            if order > 0
                derivValues(2) = 1;
            end
            derivValues = num2cell(derivValues);
            obj = obj@DerivVariable(derivValues{:});
        end
    end
end