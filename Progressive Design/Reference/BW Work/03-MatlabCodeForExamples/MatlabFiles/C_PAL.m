classdef C_PAL
    %UNTITLED2 Summary of this class goes here 
    %   Detailed explanation goes here
    
    properties
        design_name_prefix            
        Front_Base_Power
        Rx_PAL
        Rx_Front
        Rx_Back 
        Coordinates        
        FrontSurface
        %Surface_Description
        BackSurface
        thickness=2
        index= 1.5920
        Optimization_Control        
        %MeritFunctionTargets
        variable_list
        delta_y
        y        
        xx
        yy
        metrics
    end
    properties (Dependent)
        Front_Radius
        Base_Curve_153
        back_radius
        Back_Power
        Current_merit_function

    end
    
    properties (Constant)
        Blank_Diameter=70;  % Used for Plotting
        Optimization_Diameter=75; % Used for surface definition and optimization
        
          colormap1=[0.8,0.8,0.8;...
                    0.9,0.9,0.9;...
                    1.0,1.0,1.0;...
                    1.0,0.85,0.85;...
                    0.5,1.0,1.0;...
                    0.1,1.0,1.0;...
                    0.4,1.0,0.4;...
                    0.2,1.0,0.2;...
                    1.0,1.0,0.4;...
                    1.0,1.0,0.0;...
                    1.0,0.2,0.2;...
                    0.8,0.1,0.1;...
                    0.8,0.2,0.6;...
                    0.8,0.0,0.6;...
                    0.6,0.5,0.3;...
                    0.4,0.3,0.2;...
                    0.2,0.4,0.5;...
                    0.4,0.6,0.5];     
                
          clevel = [-0.5,-0.25,0.00,0.025,0.05,0.10,0.25:0.25:4.25];                
    end
    
    methods
        function obj = C_PAL(varargin)
                p=inputParser;
                % Analysis Conditions -----------------------------------------------------------------------------------------------------------
                p.addParameter('design_name_prefix', [] );  
                p.addParameter('Front_Base_Power', 0  );     
                p.addParameter('Coordinates',[] );    
                %p.addParameter('MeritFunctionTargets',[] );    
                p.addParameter('FrontSurface',[] );    
                p.addParameter('BackSurface',[] );                
                p.addParameter('thickness',2 );    
                p.addParameter('index',[] ); 
                p.addParameter('delta_y',1 ); 
                p.addParameter('Optimization_Control',[] );               
                p.addParameter('Rx_PAL',C_Rx(-3,0,0,2) );     
                %p.addParameter('Surface_Description',[] ); 
                p.parse(varargin{:} );
                for ii=1:length( p.Parameters)
                    obj.(p.Parameters{ii}) = p.Results.(p.Parameters{ii});
                end  
                %obj.FrontSurface.SAG_Function=str2func(SAG_Function);
                if isfield(obj,'FrontSurface.Surface_Description.index')
                     obj.index=obj.FrontSurface.Surface_Description.index;
                else
                    obj.index=1.53;
                end
                obj=M_Set_New_delta_y(obj,obj.delta_y);
