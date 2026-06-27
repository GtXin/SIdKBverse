function [PAL] = BW_PAL_Targets_03(PAL)
%function BW_PAL_Targets_03
 

%     PAL.Optimization_Control.channel_width=5;
%     PAL.Optimization_Control.wt_distance=1;
%     PAL.Optimization_Control.wt_near=0;
%     PAL.Optimization_Control.wt_channel=100;
%     PAL.Optimization_Control.wt_periphery=0;
    
%     PAL.Optimization_Control.plot_targets=0;
%     PAL.Optimization_Control.channel_width_cyl=3;
%     PAL.Optimization_Control.wt_distance_cyl=0;
%     PAL.Optimization_Control.wt_channel_cyl=0;
%     PAL.Optimization_Control.wt_periphery_cyl=0;    
%     PAL.Optimization_Control.wt_gradientPower=0;
%     PAL.Optimization_Control.wt_gradientCyl=0;   
 
if 0
    PAL.Front_Base_Power=5.75;
    [PAL.xx,PAL.yy]=ndgrid(-40:1:40);
    PAL.delta_y=1;
    PAL.Optimization_Diameter=75;
    PAL.Blank_Diameter=70;
end 
 
 
 
 %PAL.Optimization_Control.Rx.sphere=0;     


if 0
    PAL.Optimization_Control.Rx.sphere= PAL.Front_Base_Power    ;
    PAL.Optimization_Control.TargetParameters.do_diagonostic_plots=1;    
    % distance power profile parameters
    sphere= PAL.Optimization_Control.Rx.sphere;     
    PAL.Optimization_Control.TargetParameters.distance_Ptheta1=10;  % horizonal is 0/180, +10 will define "V" shape with each side 10Degeees above horizontal
    PAL.Optimization_Control.TargetParameters.distance_y0=4;
    PAL.Optimization_Control.TargetParameters.asphericity=1; %Diopters at r=50mm

   
    % near power profile parameters
    PAL.Optimization_Control.TargetParameters.rotate_lens_theta=.10; %atan(nrpx/nrpy)
    PAL.Optimization_Control.TargetParameters.near_zone_theta_width=1;  % >0
    PAL.Optimization_Control.TargetParameters.near_zone_edge_fraction=1;  % at near_zone_theta_width.  this defines dropoff from meridian in near zone uo to near_zone_theta_width
    PAL.Optimization_Control.TargetParameters.channel_description.add=2    ;
    PAL.Optimization_Control.TargetParameters.channel_description.add_profile_shape_factor=0;  % 0-40
    PAL.Optimization_Control.TargetParameters.channel_description.mid_point_fraction=.5    ;
    PAL.Optimization_Control.TargetParameters.channel_description.y0=4    ;
    PAL.Optimization_Control.TargetParameters.channel_description.NRP_y=-21   ;
    PAL.Optimization_Control.TargetParameters.channel_description.off_edge_y=-100    ;
    PAL.Optimization_Control.TargetParameters.distance_radius_1=10;
    PAL.Optimization_Control.TargetParameters.distance_radius_2=75;

    PAL.Optimization_Control.TargetParameters.peripheral_shape_factor=5;  % larger value narrows near power width  0-30
    PAL.Optimization_Control.TargetParameters.peripheral_mid_fraction=.5;  % smaller value narrows near power width


    % distance weight 
    PAL.Optimization_Control.TargetParameters.POW_distance_theta=PAL.Optimization_Control.TargetParameters.distance_Ptheta1;
    PAL.Optimization_Control.TargetParameters.POW_Near_edge_alpha=.003;
    PAL.Optimization_Control.TargetParameters.POW_Near_delta_x=  PAL.Optimization_Control.TargetParameters.distance_radius_1;
    PAL.Optimization_Control.TargetParameters.wt_POWER_Distance=100;
    PAL.Optimization_Control.TargetParameters.wt_POWER_Distance_outer=95;%20;
    PAL.Optimization_Control.TargetParameters.wt_pow_channel=95;
    PAL.Optimization_Control.TargetParameters.wt_pow_periphery=50;

    % CYL constraints
    PAL.Optimization_Control.TargetParameters.CYL_radius_0=0;
    PAL.Optimization_Control.TargetParameters.CYL_radius_distance=20;
    PAL.Optimization_Control.TargetParameters.CYL_distance_theta=PAL.Optimization_Control.TargetParameters.distance_Ptheta1;     % 
    PAL.Optimization_Control.TargetParameters.CYL_Value_distance=0.1;
    PAL.Optimization_Control.TargetParameters.CYL_WT_distance=100;
    
    PAL.Optimization_Control.TargetParameters.CYL_radius_distance_outer=PAL.Blank_Diameter;
    PAL.Optimization_Control.TargetParameters.CYL_Value_distance_periphery=.5;
    PAL.Optimization_Control.TargetParameters.CYL_WT_distance_periphery=20;
    
    PAL.Optimization_Control.TargetParameters.CYL_Value_max_near_periphery=1.5;
    PAL.Optimization_Control.TargetParameters.CYL_WT_max_near_periphery=.1;
    
    PAL.Optimization_Control.TargetParameters.CYL_Value_near_meridian=.125;
    PAL.Optimization_Control.TargetParameters.CYL_WT_near_meridian=96;

    PAL.Optimization_Control.TargetParameters.CYL_Near_edge_alpha=.005;
    PAL.Optimization_Control.TargetParameters.CYL_Near_delta_x=2; 
    
    PAL.Optimization_Control.wt_cyl_relative_to_power=.1;
    
