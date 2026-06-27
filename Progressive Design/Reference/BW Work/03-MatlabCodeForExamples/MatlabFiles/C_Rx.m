classdef C_Rx
    %UNTITLED4 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        sphere(1,1) double {mustBeInRange(sphere,-12,12)}
        cylinder(1,1) double {mustBeInRange(cylinder,-10,10)}
        axis(1,1) double {mustBeInRange(axis,-180,180)}
        add(1,1)  double {mustBeInRange(add,0,4)}
    end
    
    methods
        function obj = C_Rx(sphere,cylinder,axis,add)
            obj.sphere=0;
            obj.cylinder=0;
            obj.axis=0;
            obj.add=0;
            if nargin >0
            obj.sphere = sphere ;
            end
            if nargin >1
            obj.cylinder = cylinder ;
            end
            if nargin >2
            obj.axis = axis ;
            end
            if nargin >3
            obj.add = add ;
            end
        end
        
        
        function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
    end
end

