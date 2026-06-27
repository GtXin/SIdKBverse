
clear all
tic

% PAL_Design_108     % this_filename=PAL_Design_108b
% PAL_Design_108a
% PAL_Design_108b ...
%    this_filename=PAL_Design_108b
%    design_designation = 108b
%    design_
% define some of the constants used
    this_filename=mfilename;
    a=strfind(this_filename,'_');
    design_designation=(this_filename(a(end)+1:end));
    ii=0;
    while isempty(str2num(design_designation(1:end-ii)));
        ii=ii+1;
    end
    design_num=str2num(design_designation(1:end-ii));


    pdf_name=[this_filename '.pdf'];    % the plots generated after each optimization are saved to a PDF file
    delete([this_filename '.mat']);
    save_file=matfile([this_filename '.mat']);
  if 1      
    P=load(['PAL_Optimization_Example_00.mat']);
    PAL=P.PAL_Saved_Iterations(end-1);
  else
    % lens constants
    Lens_Power=5.75;  % totallens power Diopters
    Front_Base_Power = 5.75;  % front surface
    ADD=2;  % front surface ADD power in diopters
    index=1.53;  % index of refraction
    
    %  Define initial parameters that define front surface sag   
         FrontSurface=C_PAL_Surface;   % initialize CLASS C_PAL_Surface 
         FrontSurface.Surface_Description.SAG_Function_Name='BW_PAL_SurfaceSAG_V1';    % this is name of m file. parameters are described in power point "PAL Design Summary.pptx" 
         FrontSurface.Surface_Description.index=index;
         FrontSurface.Surface_Description.sphere = Front_Base_Power;    % front surface power in diopers
         FrontSurface.Surface_Description.k = .1;         
         FrontSurface.Surface_Description.mid_point_fraction = .5;                 % defines power along y meridian
         FrontSurface.Surface_Description.add_profile_shape_factor = 0;              % defines power along y meridian
         FrontSurface.Surface_Description.add = 2.25;                                % defines power along y meridian
         FrontSurface.Surface_Description.y0 = 4;                                     % defines power along y meridian
         FrontSurface.Surface_Description.NRP_y = -21;                                 % defines power along y meridian 
         FrontSurface.Surface_Description.off_edge_y = -100;                              % defines power along y meridian
         FrontSurface.Surface_Description.cx2(1,:) = [2      0        -40     10 0 0 0 0 0 0 0 0];    % C(x,y) see "PAL Design Summary.pptx" 
         FrontSurface.Surface_Description.cx2(2,:) = [2      0         40     10 0 0 0 0 0 0 0 0];   % this is upper portion of lens
         FrontSurface.Surface_Description.cx2(3,:) = [4      0        -40     10 0 0 0 0 0 0 0 0];
         FrontSurface.Surface_Description.cx2(4,:) = [6      0        -40     10 0 0 0 0 0 0 0 0];
    FrontSurface.Surface_Description.variable_list={...
        'sphere' 'k'  ...         % not used here but this shows how variables are added to optimization
        };   

    % initialize CLASS C_PAL 
    PAL=C_PAL(  'design_name_prefix',this_filename,...
                'Front_Base_Power',Front_Base_Power,...
                'Coordinates',C_PAL_Coordinates(),...        
                'Optimization_Control',BW_Default_Optimization_Control,...
                'Rx_PAL',C_Rx(Lens_Power,0,0,ADD),...
                'delta_y',1,...
                'FrontSurface',FrontSurface...
               );
  end