end

    do_diagonostic_plots=PAL.Optimization_Control.TargetParameters.do_diagonostic_plots;    
    % distance power profile parameters
    sphere= PAL.Optimization_Control.Rx.sphere;     
    distance_Ptheta1=PAL.Optimization_Control.TargetParameters.distance_Ptheta1;  % horizonal is 0/180, +10 will define "V" shape with each side 10Degeees above horizontal
    distance_y0=4;
    asphericity=PAL.Optimization_Control.TargetParameters.asphericity; %Diopters at r=50mm

   
    % near power profile parameters
    rotate_lens_theta=PAL.Optimization_Control.TargetParameters.rotate_lens_theta; %atan(nrpx/nrpy)
    near_zone_theta_width=PAL.Optimization_Control.TargetParameters.near_zone_theta_width;  % >0
    near_zone_edge_fraction=PAL.Optimization_Control.TargetParameters.near_zone_edge_fraction;  % at near_zone_theta_width.  this defines dropoff from meridian in near zone uo to near_zone_theta_width
    channel_description.add=PAL.Optimization_Control.TargetParameters.channel_description.add   ;
    channel_description.add_profile_shape_factor=PAL.Optimization_Control.TargetParameters.channel_description.add_profile_shape_factor;  % 0-40
    channel_description.mid_point_fraction=PAL.Optimization_Control.TargetParameters.channel_description.mid_point_fraction    ;
    channel_description.y0=distance_y0    ;
    channel_description.NRP_y=PAL.Optimization_Control.TargetParameters.channel_description.NRP_y  ;
    channel_description.off_edge_y=PAL.Optimization_Control.TargetParameters.channel_description.off_edge_y    ;
    distance_radius_1=PAL.Optimization_Control.TargetParameters.distance_radius_1;
    distance_radius_2=PAL.Optimization_Control.TargetParameters.distance_radius_2;

    peripheral_shape_factor=PAL.Optimization_Control.TargetParameters.peripheral_shape_factor;  % larger value narrows near power width  0-30
    peripheral_mid_fraction=PAL.Optimization_Control.TargetParameters.peripheral_mid_fraction;  % smaller value narrows near power width


    % distance weight 
    POW_distance_theta=PAL.Optimization_Control.TargetParameters.distance_Ptheta1;
    POW_Near_edge_alpha=PAL.Optimization_Control.TargetParameters.POW_Near_edge_alpha;
    POW_Near_delta_x=distance_radius_1;
    wt_POWER_Distance=PAL.Optimization_Control.TargetParameters.wt_POWER_Distance;
    wt_POWER_Distance_outer=PAL.Optimization_Control.TargetParameters.wt_POWER_Distance_outer;%20;
    wt_pow_channel=PAL.Optimization_Control.TargetParameters.wt_pow_channel;
    wt_pow_periphery=PAL.Optimization_Control.TargetParameters.wt_pow_periphery;

    % CYL constraints
    CYL_radius_0= PAL.Optimization_Control.TargetParameters.CYL_radius_0;
    CYL_radius_distance= PAL.Optimization_Control.TargetParameters.CYL_radius_distance;
    CYL_distance_theta= PAL.Optimization_Control.TargetParameters.CYL_distance_theta;     % 
    CYL_Value_distance= PAL.Optimization_Control.TargetParameters.CYL_Value_distance;
    CYL_WT_distance= PAL.Optimization_Control.TargetParameters.CYL_WT_distance;
    
    CYL_radius_distance_outer= PAL.Optimization_Control.TargetParameters.CYL_radius_distance_outer;
    CYL_radius_near_outer= PAL.Optimization_Control.TargetParameters.CYL_radius_near_outer;
    CYL_Value_distance_periphery= PAL.Optimization_Control.TargetParameters.CYL_Value_distance_periphery;
    CYL_WT_distance_periphery= PAL.Optimization_Control.TargetParameters.CYL_WT_distance_periphery;
    
    CYL_Value_max_near_periphery= PAL.Optimization_Control.TargetParameters.CYL_Value_max_near_periphery;
    CYL_WT_max_near_periphery= PAL.Optimization_Control.TargetParameters.CYL_WT_max_near_periphery;
    
    CYL_Value_near_meridian= PAL.Optimization_Control.TargetParameters.CYL_Value_near_meridian;
    CYL_WT_near_meridian= PAL.Optimization_Control.TargetParameters.CYL_WT_near_meridian;

    CYL_Near_edge_alpha= PAL.Optimization_Control.TargetParameters.CYL_Near_edge_alpha;
    CYL_Near_delta_x= PAL.Optimization_Control.TargetParameters.CYL_Near_delta_x;    
    

    
    r1=@(x,y) sqrt(x.^2+(y).^2);
    theta0=@(x,y) (atan2(y,x)*180/pi);
    fxy_distance_asphericity=@(x,y) sphere+asphericity*(r1(x,y-distance_y0)/50).^2 ;    
    
    y=-40:.1:40;
    [p]=BW_Meridian_Profile_2(y, channel_description.add,...
        channel_description.add_profile_shape_factor,...
        channel_description.mid_point_fraction,...
        channel_description.y0,...
        channel_description.NRP_y,...
        channel_description.off_edge_y);
    p_meridian=griddedInterpolant(y,p+sphere,'spline');
    if do_diagonostic_plots
        figure(399);plot(-40:distance_y0,p_meridian(-40:distance_y0))
        xlabel('y')
        ylabel('power')
        title('Meridianal Power')
        hold on
    end


    [xx,yy]=ndgrid(y);
    n=length(xx);
    power_xy=zeros(n);
    power_wt=zeros(n);

