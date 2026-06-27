classdef C_EYE   %<matlab.mixin.SetGet &handle
    %UNTITLED3 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties        
        Rx(1,1) C_Rx;
        SA_eye(1,1) double
        wavelength_microns(1,1) double
        
    end
    properties (Dependent)
      chromatic_shift_Diopters
      focus_adjust_for_SA  
    end
    
     events
%         event1_calculates_chromatic_shift_when_wavelength_changes
     end
     
    methods
        function obj = C_EYE(Rx,SA_eye,wavelength_microns)
            obj.Rx = C_Rx;
            obj.SA_eye=0.;   % D/mm^2
            obj.wavelength_microns=.550;
           
            if nargin>0
             obj.Rx = Rx;
            end
            if nargin>1
             obj.SA_eye = SA_eye;
             if nargin >2
                 obj.wavelength_microns=wavelength_microns; 
             end
            end
        end

         function val=get.chromatic_shift_Diopters(obj)
             val=LCA(obj);
         end            

         function val=get.focus_adjust_for_SA(obj)
             epd_of_eye_during_refraction=4;
             val=0.5*obj.SA_eye*(epd_of_eye_during_refraction/2)^2;
         end
    end
end


 
 
 
        function deltaSphere=LCA(obj)
                p=1.68524;     % chromatic model from Tibos, The chromatic eye; a new reduced-eye model of ocular chromatic aberration in humans Applied Optics 1992
                q=0.63346;
                c=0.2141;
                deltaSphere=p-q/(obj.wavelength_microns+.04-c);  % this is shift from 0.55 microns               
        end