%  for optimizaiton we need to define power and cylidner targets and
%  weights.  This is done with defintion of functions (next two lines) and
%  user adjustable structgure Optimization_Control which is passed to
%  Targets_Function and Weights_Function
%  I am in the process of updating this to' use @BW_PAL_Targets_03, which
%  will also use a different input structure.  
    PAL.Optimization_Control.Targets_Function=@BW_PAL_Targets_03;
   % PAL.Optimization_Control.Rx.sphere= Front_Base_Power    ;
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
    PAL.Optimization_Control.TargetParameters.wt_pow_periphery=5;

    % CYL constraints
    PAL.Optimization_Control.TargetParameters.CYL_radius_0=0;
    PAL.Optimization_Control.TargetParameters.CYL_radius_distance=20;
    PAL.Optimization_Control.TargetParameters.CYL_distance_theta=PAL.Optimization_Control.TargetParameters.distance_Ptheta1;     % 
    PAL.Optimization_Control.TargetParameters.CYL_Value_distance=0.1;
    PAL.Optimization_Control.TargetParameters.CYL_WT_distance=100;
    
    PAL.Optimization_Control.TargetParameters.CYL_radius_distance_outer=85;
    PAL.Optimization_Control.TargetParameters.CYL_radius_near_outer=30;
    PAL.Optimization_Control.TargetParameters.CYL_Value_distance_periphery=.5;
    PAL.Optimization_Control.TargetParameters.CYL_WT_distance_periphery=20;
    
    PAL.Optimization_Control.TargetParameters.CYL_Value_max_near_periphery=-4;
    PAL.Optimization_Control.TargetParameters.CYL_WT_max_near_periphery=.5;
    
    PAL.Optimization_Control.TargetParameters.CYL_Value_near_meridian=.0125;
    PAL.Optimization_Control.TargetParameters.CYL_WT_near_meridian=100;

    PAL.Optimization_Control.TargetParameters.CYL_Near_edge_alpha=.005;
    PAL.Optimization_Control.TargetParameters.CYL_Near_delta_x=5; 
    
    PAL.Optimization_Control.wt_cyl_relative_to_power=1;
    
i_plot=1; %design_num*10;
PAL.M_plot_all(i_plot+design_num*100,['initial ' num2str(i_plot)]);   % this generates figure with summary plot 
PAL_Saved_Iterations(i_plot)=PAL;   %
%save([design_name_prefix],'PAL_Saved_Iterations');   % .mat file is created i.e. PAL_Optim_999.mat which contains results of each iteration
delete([this_filename '.mat']);  
save_file.PAL_Saved_Iterations=PAL_Saved_Iterations;
export_fig(figure(i_plot+design_num*100),pdf_name);   % this creates PDF file with figure.  subsequent figures can be appended
i_plot=i_plot+1;
    toc

