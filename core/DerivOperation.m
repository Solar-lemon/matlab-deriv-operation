classdef(Abstract) DerivOperation < handle
    properties
        
    end
    methods(Abstract)
        out = forward(obj)
    end
end