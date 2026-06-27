                
classdef C_Wavefront
    %UNTITLED5 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties        
        xx
        yy
        rr
        wf_microns
        TangentialPowerXY
        TangentialPowerR
        WF_Deviation_Diopters
        Surface_Power_and_Cyl
        RaytraceMetrics
        Lens_WF_Function;
        Eye                    
        Focus_Position_Diopters=0;
        Transmission_Function=1;
        n_pixels
        wf_pad_factor
        EPD_mm
        wavelength_microns(1,1) double        
        max_arcsec_deviation_PSF
        index
    end
    
    properties (GetAccess = private)
      deltaS_mm
        F
        Fx
        Fy
    end
    
    properties (Dependent)   % do not store data.  used let C_Wavefront.dep_1 to return value tha that ia immediately calculated
        %dep_1
        %dep_2
    end
    
    methods
        function obj = C_Wavefront(Lens_WF_Function,xx,yy,varargin)
            %UNTITLED5 Construct an instance of this class
            %   Detailed explanation goes here
            if nargin >0
                if (xx(2,1)-xx(1,1))==0 
                    disp(' For Wavefront Class xx,yy must be from ndgrid')
                    return
                end
                obj.xx = xx;   % ndgrid format   **** need to test for this
                obj.yy = yy;   % ndgrid
                %obj.wf_microns = fun(xx,yy);
                obj.rr=sqrt(xx.^2+yy.^2);
                obj.Lens_WF_Function=Lens_WF_Function;
                obj.Eye=C_EYE(0,0,.0005501);
               % obj.index=2;
                p=inputParser;
                % Analysis Conditions -----------------------------------------------------------------------------------------------------------
                p.addParameter('Eye', C_EYE );     % default eye has no power or SA allowing calc and analysis of only input wavefront only
                p.addParameter('Focus_Position_Diopters', 0  );  % default defocus is infinity for analysis of input wavefront only
                p.addParameter('Transmission_Function', 1  ); 
                p.addParameter('EPD_mm', 4.01  ); 
                p.addParameter('wavelength_microns', .0005501  ); 
                p.addParameter('index', 2 ); 
                p.parse(varargin{:} );
                for ii=1:length( p.Parameters)
                    obj.(p.Parameters{ii}) = p.Results.(p.Parameters{ii});
                end   
                
                obj.wf_microns = calcWF(obj);            
                obj.n_pixels=length(obj.xx);  % initial pupil sampling
                obj.deltaS_mm=obj.xx(2,1)-obj.xx(1,1);
            end
        end
        
        function obj=updateWavefront(obj)
               obj.wf_microns = calcWF(obj); 
               %obj=Autoscale_Padding_and_Sampling(obj);  %% Not sure I want autoscale here.  Only needed(wanted) for MTF calc
        end
        
        function obj=updateWavefrontMetrics(obj)
               obj=calcTangentialPower(obj);
               obj=calcSurface_Power_and_Cyl(obj);
               obj = calcRaytraceMetrics(obj);
        end
        
        function obj=calcTangentialPower(obj)
           [obj.TangentialPowerXY, obj.TangentialPowerR]  = TangentialPower_from_WF(obj);
        end
        
        function obj=calcSurface_Power_and_Cyl(obj)
            %obj.wf_microns = calcWF(obj);  
            [obj.Surface_Power_and_Cyl] = surfature(obj);
        end
        
        function obj=calcSurface_Power_and_Cyl_at_xy(obj,xx,yy)
            xy=[xx(:) yy(:)];
            % xy=[x y]   xy=[ 0 1];      xy=[0 0 ; 0 10; 0 20]      
             del=.1;
             val2=zeros(size(xy,1),1);
             val3=val2;
             val4=val2;
             for ii=1:size(xy,1)
                [obj.xx,obj.yy]=ndgrid(xy(ii,1)-2*del:del:xy(ii,1)+2*del,xy(ii,2)-2*del:del:xy(ii,2)+2*del  );
                obj.rr=sqrt(obj.xx.^2+obj.yy.^2);
                obj.wf_microns=calcWF(obj);
                val1= surfature(obj);
                val2(ii)=val1.meanPower(3,3);
                val3(ii)=val1.cylinder(3,3);
                val4(ii)=val1.axis(3,3);
             end
             obj.Surface_Power_and_Cyl.meanPower=reshape(val2,[size(xx,1) size(yy,2)]);
             obj.Surface_Power_and_Cyl.cylinder=reshape(val3,[size(xx,1) size(yy,2)]);
             obj.Surface_Power_and_Cyl.axis=reshape(val4,[size(xx,1) size(yy,2)]);
        end
        
         function obj3 = plus(obj1,obj2)
             obj3=C_Wavefront;
             obj3.wf_microns=obj1.wf_microns+obj2.wf_microns;          
         end
        
        function obj = calcRaytraceMetrics(obj)
            obj=GRADIENT(obj);
            % determine sign of mean defocus
            fx = obj.Fx./obj.xx*1000;
            fx(abs(fx)==inf)=0;
            fx(isnan(fx))=0;
            fy = obj.Fy./obj.yy*1000;
            fy(abs(fy)==inf)=0;
            fy(isnan(fy))=0;
            sign_of_defocus=sign( mean( [ mean(mean(fx))  mean(mean(fy))  ]) );          
            %          
            obj.WF_Deviation_Diopters = sign_of_defocus*obj.F./obj.rr*1000;
            obj.WF_Deviation_Diopters(abs(obj.WF_Deviation_Diopters)==inf)=0;
            obj.WF_Deviation_Diopters(isnan(obj.WF_Deviation_Diopters))=0;
            rms=@(M) sqrt(1/numel(M).*sum(M.^2));
            obj.RaytraceMetrics.mean_Diopters=mean(obj.WF_Deviation_Diopters(obj.WF_Deviation_Diopters~=0));
            obj.RaytraceMetrics.rms_Diopters=rms(obj.WF_Deviation_Diopters(obj.WF_Deviation_Diopters~=0));
            obj.RaytraceMetrics.std_Diopters=std(obj.WF_Deviation_Diopters(obj.WF_Deviation_Diopters~=0));
            obj.RaytraceMetrics.max_Diopters=max(max(obj.WF_Deviation_Diopters(obj.WF_Deviation_Diopters~=0)));
            obj.RaytraceMetrics.min_Diopters=min(min(obj.WF_Deviation_Diopters(obj.WF_Deviation_Diopters~=0)));
            obj.RaytraceMetrics.F=sign_of_defocus*obj.F;
            obj.RaytraceMetrics.L=-obj.Fx;
            obj.RaytraceMetrics.M=-obj.Fy;      
            obj.RaytraceMetrics.EPD_mm=obj.EPD_mm;
            obj.RaytraceMetrics.deltaS_mm= obj.deltaS_mm;
            
        end
        
        function obj=GRADIENT(obj)
            [obj.Fx,obj.Fy]=gradient(obj.wf_microns,obj.deltaS_mm*1000,obj.deltaS_mm*1000);
            obj.F=sqrt(obj.Fy.^2+obj.Fx.^2);
            % find centroid
            
            filter1=(obj.rr>(obj.EPD_mm/2-obj.deltaS_mm));%aa.rr<=(aa.EPD_mm/2-aa.deltaS_mm)

            obj.Fx(~filter1)=obj.Fx(~filter1)-mean(mean(obj.Fx(~filter1)));%obj.Fx(centroid(1),centroid(2));
            obj.Fy(~filter1)=obj.Fy(~filter1)-mean(mean(obj.Fy(~filter1)));%obj.Fy(centroid(1),centroid(2));
            obj.F=sqrt(obj.Fy.^2+obj.Fx.^2);

            
            obj.F(filter1)=0;
            obj.Fx(filter1)=0;
            obj.Fy(filter1)=0;         
        end

        
        function obj=Autoscale_Padding_and_Sampling(obj,EPD_mm,wavelength_microns)
            if nargin >1
                obj.EPD_mm=EPD_mm;
                obj.wavelength_microns=wavelength_microns;
            end
            first_DL_PSF_zero_arcsec=1.22*obj.wavelength_microns/(obj.EPD_mm*1000)*180/pi*3600;
            cutoff_cpd=obj.EPD_mm*1000/obj.wavelength_microns*pi/180;
            obj=GRADIENT(obj);
            
            maxF=max(max(abs(obj.F)));
            max_radians_deviation_PSF = atan(maxF);
            obj.max_arcsec_deviation_PSF=max_radians_deviation_PSF*180/pi*3600;
            
            if obj.max_arcsec_deviation_PSF > 5*first_DL_PSF_zero_arcsec   % diffraction doesn't matter
                 obj.wf_pad_factor=1.05;  % increasing pad factor
                n_pixels_in_pupil=5*obj.wf_pad_factor*obj.EPD_mm*max_radians_deviation_PSF*2/obj.wavelength_microns*1000;
            else  % diffraction matters
                obj.wf_pad_factor=5/1.22;
                n_pixels_in_pupil=cutoff_cpd/5;  %
                if n_pixels_in_pupil*obj.wf_pad_factor>2048
                    n_pixels_in_pupil=2048/obj.wf_pad_factor;
                    n_pixels_in_pupil=pow2(nextpow2(1*n_pixels_in_pupil));
                end
            end
            obj.n_pixels=pow2(nextpow2(obj.wf_pad_factor*n_pixels_in_pupil));
            if obj.n_pixels>1048
                obj.n_pixels=1048;
            end 
            
            S_mm=obj.EPD_mm*obj.wf_pad_factor;
            obj.deltaS_mm=S_mm/(obj.n_pixels-3);
            axisPupil_mm=-obj.EPD_mm/2*obj.wf_pad_factor-obj.deltaS_mm:obj.deltaS_mm:obj.EPD_mm/2*obj.wf_pad_factor+obj.deltaS_mm;
                        
            [obj.xx,obj.yy]=ndgrid(axisPupil_mm);
            obj.rr=sqrt(obj.xx.^2+obj.yy.^2);
            obj.wf_microns = calcWF(obj);
            
        end
        
    end