%%  This section shows optimization of spline coefficients
max_optimization_time_seconds=1*60;  

     %
     tic
     wt_cyl_relative_to_power=[1];
         PAL.Optimization_Control.wt_cyl_relative_to_power=wt_cyl_relative_to_power;
         %  
         PAL.FrontSurface.Surface_Description.variable_list={...
              'spline' ...
             };
                
         PAL1=PAL;
         %

        options=optimoptions('fmincon');
        
        % i set this up in a loop that allows some key input parameters to
        % be changed
        Adelta_y=     [2 1 ];    % delta_y.  this controls he grid spacing used for calculating deritives of sag (to get power/cyl) and also the spacing for calculating the merit function
        Adelta_spline=[5 5 ];    % this is the grid spacing of the spline points
        ASmoothingParameter=[1 1];  % this is a smoothing parameter used on the spline in BW_PAL_SurfaceSAG_V1.  this helps to remove undulations which make power/cyl "lumpy"
            % next one is fmincon OptimalityTolerance.  here I am just
            % using the default values
        AOptimalityTolerance=[options.OptimalityTolerance options.OptimalityTolerance options.OptimalityTolerance options.OptimalityTolerance options.OptimalityTolerance options.OptimalityTolerance options.OptimalityTolerance options.OptimalityTolerance];
      
        for ii=1:length(Adelta_y)
            delta_spline=Adelta_spline(ii);
            delta_y=Adelta_y(ii);
            OptimalityTolerance=AOptimalityTolerance(ii);
             %%
             disp('-----------------------------------------------------------------------------------------------------')
             disp('-----------------------------------------------------------------------------------------------------')
             disp('-----------------------------------------------------------------------------------------------------')
             disp(['  delta_spline = ' num2str(delta_spline)])
             PAL1.FrontSurface.Surface_Description.SmoothingParameter=ASmoothingParameter(ii);
             PAL1=PAL1.M_Set_New_delta_y(delta_y);
             PAL1=PAL1.M_Set_New_delta_spline(delta_spline);
             
             %  next line is nice feature.  As currently set all the spline
             %  control points are used as optimization variables, but this
             %  allows them to be filtered.  For instance, if one wanted to
             %  only optimize spline in lower portion of lens then this
             %  line would be =@(x,y) (x<100)&(y<=0); 
             %  Or =@(x,y) (x~=0)&(y<=110) would not incude points along y-axis 
             PAL1.FrontSurface.Surface_Description.spline_filter=@(x,y) (x<100)&(y<=110); 
             
             PAL1=PAL1.Optimization_Control.Targets_Function(PAL1);
             [x0] = M_X0_from_VariableList(PAL1);   % This shows method that creates array from VariableList
             mf_val0=PAL1.M_UpdateMeritFunction(x0); % Merit functon is calculated with input array
             
             disp([' Initial on grid ' num2str(PAL1.Current_merit_function) ' ' num2str(mf_val0) ' ' num2str(size(x0))])
             PAL1.Optimization_Control.fmincon_output.funcCount=100000000;  %
             start=tic;
             fcount=0;
             % optimization loop.  keep going while still converging or
             % until max time exceeded
             while PAL1.Optimization_Control.fmincon_output.funcCount>=100000 && (toc(start)<max_optimization_time_seconds)  % default max function calls allowed is 100,000, so if this is (slightly) >100,000 then still converging so this allows it to continue
                 disp('       xx FMINCON xxx------------------------------------------------------')
                 disp(strcat(['',  datestr(now,'mmm.dd,yyyy HH:MM:SS pm')]))  
                 PAL1.M_plot_all(9998,' ','Initial');drawnow
                 PAL1=PAL1.M_fmincon(OptimalityTolerance);  % run optiization
                 fcount1=(PAL1.Optimization_Control.fmincon_output.funcCount);
                 fcount=fcount+fcount1;
                 [x0] = M_X0_from_VariableList(PAL1);
                 mf_val0=PAL1.M_UpdateMeritFunction(x0); % get merit function value
                 
                 % title1 and title2 are inputs to M_plot_all for titles
                 % across top of figure
                 title1={ ...
                     [this_filename ' iter#=' num2str(i_plot) ' plot#=' num2str(i_plot+design_num*100) ' mf_val=' num2str(mf_val0) '  ' num2str((toc)/60) 'minutes' '  fcount=' num2str(fcount) '   ' num2str(fcount/toc,'%.2f') 'per/sec'] ...
                     ['delta_spline =' num2str(delta_spline) ' cyl_wt=' num2str(wt_cyl_relative_to_power) ' delta_y=' num2str(PAL1.delta_y) ' '  ] ...
                     };
                 title2={''};
                 disp(char(title1))
                 disp(char(title2))
                 disp(strcat(['',  datestr(now,'mmm.dd,yyyy HH:MM:SS pm')]))
                 PAL1.M_plot_all(9999,title1,'INTERIM');savefig('interim.fig');drawnow;                % ceate figure
                 PAL_Saved_Iterations(i_plot)=PAL1;
                 delete([this_filename '.mat']);
                 save_file.PAL_Saved_Iterations=PAL_Saved_Iterations;                 
             end
                 % plot and save
                 PAL1.M_plot_all(i_plot+design_num*100,title1,title2);
                 PAL_Saved_Iterations(i_plot)=PAL1;
                 delete([this_filename '.mat']);
                 save_file.PAL_Saved_Iterations=PAL_Saved_Iterations; 
                 export_fig(figure(i_plot+design_num*100),pdf_name, '-append');
                 i_plot=i_plot+1;
                 
%                  PAL1=PAL1.M_Set_New_delta_y(.5); % i added this as 'test' to show differences in calculate results with smaller grid spacing due to this also being increment used for calculating derivatives  
%                  title1={ ...
%                      [this_filename ' iter#=' num2str(i_plot) ' plot#=' num2str(i_plot+design_num*100) ' mf_val=' num2str(mf_val0) '  ' num2str((toc)/60) 'minutes' '  fcount=' num2str(fcount) '   ' num2str(fcount/toc,'%.2f') 'per/sec'] ...
%                      ['delta_spline =' num2str(delta_spline) ' cyl_wt=' num2str(wt_cyl_relative_to_power) ' delta_y=' num2str(PAL1.delta_y) ' '  ] ...
%                      };                  
%                   PAL1.M_plot_all(9000+i_plot-1,title1,title2);
         end     
         toc
    