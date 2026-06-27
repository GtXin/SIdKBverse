classdef C_PAL_Coordinates
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        surface_center='FP'
        chirality= 'right'
        panascopic_tilt=9;
        lens_to_eye_center= 27
        DRP_x=0;
        DRP_y=4;
        FP_x=0;
        FP_y=0
        NRP_x=0
        NRP_y=-20
        PRP_x=0
        PRP_y=0
        channel_angle=0
        Narrowest_y
        Mid_y
    end
    
    methods
        function obj = C_PAL_Coordinates(varargin)
            p=inputParser;
            for ii=1:length( p.Parameters)
                obj.(p.Parameters{ii}) = p.Results.(p.Parameters{ii});
            end
        end
        
        function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
    end
end