%% -----------------------------------------------------------------------------------------------------------------------------------------------------
% define N power target zones
%%
    % zone 1
        % define area filter
        i_Zone=1;
        y0=distance_y0;
        theta_start=distance_Ptheta1;       
        theta_end=180-distance_Ptheta1;
        F_maxX=@(y) 10000;%(y-y0)/tan(distance_Ctheta1*pi/180);
        F_minX=@(y) -10000;% -(y-y0)/tan(distance_Ctheta1*pi/180);
        fxy=@(x,y) sphere;
        wxy=@(x,y) wt_POWER_Distance;
        rmin=0;
        rmax=distance_radius_1;
        rotate_theta=0;
        [filter_ZonePower{i_Zone},power_xy,power_wt]=bw_zone_01(theta_start,theta_end,rotate_theta,F_maxX,F_minX,rmin,rmax,y0,fxy,wxy,xx,yy,power_xy,power_wt);
%%             
    %Zone 2
        i_Zone=2;
        rmin=distance_radius_1;
        rmax=distance_radius_2;
        wxy=@(x,y) wt_POWER_Distance_outer;
        
        
        fxy=@(x,y) fxy_distance_asphericity(x,y);
        [filter_ZonePower{i_Zone},power_xy,power_wt]=bw_zone_01(theta_start,theta_end,rotate_theta,F_maxX,F_minX,rmin,rmax,y0,fxy,wxy,xx,yy,power_xy,power_wt);
          
%%
    %Zone 3
        i_Zone=3;
