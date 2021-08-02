classdef IndepVariable < DerivVariable
    methods
        function obj = IndepVariable(value, order)
            values = zeros(1 + order, 1);
            values(1) = value;
            if order > 0
                values(2) = 1;
            end
            values = num2cell(values);
            obj = obj@DerivVariable(values{:});
        end
    end
end