end

%%

function  value=calcWF(obj)
               value = obj.Lens_WF_Function(obj.xx,obj.yy)+ ...
                (0.5*((-obj.Focus_Position_Diopters+obj.Eye.Rx.sphere+obj.Eye.chromatic_shift_Diopters-obj.Eye.focus_adjust_for_SA)/1)*obj.rr.^2+ ...
                0.25*obj.Eye.SA_eye/1*obj.rr.^4).*obj.Transmission_Function;  % in mm     
end

%%
function [value] = surfature( obj)
% SURFATURE -  COMPUTE GAUSSIAN AND MEAN CURVATURES OF A SURFACE
%   [K,H] = SURFATURE(X,Y,Z), WHERE X,Y,Z ARE 2D ARRAYS OF POINTS ON THE
%   SURFACE.  K AND H ARE THE GAUSSIAN AND MEAN CURVATURES, RESPECTIVELY.
%   SURFATURE RETURNS 2 ADDITIONAL ARGUEMENTS,
%   [K,H,Pmax,Pmin] = SURFATURE(...), WHERE Pmax AND Pmin ARE THE MINIMUM
%   AND MAXIMUM CURVATURES AT EACH POINT, RESPECTIVELY.
%
% oct 14, 2020 cbw comments 
% downloaded from:  Daniel Claxton (2020). Surface Curvature (https://www.mathworks.com/matlabcentral/fileexchange/11168-surface-curvature), MATLAB Central File Exchange. Retrieved October 13, 2020.
% this looks like Appendix C from Modern Ophthalmic Optics 2019 Jose Alonso
% First Derivatives

[Xu,Xv] = gradient(obj.xx'); %delta_x 0
[Yu,Yv] = gradient(obj.yy'); % 0  delta_y
[Zu,Zv] = gradient(obj.wf_microns'/1000);
% Second Derivatives
[Xuu,~] = gradient(Xu);  %0
[Yuu,~] = gradient(Yu);  %0
[Zuu,~] = gradient(Zu);
[Xuv,Xvv] = gradient(Xv); % 0 0 
[Yuv,Yvv] = gradient(Yv); % 0 0
[Zuv,Zvv] = gradient(Zv);
% Reshape 2D Arrays into Vectors
Xu = Xu(:);   Yu = Yu(:);   Zu = Zu(:); 
Xv = Xv(:);   Yv = Yv(:);   Zv = Zv(:); 
Xuu = Xuu(:); Yuu = Yuu(:); Zuu = Zuu(:); 
Xuv = Xuv(:); Yuv = Yuv(:); Zuv = Zuv(:); 
Xvv = Xvv(:); Yvv = Yvv(:); Zvv = Zvv(:); 
Xu          =   [Xu Yu Zu]; %10 0 Zu
Xv          =   [Xv Yv Zv]; % 0 10 Zv
Xuu         =   [Xuu Yuu Zuu]; % 0 0 Zuu
Xuv         =   [Xuv Yuv Zuv]; % 0 0 Zuv
Xvv         =   [Xvv Yvv Zvv]; % 0 0 Zvv
% First fundamental Coeffecients of the surface (E,F,G)
E           =   dot(Xu,Xu,2);
F           =   dot(Xu,Xv,2);
G           =   dot(Xv,Xv,2);
m           =   cross(Xu,Xv,2);
p           =   sqrt(dot(m,m,2));
n           =   m./[p p p]; 
% Second fundamental Coeffecients of the surface (L,M,N)
L           =   dot(Xuu,n,2);  %e
M           =   dot(Xuv,n,2);  %f
N           =   dot(Xvv,n,2);  %g
[s,t] = size(obj.wf_microns);
% Gaussian Curvature    Pmax*Pmin=K
K = (L.*N - M.^2)./(E.*G - F.^2);
K = reshape(K,s,t);
% Mean Curvature
H = (E.*N + G.*L - 2.*F.*M)./(2*(E.*G - F.^2));
H = reshape(H,s,t);
% Principal Curvatures
Pmax = H + sqrt(H.^2 - K);
Pmin = H - sqrt(H.^2 - K);
% Cylinder (CBW 10/13/2020)
C=Pmax-Pmin;
e=L;
f=M;
g=N;
theta=2*f.*sqrt(e.*f)./(e.*g-E.*G)*180/pi;
theta=reshape(abs(theta),s,t);

% directionCosines.L=reshape(n(:,1),s,t);   
% directionCosines.M=reshape(n(:,2),s,t);
% directionCosines.N=reshape(n(:,3),s,t);

value.meanPower=real(H'*1000*(obj.index-1));
value.cylinder=real(C'*1000*(obj.index-1));
value.axis=theta;

end

function [value] = surfature_original( obj)
% SURFATURE -  COMPUTE GAUSSIAN AND MEAN CURVATURES OF A SURFACE
%   [K,H] = SURFATURE(X,Y,Z), WHERE X,Y,Z ARE 2D ARRAYS OF POINTS ON THE
%   SURFACE.  K AND H ARE THE GAUSSIAN AND MEAN CURVATURES, RESPECTIVELY.
%   SURFATURE RETURNS 2 ADDITIONAL ARGUEMENTS,
%   [K,H,Pmax,Pmin] = SURFATURE(...), WHERE Pmax AND Pmin ARE THE MINIMUM
%   AND MAXIMUM CURVATURES AT EACH POINT, RESPECTIVELY.
%
% oct 14, 2020 cbw comments 
% downloaded from:  Daniel Claxton (2020). Surface Curvature (https://www.mathworks.com/matlabcentral/fileexchange/11168-surface-curvature), MATLAB Central File Exchange. Retrieved October 13, 2020.
% this looks like Appendix C from Modern Ophthalmic Optics 2019 Jose Alonso
% First Derivatives

[Xu,Xv] = gradient(obj.xx');
[Yu,Yv] = gradient(obj.yy');
[Zu,Zv] = gradient(obj.wf_microns'/1000);
% Second Derivatives
[Xuu,~] = gradient(Xu);
[Yuu,~] = gradient(Yu);
[Zuu,~] = gradient(Zu);
[Xuv,Xvv] = gradient(Xv);
[Yuv,Yvv] = gradient(Yv);
[Zuv,Zvv] = gradient(Zv);
% Reshape 2D Arrays into Vectors
Xu = Xu(:);   Yu = Yu(:);   Zu = Zu(:); 
Xv = Xv(:);   Yv = Yv(:);   Zv = Zv(:); 
Xuu = Xuu(:); Yuu = Yuu(:); Zuu = Zuu(:); 
Xuv = Xuv(:); Yuv = Yuv(:); Zuv = Zuv(:); 
Xvv = Xvv(:); Yvv = Yvv(:); Zvv = Zvv(:); 
Xu          =   [Xu Yu Zu];
Xv          =   [Xv Yv Zv];
Xuu         =   [Xuu Yuu Zuu];
Xuv         =   [Xuv Yuv Zuv];
Xvv         =   [Xvv Yvv Zvv];
% First fundamental Coeffecients of the surface (E,F,G)
E           =   dot(Xu,Xu,2);
F           =   dot(Xu,Xv,2);
G           =   dot(Xv,Xv,2);
m           =   cross(Xu,Xv,2);
p           =   sqrt(dot(m,m,2));
n           =   m./[p p p]; 
% Second fundamental Coeffecients of the surface (L,M,N)
L           =   dot(Xuu,n,2);  %e
M           =   dot(Xuv,n,2);  %f
N           =   dot(Xvv,n,2);  %g
[s,t] = size(obj.wf_microns);
% Gaussian Curvature    Pmax*Pmin=K
K = (L.*N - M.^2)./(E.*G - F.^2);
K = reshape(K,s,t);
% Mean Curvature
H = (E.*N + G.*L - 2.*F.*M)./(2*(E.*G - F.^2));
H = reshape(H,s,t);
% Principal Curvatures
Pmax = H + sqrt(H.^2 - K);
Pmin = H - sqrt(H.^2 - K);
% Cylinder (CBW 10/13/2020)
C=Pmax-Pmin;
e=L;
f=M;
g=N;
theta=2*f.*sqrt(e.*f)./(e.*g-E.*G)*180/pi;
theta=reshape(abs(theta),s,t);

% directionCosines.L=reshape(n(:,1),s,t);   
% directionCosines.M=reshape(n(:,2),s,t);
% directionCosines.N=reshape(n(:,3),s,t);

value.meanPower=real(H'*1000*(obj.index-1));
value.cylinder=real(C'*1000*(obj.index-1));
value.axis=theta;

end


%%
function [Tangential_Power,power_1] = TangentialPower_from_WF(WF)
%BW_TangentialPower_from_WF 1 and 2D power tangential power profile from
%wavefront
%   WF.xx mm
%   WF.yy mm
%   WF.zz microns
%
% output is in Diopers
%   power_1.r
%   power_1.power  % this is radial average power
%   power_2.xx
%   power_2.yy
%   power_2.Tangential_Power

% CBW oct 23, 2020

    EPD=max(max(WF.xx))*2;
    delta_r=WF.xx(2,1)-WF.xx(1,1);
    center_radius_to_ignore = delta_r*3;
    r=delta_r:delta_r:EPD/2*sqrt(2)+2*delta_r;
    F=griddedInterpolant(WF.xx,WF.yy,WF.wf_microns,'spline','nearest');  % ' because requires NDGRID not meshgrid
    theta=0:2*pi/200:2*pi;

    x_on_polar_grid=zeros(length(r),length(theta));
    y_on_polar_grid=x_on_polar_grid;
    z_on_polar_grid=x_on_polar_grid;
    power_1.r=r;
    power_1.power=r*0;
    for i_theta=1:length(theta)
        [xx1,yy1]=meshgrid(r,theta(i_theta));
        [xx,yy]=pol2cart(yy1,xx1);
        Pr=gradient(F(xx',yy')',delta_r);
        Pr=Pr(~isnan(Pr));
        Pr(end-1)=Pr(end-2);
        Pr(end)=Pr(end-1);
        if 0
            Pr = Pr./(sqrt(1+Pr.^2))./r*(WF.index-1);  % this is exact.
        else
            Pr = Pr./r*(WF.index-1);   % this is low power approximation.
        end
        power_1.power=power_1.power(1:min(length(Pr),length(power_1.power)));
        power_1.power=power_1.power+Pr(1:min(length(Pr),length(power_1.power)));
        [xx1,yy1]=ndgrid(r,theta(i_theta));    % already ndgrid
        [xx,yy]=pol2cart(yy1,xx1);
        x_on_polar_grid(:,i_theta)= xx;
        y_on_polar_grid(:,i_theta)= yy;
        z_on_polar_grid(:,i_theta)= Pr;
    end
    filter1=sqrt(x_on_polar_grid.^2+y_on_polar_grid.^2)>center_radius_to_ignore;
    x_on_polar_grid=x_on_polar_grid(filter1);
    y_on_polar_grid=y_on_polar_grid(filter1);
    z_on_polar_grid=z_on_polar_grid(filter1);

    F=scatteredInterpolant(x_on_polar_grid(:),y_on_polar_grid(:),z_on_polar_grid(:),'natural');
    %power_2.xx=WF.xx;
    %power_2.yy=WF.yy;
    Tangential_Power=F(WF.xx,WF.yy);
    Tangential_Power(isnan(WF.wf_microns))=0;
    filter1=WF.xx.^2+WF.yy.^2>=(EPD/2)^2;
    Tangential_Power(filter1)=mean(mean(Tangential_Power(~filter1)));

    power_1.power=power_1.power/length(theta);
    power_1.r=power_1.r(1:length(power_1.power));
    power_1.r=power_1.r(power_1.r<=EPD/2);
    power_1.r=power_1.r(1:end-1);
    power_1.power=power_1.power(power_1.r<=EPD/2);
    r=0:delta_r:EPD/2;
    power_1.power=interp1(power_1.r(power_1.r>center_radius_to_ignore),power_1.power(power_1.r>center_radius_to_ignore),r,'pchip','extrap');
    power_1.r=r;


end