%         theta_start=-90+rotate_lens_theta-near_zone_theta_width;
%         theta_end=-90+rotate_lens_theta;

        theta_start=-90+rotate_lens_theta-near_zone_theta_width;
        theta_end=-90+rotate_lens_theta+near_zone_theta_width;
        %m=-2/(theta_start-theta_end);
        %b=1;%-m*theta_end;
%         r1=@(x,y) sqrt(x.^2+y.^2);
        theta1=@(x,y) (atan2(y,x)*180/pi)-(-90+rotate_lens_theta);
        %fraction=@(x,y) (m*abs(theta1(x,y))+b);
        
        fraction=@(x,y) 1-BW_Meridian_Profile_2(theta1(x,y),1,0,.5,-near_zone_theta_width,0,near_zone_theta_width);

        %p_start=@(x,y) p_meridian(-r1(x,y))*near_zone_edge_fraction;
        p_start=@(x,y) p_meridian(y)*near_zone_edge_fraction;
        %p_end=@(x,y) p_meridian(-r1(x,y));
        p_end=@(x,y) p_meridian(y);
        
        fxy=@(x,y) p_start(x,y).*(fraction(x,y))+p_end(x,y).*(1-fraction(x,y));

        F_maxX=@(y) 10000;% (y-y0)/tan(theta_start*pi/180);
        F_minX=@(y) -10000;%-(y-y0)/tan(theta_end*pi/180);       
        rmin=0;
        rmax=100;

        wxy=@(x,y) 0;
        [~,power_xy,~]=bw_zone_01(theta_start,theta_end,rotate_theta,F_maxX,F_minX,rmin,rmax,y0,fxy,wxy,xx,yy,power_xy,power_wt);

         % define weights
        theta_start=-180-POW_distance_theta;%    -90+rotate_lens_theta-distance_Ctheta4;
        theta_end=POW_distance_theta;%    -90+rotate_lens_theta+distance_Ctheta4;       
        F_maxX=@(y) POW_Near_edge_alpha*y.^2+POW_Near_delta_x;
        F_minX=@(y) -POW_Near_edge_alpha*y.^2-POW_Near_delta_x;
        y0=distance_y0;

        rmin=0;
        rmax=100;
        rotate_theta=rotate_lens_theta;
        fxy=@(x,y) 0;
        wxy=@(x,y) wt_pow_channel; 
 
        [filter_ZonePower{i_Zone},~,power_wt]=bw_zone_01(theta_start,theta_end,rotate_theta,F_maxX,F_minX,rmin,rmax,y0,fxy,wxy,xx,yy,power_xy,power_wt);

%%                    
     %Zone 4
         i_Zone=4;
         theta_start=-180-distance_Ptheta1;
         theta_end=-90+rotate_lens_theta-near_zone_theta_width;
         m=1/(theta_start-theta_end);
         b=-m*theta_end;
%          r1=@(x,y) sqrt(x.^2+y.^2);
%          theta0=@(x,y) (atan2(y,x)*180/pi);
         theta1=@(x,y) (theta0(x,y)>90)*-360+theta0(x,y);
         
         fraction=@(x,y) 1-BW_Meridian_Profile_2(theta1(x,y-y0),1,peripheral_shape_factor,peripheral_mid_fraction,theta_start,theta_end,10000);
         
         if do_diagonostic_plots
             figure(40);hold on
             yyy=theta_start:theta_end;
             plot(yyy,1-BW_Meridian_Profile_2(yyy,1,peripheral_shape_factor,peripheral_mid_fraction,theta_start,theta_end,10000))
             xlabel('theta')
             ylabel('fraction')
             title('Smoothing Fraction from Distance to Near in lower periphery')
         end
         
       %  fraction=@(x,y) (m*(theta1(x,y))+b).^(smooth_power);