%                 obj.y=-36:obj.delta_y:36;
%                 [obj.xx,obj.yy]=ndgrid(obj.y);
%                 obj=obj.Optimization_Control.Targets_Function(obj);    
%                 obj=M_FrontSurface_1st(obj);   % first pass at determining front surface
        end
        
        function obj=M_Set_New_delta_y(obj,delta_y)
            obj.delta_y=delta_y;
            ymax=round((obj.Optimization_Diameter/2+2*delta_y)/delta_y)*delta_y;
            obj.y=- ymax:delta_y: ymax;
            [obj.xx,obj.yy]=ndgrid(obj.y);
            %if isfield(obj,'Optimization_Control.Targets_Function')
                obj=obj.Optimization_Control.Targets_Function(obj);    
                obj=M_FrontSurface_1st(obj);   % first pass at determining front surface         
            %end
        end
        
        function obj=M_Set_New_delta_spline(obj,delta_spline)
             obj.FrontSurface.Surface_Description.spline_filter=@(x,y) (y<50); %~((x==0)&(y==0)
             obj.FrontSurface.Surface_Description.spline_diameter=obj.Optimization_Diameter+4*delta_spline;
             obj.FrontSurface.Surface_Description.delta_spline=delta_spline;
             obj.FrontSurface=M_PCA(obj.FrontSurface);
             y1=- round(obj.FrontSurface.Surface_Description.spline_diameter/2/delta_spline)*delta_spline:delta_spline: round(obj.FrontSurface.Surface_Description.spline_diameter/2/delta_spline)*delta_spline;
             if isfield(obj.FrontSurface.Surface_Description,'F')         
                 xx2=  obj.FrontSurface.Surface_Description.xx1;
                 yy2=  obj.FrontSurface.Surface_Description.yy1;
                 [obj.FrontSurface.Surface_Description.xx1,obj.FrontSurface.Surface_Description.yy1]=ndgrid(y1);    
                  if ~isfield(obj.FrontSurface.Surface_Description,'SplineSmoothingParameter')
                      obj.FrontSurface.Surface_Description.SplineSmoothingParameter=1;
                  end
                  bb=csaps({xx2(:,1),yy2(1,:)},obj.FrontSurface.Surface_Description.F(xx2,yy2),obj.FrontSurface.Surface_Description.SplineSmoothingParameter,{obj.FrontSurface.Surface_Description.xx1(:,1),obj.FrontSurface.Surface_Description.yy1(1,:)});
                 obj.FrontSurface.Surface_Description.F=griddedInterpolant(obj.FrontSurface.Surface_Description.xx1,obj.FrontSurface.Surface_Description.yy1,bb,'spline')     ;
             else
                 [obj.FrontSurface.Surface_Description.xx1,obj.FrontSurface.Surface_Description.yy1]=ndgrid(y1);
                 obj.FrontSurface.Surface_Description.F=griddedInterpolant(obj.FrontSurface.Surface_Description.xx1,obj.FrontSurface.Surface_Description.yy1,0*obj.FrontSurface.SAG_Function(obj.FrontSurface.Surface_Description.xx1,obj.FrontSurface.Surface_Description.yy1),'spline')     ;
             end         
             obj.FrontSurface.Surface_Description.filter1=obj.FrontSurface.Surface_Description.spline_filter(obj.FrontSurface.Surface_Description.xx1,obj.FrontSurface.Surface_Description.yy1);
                        
            
        end
%         function val = get.y(obj)
%             val=-36:obj.delta_y:36;
%         end 
%         
%         function val = get.yy(obj)
%             [~,val]=ndgrid(obj.y);
%         end 
% 
%         function val = get.xx(obj)
%             [val,~]=ndgrid(obj.y);
%         end 

        function val = get.Current_merit_function(obj)
             a=obj.M_FrontSurface_Metrics  ;
             val=a.metrics.MF;
        end        
        
        
        function val = get.Base_Curve_153(obj)
            val=obj.Front_Base_Power*0.53/(obj.index-1);
        end        
        
        function val = get.Front_Radius(obj)
            val=-(obj.index-1)/obj.Rx_Front.sphere*1000;
        end    
       
                                  
        function val = get.Back_Power(obj)
                t=obj.thickness/1000;
                c1=obj.Front_Base_Power;
                phi=obj.Rx_PAL.sphere;
                val=(phi - c1)/(1-t*c1); 
        end     
                
        function val=get.Rx_Front(obj)
            val=C_Rx(obj.Front_Base_Power,0,0,obj.Rx_PAL.add);
        end
    
        function val=get.Rx_Back(obj)
            val=C_Rx(obj.Back_Power,0,0,0);  
        end      
        
        
        
        function obj=M_optimize_spline(obj,optim_type,time_in_minutes)
              if nargin<2
                  optim_type='fmincon';
              end
              if nargin<3
                  time_in_minutes=Inf;
              end
            if ~isfield(obj.FrontSurface.Surface_Description,'F')  
                [obj.FrontSurface.Surface_Description.xx1,obj.FrontSurface.Surface_Description.yy1]=ndgrid(-obj.FrontSurface.Surface_Description.spline_diameter/2:obj.FrontSurface.Surface_Description.delta_spline:obj.FrontSurface.Surface_Description.spline_diameter/2);
                obj.FrontSurface.Surface_Description.F=griddedInterpolant(obj.FrontSurface.Surface_Description.xx1,obj.FrontSurface.Surface_Description.yy1,obj.FrontSurface.SAG_Function(obj.FrontSurface.Surface_Description.xx1,obj.FrontSurface.Surface_Description.yy1),'spline')     ;
                obj.FrontSurface.Surface_Description.SAG_Function_Name='PAL_type_gridSpline';     
                obj.FrontSurface.Surface_Description.filter1=obj.FrontSurface.Surface_Description.spline_filter(obj.FrontSurface.Surface_Description.xx1,obj.FrontSurface.Surface_Description.yy1);
            end
            if strcmpi(optim_type,'fmincon')
               obj=M_fmincon(obj) ;
            elseif strcmpi(optim_type,'global')
               obj=M_GlobalSearch(obj,time_in_minutes); 
            elseif strcmpi(optim_type,'dls')
                obj=M_dls(obj);
            elseif strcmpi(optim_type,'sa')
                obj=M_SimulatedAnnealing(obj);                
            end          
            obj.FrontSurface=M_PCA(obj.FrontSurface);
        end
        
        function obj=M_SimulatedAnnealing(obj)
            obj=obj.Optimization_Control.Targets_Function(obj);   
            ub=[];
            lb=[];
            [x0] = M_X0_from_VariableList(obj);  
            mf_val0=obj.M_UpdateMeritFunction(x0);
            options = optimoptions(@simulannealbnd, ...
                'PlotFcn',{@saplotbestf,@saplottemperature,@saplotf,@saplotstopping});
            options.MaxFunctionEvaluations=100000*length(obj.FrontSurface.Surface_Description.variable_list);
            [x] = simulannealbnd((@(x) obj.M_UpdateMeritFunction(x)) ,x0,lb,ub,options);
            mf_val=obj.M_UpdateMeritFunction(x);
            disp([' Before / After SimulatedAnnealing ' num2str(mf_val0) ' / ' num2str(mf_val)])
            obj=M_UpdatePAL_from_x0(obj,x);
            obj.FrontSurface=M_PCA(obj.FrontSurface);
        end
        
        function obj=M_dls(obj)
            obj=obj.Optimization_Control.Targets_Function(obj);   
            [x0] = M_X0_from_VariableList(obj);           
            mf_val0=obj.M_UpdateMeritFunction(x0);
            options=optimoptions('fsolve','Algorithm','levenberg-marquardt','UseParallel',true);
            options.FunctionTolerance=1e-8;
            options.MaxFunctionEvaluations=100000;
            [x,mf_val]=fsolve(  (@(x) obj.M_UpdateMeritFunction(x)) ,x0,options);            
            disp([' Before / After DLS ' num2str(mf_val0) ' / ' num2str(mf_val)])
            obj=M_UpdatePAL_from_x0(obj,x);
            obj.FrontSurface=M_PCA(obj.FrontSurface);
        end
        
        function obj=M_fmincon(obj,OptimalityTolerance)
            options=optimoptions('fmincon','MaxIterations',200,'UseParallel',true,'Display','iter');
            if (nargin<2)
                OptimalityTolerance=options.OptimalityTolerance;
            end
            obj=obj.Optimization_Control.Targets_Function(obj);   
            ub=[];
            lb=[];
            [x0] = M_X0_from_VariableList(obj);
            mf_val0=obj.M_UpdateMeritFunction(x0);
             %options.FiniteDifferenceStepSize=1000*sqrt(eps);
             options.MaxFunctionEvaluations=100000;
             options.OptimalityTolerance=OptimalityTolerance;
             options.ScaleProblem=true;
                         
                xLast = []; % Last place computeall was called
                myf = []; % Use for objective at xLast
                myc = []; % Use for nonlinear inequality constraint
                myceq = []; % Use for nonlinear equality constraint

                fun = @objfun; % The objective function, nested below
                cfun = @constr; % The constraint function, nested below   
                [x,mf_val,~,obj.Optimization_Control.fmincon_output] = fmincon(fun,x0,[],[],[],[],[],[],cfun,options);
           
            disp([' Before / After fmincon ' num2str(mf_val0) ' / ' num2str(mf_val)])
            obj=M_UpdatePAL_from_x0(obj,x);     
            obj.FrontSurface=M_PCA(obj.FrontSurface);
            
                function y = objfun(x)
                    if ~isequal(x,xLast) % Check if computation is necessary
                        [myf,myc,myceq] = obj.M_UpdateMF_and_Constraints(x);
                        xLast = x;
                    end
                    % Now compute objective function
                    y = myf ;
                end

                function [c,ceq] = constr(x)
                    if ~isequal(x,xLast) % Check if computation is necessary
                        [myf,myc,myceq] = obj.M_UpdateMF_and_Constraints(x);
                        xLast = x;
                    end
                    % Now compute constraint function
                    c = myc; % In this case, the computation is trivial
                    ceq = myceq;
                end            
            
            
        end
        
%         function obj=M_fmincon(obj,OptimalityTolerance)
%             options=optimoptions('fmincon','MaxIterations',1000,'UseParallel',true,'Display','off');
%             if (nargin<2)
%                 OptimalityTolerance=options.OptimalityTolerance;
%             end
%             obj=obj.Optimization_Control.Targets_Function(obj);   
%             ub=[];
%             lb=[];
%             [x0] = M_X0_from_VariableList(obj);
%             mf_val0=obj.M_UpdateMeritFunction(x0);
%              %options.FiniteDifferenceStepSize=1000*sqrt(eps);
%              options.MaxFunctionEvaluations=100000;
%              options.OptimalityTolerance=OptimalityTolerance;
%              options.ScaleProblem=true;
%             [x,mf_val,~,obj.Optimization_Control.fmincon_output]=fmincon( (@(x) obj.M_UpdateMeritFunction(x)) ,x0,[],[],[],[],lb,ub,[],options);
%             disp([' Before / After fmincon ' num2str(mf_val0) ' / ' num2str(mf_val)])
%             obj=M_UpdatePAL_from_x0(obj,x);     
%             obj.FrontSurface=M_PCA(obj.FrontSurface);
%         end        
        
        function obj=M_GlobalSearch(obj,time_in_minutes)
            ub=[];
            lb=[];
            mf_val0=obj.Current_merit_function;
            %  global search
            [x0] = M_X0_from_VariableList(obj);
            problem = createOptimProblem('fmincon','objective',(@(x) obj.M_UpdateMeritFunction(x)) ,'x0',x0,'lb',lb,'ub',ub);
            problem.options.MaxIterations=1000;
            problem.options.MaxFunctionEvaluations=20000000;
            gs = GlobalSearch('Display','iter');
            if nargin==2
                gs.MaxTime=time_in_minutes*60;
            end
            [x] = run(gs,problem);
            obj=M_UpdatePAL_from_x0(obj,x);
            disp([' Before / After GlobalSearch ' num2str(mf_val0) ' / ' num2str(obj.Current_merit_function )])
            obj.FrontSurface=M_PCA(obj.FrontSurface);
            %ms = MultiStart;
            %  [x,fval,eflag,output,manymins] = run(ms,problem,50)
        end
        
        function mf_val=M_UpdateMeritFunction(obj,x0)           
            obj=M_UpdatePAL_from_x0(obj,x0);             
            mf_val=obj.Current_merit_function ;
            %disp([num2str(mf_val) ' ' num2str(x0)])
        end
        
          function [mf_val,c,ceq]=M_UpdateMF_and_Constraints(obj,x0)           
             obj=M_UpdatePAL_from_x0(obj,x0);   
             a=obj.M_FrontSurface_Metrics;
             mf_val=a.metrics.MF; 
             c=a.metrics.CYL_less_than ; 
             
             ceq=[];
%              ceq(1)=a.metrics.add-2.5;
%              ceq(2)=a.metrics.DRP.p-5.75;
         end      
        
        function x0=M_X0_from_VariableList(obj)  %BW_OptimVariables_X_from_VariableList
            Surface_Description=obj.FrontSurface.Surface_Description;
            
            x0=[];
            if (length(Surface_Description.variable_list)==1) && strcmpi(Surface_Description.variable_list,'spline')
                 x0=[x0 Surface_Description.F.Values(Surface_Description.filter1)'];
            else
                for i=1:length(Surface_Description.variable_list)                  
                   if strcmpi(Surface_Description.variable_list{i},'spline')
                        x0=[x0 Surface_Description.F.Values(Surface_Description.filter1)'];
                   else           
                    a1=strfind(Surface_Description.variable_list{i},'(');
                    a2=strfind(Surface_Description.variable_list{i},')');
                    if isempty(a1)
                        x0= [x0 Surface_Description.(deblank(Surface_Description.variable_list{i})) ];
                    else
                        index_string=((Surface_Description.variable_list{i}(a1+1:a2-1)));
                        a3=strfind(index_string,',');
                        if isempty(a3)
                            x0 = [x0 Surface_Description.(deblank(Surface_Description.variable_list{i}(1:a1-1)))(str2double(Surface_Description.variable_list{i}(a1+1:a2-1)))   ]      ;                            
                        else
                             x0 = [x0 Surface_Description.(deblank(Surface_Description.variable_list{i}(1:a1-1)))(str2double(index_string(1:a3)),str2double(index_string(a3+1:end)))];
                        end
                    end
                   end
                end
            end
        end
        
        function obj=M_UpdatePAL_from_x0(obj,x0)                                   
             % spline
            if strcmpi(obj.FrontSurface.Surface_Description.SAG_Function_Name,'PAL_type_gridSpline')                
                obj.FrontSurface.Surface_Description.F.Values(obj.FrontSurface.Surface_Description.filter1)=x0;%  =reshape(x0,s,t);
            % variables list
            else
                for i=1:length(obj.FrontSurface.Surface_Description.variable_list)
                    if  strcmpi(obj.FrontSurface.Surface_Description.variable_list{i},'spline')
                          s = sum(sum((obj.FrontSurface.Surface_Description.filter1)))-1;
                          obj.FrontSurface.Surface_Description.F.Values(obj.FrontSurface.Surface_Description.filter1)=x0(i:(i+s));%  =reshape(x0,s,t);                        
                        else
                            %s2=[system.(lens).variables(i,1:end)];
                            a1=strfind(obj.FrontSurface.Surface_Description.variable_list{i},'(');
                            if isempty(a1)
                                obj.FrontSurface.Surface_Description.(obj.FrontSurface.Surface_Description.variable_list{i})=x0(i);%x0(i+i1);
                            else
                                s3=obj.FrontSurface.Surface_Description.variable_list{i}(1:a1-1);
                                index_string=obj.FrontSurface.Surface_Description.variable_list{i}(a1+1:end-1);
                                a3=strfind(index_string,',');
                                if isempty(a3)
                                    obj.FrontSurface.Surface_Description.(deblank(s3))(str2double(index_string))=x0(i);%x0(i+i1);
                                else
                                    obj.FrontSurface.Surface_Description.(deblank(s3))(str2double(index_string(1:a3)),str2double(index_string(a3+1:end)))=x0(i);                                  
                                end
                            end                            
                    end
                end
            end                
        end
        
        function obj=M_FrontSurface_1st(obj)
            %obj.FrontSurface=C_PAL_Surface;   
            obj.FrontSurface.Rx= obj.Rx_Front;              
            obj.FrontSurface.Optimization_Control= obj.Optimization_Control;
            obj.FrontSurface.Optimization_Diameter= obj.Optimization_Diameter;
            obj.FrontSurface.y=obj.y;
            obj.FrontSurface.xx=obj.xx;            
            obj.FrontSurface.yy=obj.yy;
            %obj.FrontSurface.Surface_Description=obj.Surface_Description;
            if isempty(obj.FrontSurface.Surface_Description.SAG_Function_Name)  % sag is defined by gridded spline            
                obj.FrontSurface.SAG_Function=M_SAG_Estimate_from_Power_Target(obj.FrontSurface);
                obj=M_Scale_ADD(obj);
                obj=M_Scale_ADD(obj);
            else
               % surf1=obj.Surface;
                %obj.FrontSurface.SAG_Function=str2func(['@(x,y) ' obj.Surface.SAG_Function '(obj.FrontSurface,x,y)']);
                %a=['obj.FrontSurface.SAG_Function=@(x,y) ' obj.Surface.SAG_Function '(obj.FrontSurface,x,y)'];
                %eval(a);
            end
            obj.FrontSurface=M_PCA(obj.FrontSurface);
        end
        
        function obj=M_FrontSurface_Metrics(obj)           
            F=obj.FrontSurface.SAG_Function;    
            obj.FrontSurface=M_PCA(obj.FrontSurface);
            obj.metrics.DRP.sag=F(obj.Coordinates.DRP_x,obj.Coordinates.DRP_y);
            obj.metrics.NRP.sag=F(obj.Coordinates.NRP_x,obj.Coordinates.NRP_y);
            obj.metrics.FP.sag=F(obj.Coordinates.FP_x,obj.Coordinates.FP_y);            
            F=griddedInterpolant(obj.FrontSurface.xx,obj.FrontSurface.yy, obj.FrontSurface.PCA.p);
            obj.metrics.DRP.p=F(obj.Coordinates.DRP_x,obj.Coordinates.DRP_y);
            obj.metrics.NRP.p=F(obj.Coordinates.NRP_x,obj.Coordinates.NRP_y);
            obj.metrics.add=obj.metrics.NRP.p-obj.metrics.DRP.p;
            obj.metrics.FP.p=F(obj.Coordinates.FP_x,obj.Coordinates.FP_y);   
            filter_cyl_less_than_specified=(obj.Optimization_Control.Target_Cyl<0);
            
%             figure(3332);contourf(filter_cyl_less_than_specified);
%             figure(332);contourf(~filter_cyl_less_than_specified);
            
            obj.metrics.MFpower=sum(sum(  (obj.Optimization_Control.Target_Power-obj.FrontSurface.PCA.p).^2.*obj.Optimization_Control.WT_Power   )) ;
            obj.metrics.MFcyl=sum(sum((obj.Optimization_Control.Target_Cyl(~filter_cyl_less_than_specified)-obj.FrontSurface.PCA.c(~filter_cyl_less_than_specified)).^2.*obj.Optimization_Control.WT_Cyl(~filter_cyl_less_than_specified))) ;            
            obj.metrics.MF=obj.metrics.MFpower+obj.metrics.MFcyl;
            obj.metrics.CYL_less_than=[];
            a=-obj.Optimization_Control.Target_Cyl(filter_cyl_less_than_specified)-obj.FrontSurface.PCA.c(filter_cyl_less_than_specified);
            if ~isempty(a)
                obj.metrics.CYL_less_than=-a;
            end
            [gx,gy]=gradient(obj.FrontSurface.PCA.p,obj.delta_y,obj.delta_y);
           
                outside_blankdiameter=(obj.xx.^2+obj.yy.^2)>((obj.Optimization_Diameter)/2)^2;
                gx(outside_blankdiameter)=0;
                gy(outside_blankdiameter)=0;       
            if isfield(obj.Optimization_Control,'wt_gradientPower')
                obj.metrics.MF=obj.metrics.MF+  sum(sum((gx.^2+gy.^2))).*obj.Optimization_Control.wt_gradientPower;
                 [gx,gy]=gradient(obj.FrontSurface.PCA.c,obj.delta_y,obj.delta_y);
                    gx(outside_blankdiameter)=0;
                    gy(outside_blankdiameter)=0;                
                obj.metrics.MF=obj.metrics.MF+  sum(sum((gx.^2+gy.^2))).*obj.Optimization_Control.wt_gradientCyl;
            end
        end
        
        function obj=M_Scale_ADD(obj)   % this currently only works when defined solely by griddedIinterpolant
            obj=M_FrontSurface_Metrics(obj);
            [xx1,yy1]=ndgrid(obj.FrontSurface.SAG_Function_GRID.GridVectors{1},obj.FrontSurface.SAG_Function_GRID.GridVectors{2});
            z_sag_old=obj.FrontSurface.SAG_Function_GRID(xx1,yy1);
            z_origin_old=obj.FrontSurface.SAG_Function_GRID(0,0);
            rr2=xx1.^2+yy1.^2;   %r^2
            
           radius_atDRP_mm = (obj.index-1)*1000/obj.metrics.DRP.p;
           sag_base_radius_DRP_old =(rr2*(1/radius_atDRP_mm))./( 1 + sqrt ( 1- rr2 / radius_atDRP_mm^2))*1000; %microns
           
           % First, figure out the old base sag:------------------------------------
           z_sub_old = z_sag_old - z_origin_old;   % microns
           progressive_sag_old     =     z_sub_old - sag_base_radius_DRP_old;
           if obj.FrontSurface.Rx.sphere==0
                baseR=1e10;
           else
                baseR = (obj.index-1)*1000/obj.FrontSurface.Rx.sphere;
           end
           sag_base_radius_new = (rr2*(1/baseR))./( 1 + sqrt ( 1- rr2 / baseR^2))*1000; %micons
                             
           scale_add = obj.FrontSurface.Rx.add/(obj.metrics.NRP.p-obj.metrics.DRP.p) ;          
           progressive_sag_new =  progressive_sag_old * scale_add;                             
           sag_total_new = sag_base_radius_new + progressive_sag_new;            
           obj.FrontSurface.SAG_Function_GRID.Values = sag_total_new;
           obj.FrontSurface=M_PCA(obj.FrontSurface);
        end
        
        function M_plot_power_error(obj)
            obj.FrontSurface=M_PCA(obj.FrontSurface);
            p=obj.Optimization_Control.Target_Power-obj.FrontSurface.PCA.p;
            outside_blankdiameter=(obj.xx.^2+obj.yy.^2)>((obj.Blank_Diameter)/2)^2;
            p(outside_blankdiameter)=NaN;
            contourf(obj.xx,obj.yy,p,-1.5:.25:1.5)
            colorbar
        end
        
        function M_plot_all(obj,f1,figure_title,center_title)
            if nargin<4
                center_title='';
            elseif nargin<3
                 figure_title='';
            elseif nargin<2
                f1=figure;              
            end
            rows=3;
            cols=4;
            a=get(groot);
            size_pixels=800;
  
            figure(f1);clf
            set(f1, 'Name', 'Design Analysis', ...
                'PaperPosition', [0,0,8.5,11], ...
                'Visible','on', ...
                'position',[a.ScreenSize(3)-size_pixels/rows*cols-50,a.ScreenSize(4)-size_pixels/cols*rows-100,size_pixels/rows*cols,size_pixels/cols*rows],...   % left bottom width height
                'Color',[1,1,1],'Resize','on');

            [SP] = BW_Subplot_Template(rows,cols,figure_title,center_title) ;
           subplot(SP(1))
                M_plot_surface_power(obj)           
                 MarkerSize1=2;
                hold on
                if isfield(obj.FrontSurface.Surface_Description,'xx1')
                    x1=obj.FrontSurface.Surface_Description.xx1;
                    y1=obj.FrontSurface.Surface_Description.yy1;
                   
                    plot(x1(:),y1(:),'.','MarkerSize',MarkerSize1)
                end
                 
           subplot(SP(2))
                M_plot_surface_cylinder(obj)
                hold on
                if exist('x1','var')
                 plot(x1(:),y1(:),'.','MarkerSize',MarkerSize1) 
                end
                
            subplot(SP(3))
               plot(obj.y,obj.Optimization_Control.F_Power(obj.y*0,obj.y),'LineWidth',2);
               hold on;
               plot(obj.y, obj.FrontSurface.PCA.p(round((size(obj.FrontSurface.PCA.p,1)-1)/2),:),'LineWidth',1)
               if exist('x1','var')
               plot(y1(1,:),obj.Optimization_Control.F_Power(0*y1(1,:),y1(1,:)),'.','MarkerSize',10) 
               end
               xlim([-obj.Optimization_Diameter/2 obj.Optimization_Diameter/2])
               xticks(-35:5:35)
               axis square
               legend('Target','Design','SplPoint','Location','NorthEast')
               title('Meridian Power')
              
               
           subplot(SP(5))
              [cc1,cc2]=contourf(obj.xx,obj.yy,obj.Optimization_Control.Target_Power-obj.Optimization_Control.Rx.sphere,obj.clevel);
              title('Power Targets')
                 clabel(cc1,'FontSize',5);
                 set(cc2,'LineStyle','-','linewidth',0.5,'Linecolor','k')
                 hold on
                 plot([obj.Coordinates.DRP_x, obj.Coordinates.NRP_x],[obj.Coordinates.DRP_y,obj.Coordinates.NRP_y],'k-','LineWidth',1.5);
                 caxis([-0.25,4.25]);
                 colormap(obj.colormap1);
                 colorbar('Ylim',[-0.25,4.25],'Ytick',[-0.25:0.25:4.25],...
                     'box','on');
                 axis square              
                 xlim([-obj.Blank_Diameter/2 obj.Blank_Diameter/2])
                 ylim([-obj.Blank_Diameter/2 obj.Blank_Diameter/2])   
            
            subplot(SP(6))
              [cc1,cc2]=contourf(obj.xx,obj.yy,obj.Optimization_Control.Target_Cyl,obj.clevel);
              title('Cylinder Targets')
                 clabel(cc1,'FontSize',5);
                 set(cc2,'LineStyle','-','linewidth',0.5,'Linecolor','k')
                 hold on
                 plot([obj.Coordinates.DRP_x, obj.Coordinates.NRP_x],[obj.Coordinates.DRP_y,obj.Coordinates.NRP_y],'k-','LineWidth',1.5);
                 caxis([-0.25,4.25]);
                 colormap(obj.colormap1);
                 colorbar('Ylim',[-0.25,4.25],'Ytick',[-0.25:0.25:4.25],...
                     'box','on');
                 axis square              
                xlim([-obj.Blank_Diameter/2 obj.Blank_Diameter/2])
                ylim([-obj.Blank_Diameter/2 obj.Blank_Diameter/2])   
            
           subplot(SP(11))
              contourf(obj.xx,obj.yy,obj.Optimization_Control.WT_Power);
              title('Power Weights')
              axis square
              colorbar
            subplot(SP(12))
              contourf(obj.xx,obj.yy,obj.Optimization_Control.WT_Cyl);
              title('Cylinder Weights')
              axis square
              colorbar
              
            subplot(SP(7))
                [gx,gy]=gradient(obj.FrontSurface.PCA.p,obj.delta_y,obj.delta_y);
                %    [gx,gy]=gradient(obj.Optimization_Control.Target_Power,obj.delta_y,obj.delta_y);
                outside_blankdiameter=(obj.xx.^2+obj.yy.^2)>((obj.Optimization_Diameter)/2)^2;
                gx(outside_blankdiameter)=NaN;
                gy(outside_blankdiameter)=NaN;
                if isfield(obj.Optimization_Control,'wt_gradientPower')
                   aa= (((gx.^2+gy.^2))).*obj.Optimization_Control.wt_gradientPower;
                else
                   aa= (((gx.^2+gy.^2))).*0; 
                end

                contourf(obj.xx,obj.yy,aa);
                aa(isnan(aa))=0;
                aa=sum(sum(aa));
                axis square
                title(['Pgradient ' num2str(sum(sum(aa)))])
                colorbar
                hold on
                x1=obj.xx(~outside_blankdiameter);
                y1=obj.yy(~outside_blankdiameter);               
                 plot(x1(:),y1(:),'.','MarkerSize',MarkerSize1) 

            subplot(SP(8))
                [gx,gy]=gradient(obj.FrontSurface.PCA.c,obj.delta_y,obj.delta_y);
                %    [gx,gy]=gradient(obj.Optimization_Control.Target_Power,obj.delta_y,obj.delta_y);
                outside_blankdiameter=(obj.xx.^2+obj.yy.^2)>((obj.Optimization_Diameter)/2)^2;
                gx(outside_blankdiameter)=NaN;
                gy(outside_blankdiameter)=NaN;
                
                 if isfield(obj.Optimization_Control,'wt_gradientCyl')
                    aa=(((gx.^2+gy.^2))).*obj.Optimization_Control.wt_gradientCyl;
                 else
                       aa=(((gx.^2+gy.^2))).*0;
                 end
                contourf(obj.xx,obj.yy,aa);
                aa(isnan(aa))=0;
                aa=sum(sum(aa));                
                       aa=sum(sum(aa));
                axis square
                
                title(['Cgradient '  num2str(sum(sum(aa)))])
                colorbar
                hold on              
                 plot(x1(:),y1(:),'.','MarkerSize',MarkerSize1)            
             
            
             subplot(SP(9))
                   
                 obj=M_FrontSurface_Metrics(obj)  ;
                 aa=(obj.Optimization_Control.Target_Power-obj.FrontSurface.PCA.p).^2.*obj.Optimization_Control.WT_Power ;
                 [cc1,cc2] = contourf(obj.xx,obj.yy,aa);
                 axis square
                 colorbar
                 title(['ErrF Power ' num2str(obj.metrics.MFpower)])
                hold on               
                 plot(x1(:),y1(:),'.','MarkerSize',MarkerSize1)                
             
             subplot(SP(10))
       
                filter_cyl_less_than_specified=(obj.Optimization_Control.Target_Cyl<0);
                aa=(((obj.Optimization_Control.Target_Cyl-obj.FrontSurface.PCA.c).^2.*obj.Optimization_Control.WT_Cyl)) ;       
                aa(filter_cyl_less_than_specified)=0;
                % aa=(obj.Optimization_Control.Target_Cyl-obj.FrontSurface.PCA.c).^2.*obj.Optimization_Control.WT_Cyl ;
                 [cc1,cc2] = contourf(obj.xx,obj.yy,aa);
 
                 axis square
                 title(['ErrF Cylinder ' num2str(obj.metrics.MFcyl )])
                 colorbar
                hold on              
                 plot(x1(:),y1(:),'.','MarkerSize',MarkerSize1)                 
             
             drawnow
        end
        
        function M_plot_surface_power(obj)
            obj.FrontSurface=M_PCA(obj.FrontSurface);
            p=obj.FrontSurface.PCA.p-obj.FrontSurface.Rx.sphere;
            bw_contour(obj.xx,obj.yy,p,obj);
            title(['Mean Power  errf = ' num2str(obj.Current_merit_function)])  
        end
        
        
        function M_plot_surface_cylinder(obj)
            obj.FrontSurface=M_PCA(obj.FrontSurface);          
             bw_contour(obj.xx,obj.yy,obj.FrontSurface.PCA.c,obj);
             title('cylinder')
        end        
        
    end    

end

    function bw_contour(xx,yy,zz,obj)
            outside_blankdiameter=(xx.^2+yy.^2)>((obj.Blank_Diameter)/2)^2;
            zz(outside_blankdiameter)=NaN;
            [cc1,cc2] = contourf(xx,yy,zz,obj.clevel);
              clabel(cc1,'FontSize',5);
              set(cc2,'LineStyle','-','linewidth',0.5,'Linecolor','k')            
            hold on
            plot([obj.Coordinates.DRP_x, obj.Coordinates.NRP_x],[obj.Coordinates.DRP_y,obj.Coordinates.NRP_y],'k-','LineWidth',1.5);
              caxis([-0.25,4.25]);
              colormap(obj.colormap1);            
            colorbar('Ylim',[-0.25,4.25],'Ytick',[-0.25:0.25:4.25],...
                'box','on');            
            axis square
            xlim([-obj.Blank_Diameter/2 obj.Blank_Diameter/2])
            ylim([-obj.Blank_Diameter/2 obj.Blank_Diameter/2])    
    end

