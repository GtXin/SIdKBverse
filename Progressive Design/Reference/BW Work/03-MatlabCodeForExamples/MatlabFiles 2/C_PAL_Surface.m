classdef C_PAL_Surface
    %UNTITLED6 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Rx
        %index
        Optimization_Control
        Blank_Diameter
        Optimization_Diameter
        y
        xx
        yy
        %SAG_Function_GRID
               
        Surface_Description
        PCA
    end
    properties (Dependent)
        SAG_Function
    end
    
    
    methods
        function obj = C_PAL_Surface(varargin)
            p=inputParser;
            p.addParameter('Rx', C_Rx(0,0,0,2 ));
            %p.addParameter('index',1.592 );
            p.addParameter('Optimization_Control',[] );
            p.addParameter('Blank_Diameter',70 );
             p.addParameter('Optimization_Diameter',80 );
            p.parse(varargin{:} );
            for ii=1:length( p.Parameters)
                obj.(p.Parameters{ii}) = p.Results.(p.Parameters{ii});
            end
        end
        function dispXXX(obj)
            disp(['     FrontSurface.Rx.sphere = ' num2str(obj.Rx.sphere) ';']);
            disp(['     FrontSurface.Rx.add = ' num2str(obj.Rx.add) ';']);
            disp(['     FrontSurface.Rx.Optimization_Diameter = ' num2str(obj.Optimization_Diameter) ';']);           
            a=fieldnames(obj.Surface_Description);
            for ii=1:length(a)
                b=obj.Surface_Description.(a{ii}) ;
                if isa(b,'griddedInterpolant')
                    
                elseif isa(b,'function_handle')                        
                    if length(b) ==1
                        disp(['     FrontSurface.Surface_Description.' a{ii} ' = ' num2str(b) ';']);
                    else
                        for iii=1:size(b,1)
                            disp(['     FrontSurface.Surface_Description.' a{ii} '(' num2str(iii) ',:) = [' num2str(b(iii,:)) '];']);
                        end
                    end                   
                elseif ischar(b)
                    disp(['     FrontSurface.Surface_Description.' a{ii} ' = ' num2str(b) ';']);         
                else
                     disp(['     ' a{ii} '=' ]);
                     for ib=1:length(b)
                         c=b(ib);
                         if isnumeric(b)
                             disp(['          ' num2str(c)]) 
                         else
                              disp(['          ' c{1}])
                         end
                     end
                end
                
            end 
        end
        
         function  val=get.SAG_Function(obj)
           %   obj.SAG_Function=str2func(['@(x,y) ' obj.Surface.SAG_Function '(obj.FrontSurface,x,y)']);
           val=0;
%            if isa(obj.Surface_Description.SAG_Function,'griddedInterpolant')
%              %a=['val=@(x,y) ' obj.Surface_Description.SAG_Function '(x,y);'];
%              val=obj.Surface_Description.SAG_Function;           
%              %a=['val=@(x,y) F(x,y);'];
%            else
             a=['val=@(x,y) ' obj.Surface_Description.SAG_Function_Name '(obj.Surface_Description,x,y);'];
             eval(a)
           %end
%          disp(val)
         end
        
        function F3 = M_SAG_Estimate_from_Power_Target(obj)
            % calcuate sag from power target along each meridian -180:180
            % this ignores cyl targets, so just gives first pass estimate for
            % surface
            theta=-180:10:180;
            r=0:2:(obj.Optimization_Diameter/2*sqrt(2));
            [tt,rr]=ndgrid(theta,r);
            [x1,y1]=pol2cart(tt*pi/180,rr);
            Power=obj.Optimization_Control.MeritFunctionTargets.F_Power(x1,y1);
            F2=griddedInterpolant(tt,rr,Power,'spline');
            for i_theta=1:length(theta)
                power_function_handle=@(r) 2*(F2(theta(i_theta)+0*r,r)-F2(0,0))+F2(theta(i_theta)+0*r,r);
                [sag(i_theta,:)] = BW_Wavefront_from_Power_1axis_from_function(power_function_handle,r)/(obj.index-1);             
            end
            F2.Values=sag;
            [tt,rr]=cart2pol(obj.xx,obj.yy);
            F3=griddedInterpolant(obj.xx,obj.yy,F2(tt*180/pi,rr)*1000*1000,'spline');
        end
        % %             function
        % %
        % %             end
        function obj=M_PCA(obj)
            %SAG_Function=obj.SAG_Function_GRID;
            %[xx1,yy1]=ndgrid(obj.SAG_Function_GRID.GridVectors{1},obj.SAG_Function_GRID.GridVectors{2});
            Focus_Position_Diopters=-.0;
            a=C_Wavefront(obj.SAG_Function,obj.xx,obj.yy,'Eye',C_EYE(0,0.0),'Focus_Position_Diopters',Focus_Position_Diopters,'EPD_mm',obj.Optimization_Diameter,'index',obj.Surface_Description.index);
               a=calcSurface_Power_and_Cyl(a);
           % a=calcSurface_Power_and_Cyl_at_xy(a,obj.xx ,obj.yy); % this
           % calcs with smaller derivative increment, but is MUCH slower
            obj.PCA.p=a.Surface_Power_and_Cyl.meanPower;
            obj.PCA.c=a.Surface_Power_and_Cyl.cylinder;
            obj.PCA.a=a.Surface_Power_and_Cyl.axis;    
            obj.PCA.WF=a;
            %val=obj.PCA;
        end
    end
end