%          p_meridian=griddedInterpolant(y,p,'spline');
         p_end=@(x,y) p_meridian(-r1(x,y))*near_zone_edge_fraction.^1;
           p_end=@(x,y) p_meridian(y)*near_zone_edge_fraction.^1;
         p_start=@(x,y) fxy_distance_asphericity(x,y);
         fxy=@(x,y) p_start(x,y).*(fraction(x,y))+p_end(x,y).*(1-fraction(x,y));

         F_maxX=@(y) 10000;% (y-y0)/tan(theta_start*pi/180);
         F_minX=@(y) -10000;%-(y-y0)/tan(theta_end*pi/180);

         rmin=0;
         rmax=100;
         wxy=@(x,y) 0;
         [~,power_xy,~]=bw_zone_01(theta_start,theta_end,rotate_theta,F_maxX,F_minX,rmin,rmax,y0,fxy,wxy,xx,yy,power_xy,power_wt);   
    
        theta_start=-90+rotate_lens_theta+near_zone_theta_width;
        theta_end=0+distance_Ptheta1;

        m=1/(theta_start-theta_end);
        b=-m*theta_end;

        theta1=@(x,y) (theta0(x,y)>90)*-360+theta0(x,y);
   %     fraction=@(x,y) (m*(theta1(x,y))+b).^smooth_power;
        fraction=@(x,y) BW_Meridian_Profile_2(theta1(x,y-y0),1,peripheral_shape_factor,peripheral_mid_fraction,theta_end,theta_start,-10000);        
%         p_meridian=griddedInterpolant(y,p,'spline');
       % p_start=@(x,y) p_meridian(-r1(x,y))*near_zone_edge_fraction.^1;
          p_start=@(x,y) p_meridian(y)*near_zone_edge_fraction.^1;
        p_end=@(x,y) fxy_distance_asphericity(x,y);
        fxy=@(x,y) p_start(x,y).*(fraction(x,y))+p_end(x,y).*(1-fraction(x,y));

        F_maxX=@(y) 10000;% (y-y0)/tan(theta_start*pi/180);
        F_minX=@(y) -10000;%-(y-y0)/tan(theta_end*pi/180);
        rmin=0;
        rmax=100;
        wxy=@(x,y) 0;
        [~,power_xy,~]=bw_zone_01(theta_start,theta_end,rotate_theta,F_maxX,F_minX,rmin,rmax,y0,fxy,wxy,xx,yy,power_xy,power_wt);

        % define weights
        theta_start=-180-POW_distance_theta;
        theta_end=0;%-90+rotate_lens_theta-distance_Ctheta4;
        F_maxX=@(y) -POW_Near_edge_alpha*y.^2-POW_Near_delta_x;
        F_minX=@(y) -1000;%-alpha*y.^2-delta_y;
        y0=distance_y0;
        rmin=0;
        rmax=100;
        rotate_theta=rotate_lens_theta;
        fxy=@(x,y) 0;
        wxy=@(x,y) wt_pow_periphery;
        [a,~,power_wt]=bw_zone_01(theta_start,theta_end,rotate_theta,F_maxX,F_minX,rmin,rmax,y0,fxy,wxy,xx,yy,power_xy,power_wt);

        theta_start=-180;%-180-distance_Ctheta3;
        theta_end=POW_distance_theta;%distance_Ctheta5;%-90+rotate_lens_theta-distance_Ctheta4;
        F_maxX=@(y) 1000;%-alpha*y.^2-delta_y;
        F_minX=@(y) POW_Near_edge_alpha*y.^2+POW_Near_delta_x;

        [b,~,power_wt]=bw_zone_01(theta_start,theta_end,rotate_theta,F_maxX,F_minX,rmin,rmax,y0,fxy,wxy,xx,yy,power_xy,power_wt);
        a=a+b;
        filter_ZonePower{i_Zone}=a/(max(max(a)));        
 %%       
        Fpow=griddedInterpolant(xx,yy,power_xy,'spline');
        F_WT_Power=griddedInterpolant(xx,yy,power_wt,'spline');
       
%%----------------------------------------------------------------------------------------------------------------------------  
%----------------------------------------------------------------------------------------------------------------------------   
%----------------------------------------------------------------------------------------------------------------------------         
if do_diagonostic_plots
        figure(800+distance_y0);clf
        subplot(2,3,length(filter_ZonePower)+1);
            [~,c]= contourf(xx,yy,Fpow(xx,yy),20);        
             xlim([-PAL.Blank_Diameter/2 PAL.Blank_Diameter/2])
             ylim([-PAL.Blank_Diameter/2 PAL.Blank_Diameter/2])  
            colorbar('Ylim',[min(c.LevelList),max(c.LevelList) ])
            clim=caxis;
            title('Power Target')
             axis square;
        for i_Zone=1:length(filter_ZonePower)
            subplot(2,3,i_Zone);
                contourf(xx,yy,filter_ZonePower{i_Zone}.*Fpow(xx,yy),c.LevelList)
                caxis([clim(1) clim(2)]);
                colorbar('Ylim',[min(c.LevelList),max(c.LevelList) ])
                xlim([-PAL.Blank_Diameter/2 PAL.Blank_Diameter/2])
                ylim([-PAL.Blank_Diameter/2 PAL.Blank_Diameter/2])     
                 axis square;
        end
         figure(850+distance_y0);clf
        for i_Zone=1:length(filter_ZonePower)
            subplot(2,3,i_Zone);
            surface(xx,yy,filter_ZonePower{i_Zone},'EdgeColor','none')
             axis square;
        end
end
%%----------------------------------------------------------------------------------------------------------------------------  
%----------------------------------------------------------------------------------------------------------------------------   
%----------------------------------------------------------------------------------------------------------------------------  



cyl_xy=zeros(n);
cyl_wt=zeros(n);
% Now for Cylinder targets
    % zone 1
        % define area filter
        i_Zone=1;
        y0=distance_y0;
        if 0   % when edge of zone is defined by line either theta or f1xlt
            theta_start=0;%
            theta_end=180;%
            F_maxX=@(y) (y-y0)/tan(CYL_distance_theta*pi/180);
            F_minX=@(y)  -(y-y0)/tan(CYL_distance_theta*pi/180);
        else
            theta_start=(0+CYL_distance_theta);
            theta_end=(180-CYL_distance_theta);
            F_maxX=@(y) 10000;%(y-y0)/tan(distance_Ctheta1*pi/180);
            F_minX=@(y) -10000;% -(y-y0)/tan(distance_Ctheta1*pi/180);
        end
        rmin=CYL_radius_0;
        rmax=CYL_radius_distance;
        rotate_theta=0;
        
        fxy=@(x,y) CYL_Value_distance;
        wxy=@(x,y) CYL_WT_distance;
        [filter_ZoneCylinder{i_Zone},cyl_xy,cyl_wt]=bw_zone_01(theta_start,theta_end,rotate_theta,F_maxX,F_minX,rmin,rmax,y0,fxy,wxy,xx,yy,cyl_xy,cyl_wt);        
        
    % zone 2
        i_Zone=2;
        y0=distance_y0;
        theta_start=(0+CYL_distance_theta);
        theta_end=(180-CYL_distance_theta);
        rmin=CYL_radius_distance;
        rmax=CYL_radius_distance_outer;
        rotate_theta=0;
        fxy=@(x,y) CYL_Value_distance_periphery;
        wxy=@(x,y) CYL_WT_distance_periphery;
        [filter_ZoneCylinder{i_Zone},cyl_xy,cyl_wt]=bw_zone_01(theta_start,theta_end,rotate_theta,F_maxX,F_minX,rmin,rmax,y0,fxy,wxy,xx,yy,cyl_xy,cyl_wt);
    
        
        %%
    % zone 3
        i_Zone=3;
        theta_start=-180-CYL_distance_theta;%    -90+rotate_lens_theta-distance_Ctheta4;
        theta_end=CYL_distance_theta;%    -90+rotate_lens_theta+distance_Ctheta4;       
        F_maxX=@(y) CYL_Near_edge_alpha*y.^2+CYL_Near_delta_x;
        F_minX=@(y) -CYL_Near_edge_alpha*y.^2-CYL_Near_delta_x;
        y0=distance_y0;

        rmin=CYL_radius_0;
        rmax=CYL_radius_near_outer;
        rotate_theta=rotate_lens_theta;
        fxy=@(x,y) CYL_Value_near_meridian;
        wxy=@(x,y) CYL_WT_near_meridian; 
        [filter_ZoneCylinder{i_Zone},cyl_xy,cyl_wt]=bw_zone_01(theta_start,theta_end,rotate_theta,F_maxX,F_minX,rmin,rmax,y0,fxy,wxy,xx,yy,cyl_xy,cyl_wt);
            
        %%
    % zone 4
        i_Zone=4;
        theta_start=-180-CYL_distance_theta;
        theta_end=0;%-90+rotate_lens_theta-distance_Ctheta4;
        F_maxX=@(y) -CYL_Near_edge_alpha*y.^2-CYL_Near_delta_x;
        F_minX=@(y) -1000;%-alpha*y.^2-delta_y;
        y0=distance_y0;
        rmin=CYL_radius_0;
        rmax=CYL_radius_distance_outer;
        rotate_theta=rotate_lens_theta;
        fxy=@(x,y) CYL_Value_max_near_periphery;
        wxy=@(x,y) CYL_WT_max_near_periphery;
        [a,cyl_xy,cyl_wt]=bw_zone_01(theta_start,theta_end,rotate_theta,F_maxX,F_minX,rmin,rmax,y0,fxy,wxy,xx,yy,cyl_xy,cyl_wt);

        theta_start=-180;%-180-distance_Ctheta3;
        theta_end=CYL_distance_theta;%distance_Ctheta5;%-90+rotate_lens_theta-distance_Ctheta4;
        F_maxX=@(y) 1000;%-alpha*y.^2-delta_y;
        F_minX=@(y) CYL_Near_edge_alpha*y.^2+CYL_Near_delta_x;

        [b,cyl_xy,cyl_wt]=bw_zone_01(theta_start,theta_end,rotate_theta,F_maxX,F_minX,rmin,rmax,y0,fxy,wxy,xx,yy,cyl_xy,cyl_wt);
        a=a+b;
        filter_ZoneCylinder{i_Zone}=a/(max(max(a)));
        
       
              

          %%
             
     % Fcyl=scatteredInterpolant([x1'],[ y1'],[p1'],'natural');    
      Fcyl=griddedInterpolant(xx,yy,cyl_xy+0,'cubic');
         F_WT_Cyl=griddedInterpolant(xx,yy,cyl_wt.* PAL.Optimization_Control.wt_cyl_relative_to_power,'spline');
         
%%----------------------------------------------------------------------------------------------------------------------------  
%----------------------------------------------------------------------------------------------------------------------------   
%----------------------------------------------------------------------------------------------------------------------------   
         if do_diagonostic_plots
             figure(900+distance_y0);clf
             subplot(2,3,length(filter_ZoneCylinder)+1);
             [M,c]=contourf(xx,yy,Fcyl(xx,yy),20);
             cmp=colormap;
             colorbar('Ylim',[min(c.LevelList),max(c.LevelList) ])
             clim=caxis;
             xlim([-PAL.Blank_Diameter/2 PAL.Blank_Diameter/2])
             ylim([-PAL.Blank_Diameter/2 PAL.Blank_Diameter/2])
             axis square;
             
             for i_Zone=1:length(filter_ZoneCylinder)
                 subplot(2,3,i_Zone);
                 [~,c1]=contourf(xx,yy,filter_ZoneCylinder{i_Zone}.*Fcyl(xx,yy),'LevelList',c.LevelList);
                 caxis([clim(1) clim(2)]);
                 % colormap(cmp);
                 colorbar('Ylim',[min(c.LevelList),max(c.LevelList) ])
                 % colorbar('Ylim',[min(c.LevelList),max(c.LevelList) ], 'box','on')
                 xlim([-PAL.Blank_Diameter/2 PAL.Blank_Diameter/2])
                 ylim([-PAL.Blank_Diameter/2 PAL.Blank_Diameter/2])
                 axis square;
             end
             figure(950+distance_y0);clf
             for i_Zone=1:length(filter_ZoneCylinder)
                 subplot(2,3,i_Zone);
                 surface(xx,yy,filter_ZoneCylinder{i_Zone},'EdgeColor','none')
             end
         end
%----------------------------------------------------------------------------------------------------------------------------   
      
              
    PAL.Optimization_Control.F_Power=Fpow;
    PAL.Optimization_Control.F_Cyl=Fcyl;
      
    PAL.Optimization_Control.F_WT_Power=F_WT_Power;
    PAL.Optimization_Control.F_WT_Cyl=F_WT_Cyl;   
    outside_blankdiameter=(PAL.xx.^2+PAL.yy.^2)>((PAL.Optimization_Diameter)/2)^2;
    PAL.Optimization_Control.Target_Power=PAL.Optimization_Control.F_Power(PAL.xx,PAL.yy);
    PAL.Optimization_Control.Target_Cyl=PAL.Optimization_Control.F_Cyl(PAL.xx,PAL.yy);
    PAL.Optimization_Control.WT_Power=PAL.Optimization_Control.F_WT_Power(PAL.xx,PAL.yy);
    PAL.Optimization_Control.WT_Cyl=PAL.Optimization_Control.F_WT_Cyl(PAL.xx,PAL.yy);
    
    [gx,gy]=gradient(PAL.Optimization_Control.Target_Power,PAL.delta_y,PAL.delta_y);
    PAL.Optimization_Control.Target_gradient_power=sqrt(gx.^2+gy.^2);
    
    
    PAL.Optimization_Control.WT_Power(outside_blankdiameter)=0;
    PAL.Optimization_Control.WT_Cyl(outside_blankdiameter)=0;
     figure(1200+distance_y0);clf
          bw_plot_targets_and_weights(PAL); 


end

function [a,f_xy,f_wt]=bw_zone_01(theta_start,theta_end,rotate_theta,F_maxX,F_minX,rmin,rmax,y0,fxy,wxy,xx,yy,f_xy,f_wt)
        n=length(xx);
     % yy=yy-y0;
        [theta,rr]=cart2pol(xx,yy-y0);
        theta=theta*180/pi;
        if theta_start<-180
            theta(theta>( 360+theta_start))=-180-(180-theta(theta>( 360+theta_start)));
        end
        xxx=xx*cos(-rotate_theta*pi/180)-yy*sin(-rotate_theta*pi/180);
        yyy=xx*sin(-rotate_theta*pi/180)+yy*cos(-rotate_theta*pi/180);
        a=zeros(n);
        filter444=(theta>=theta_start)&(theta<=theta_end)&(xxx<F_maxX(yyy))&(xxx>F_minX(yyy))&(rr<=rmax)&(rr>=rmin);
        a(filter444)=1;
         
        f_xy(a==1)=fxy(xx(a==1),yy(a==1));
        f_wt(a==1)=wxy(xx(a==1),yy(a==1));
        
        %filter_ZoneCylinder{i_Zone}=a;
        % define power target within zone
       % pp(a==1)=f;       

end

%%


    function []=bw_plot_targets_and_weights(PAL)
      
       subplot(2,2,1);[cs] = contourf(PAL.xx,PAL.yy,PAL.Optimization_Control.Target_Power-PAL.Optimization_Control.Rx.sphere,[-0.5:0.25:4]);
       clabel(cs);
       grid;
       axis square;
         colorbar('Ylim',[-0.5,4.25],'Ytick',[-0.25:0.25:4.25],...
               'box','on');
       title('Power Target')    
       xlim([-PAL.Blank_Diameter/2 PAL.Blank_Diameter/2])
       ylim([-PAL.Blank_Diameter/2 PAL.Blank_Diameter/2])

       subplot(2,2,2);[cs] = contourf(PAL.xx,PAL.yy,PAL.Optimization_Control.Target_Cyl,[-0.5:0.25:4]);
       clabel(cs);
       grid;
       axis square
         colorbar('Ylim',[-0.5,4.25],'Ytick',[-0.25:0.25:4.25],...
               'box','on');
       title('Cylinder Target')    
       xlim([-PAL.Blank_Diameter/2 PAL.Blank_Diameter/2])
       ylim([-PAL.Blank_Diameter/2 PAL.Blank_Diameter/2])

       subplot(2,2,3);[cs] = contourf(PAL.xx,PAL.yy,PAL.Optimization_Control.WT_Power);
    
       grid;
       axis square
       colorbar
       title('Power Weights')
       xlim([-PAL.Blank_Diameter/2 PAL.Blank_Diameter/2])
       ylim([-PAL.Blank_Diameter/2 PAL.Blank_Diameter/2])

       subplot(2,2,4);[cs] = contourf(PAL.xx,PAL.yy,PAL.Optimization_Control.WT_Cyl,10);
     
       grid;
       axis square
       colorbar
       title('Cylinder Weights')
       xlim([-PAL.Blank_Diameter/2 PAL.Blank_Diameter/2])
       ylim([-PAL.Blank_Diameter/2 PAL.Blank_Diameter/2]) 
    end