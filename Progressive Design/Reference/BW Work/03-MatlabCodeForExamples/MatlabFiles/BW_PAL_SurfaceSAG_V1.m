function [sag] = BW_PAL_SurfaceSAG_V1(SURF,x,y)
%PAL_type6 DEFINE SURFACE SAG FOR PAL
%   Detailed explanation goes here
% SURF.SAG_Function_Name='BW_PAL_SurfaceSAG_V1';
% SURF.index=index;
% SURF.sphere = 5.75;
% SURF.k = 5.5;
% SURF.mid_point_fraction = .5;
% SURF.add_profile_shape_factor = 0;
% SURF.add = 2.25;
% SURF.y0 = 4;
% SURF.NRP_y = -21;
% SURF.off_edge_y = -45;
% SURF.cx2(1,:) = [2      0        -40     10 0 0 0 0 0 0 0 0];
% SURF.cx2(2,:) = [2      0         40     10 0 0 0 0 0 0 0 0];
%                 x^2     ymin      ymax   10r^3 
%      SURF.F =  griddedInterpolant
%%
% base power.  This defines the base asphericity over entire suface
r=(sqrt(x.^2+y.^2));
sag=  BW_Asphere_1D(SURF.sphere/1000,SURF.k,r)*1e3/(SURF.index-1);% % this gets the base  power



bottom1=@(y) (y<=SURF.y0) ;
[z,p]=BW_Meridian_Profile_1(y,SURF.add,SURF.add_profile_shape_factor,SURF.mid_point_fraction,SURF.y0,SURF.NRP_y,SURF.off_edge_y);
z=z.*bottom1(y);  % wavefront along merdian.  limited to lower portion of lens below SURF.y0,
p=p.*bottom1(y);  % power along merdian. 
sag=sag+  z/(SURF.index-1);%SURF.add*power1(y,u1)/(SURF.index-1)*x.^2;
sag = sag+ p.*x.^2;   % this forces cyl=0 along meridian
if isfield(SURF,'F')  %isfield(PAL.SURF,'F')  F is defined using .F=griddedInterpolant(xx,yy,sag) and is added as delta onto definitions from base curve,cx1,cx2
    %
    if (length(x)==1) || ~isfield(SURF,'SmoothingParameter')
        sag=sag+SURF.F(x,y);
    else        
	   sag=sag+csaps({x(:,1),y(1,:)},SURF.F(x,y),SURF.SmoothingParameter,{x(:,1),y(1,:)});
%         sag=sag+SURF.F(x,y);
    end
end
    if isfield(SURF,'cx1')  % never used this.  
        for ii=1:size(SURF.cx1,1)
            [~,p]=BW_Meridian_Profile_1(y,SURF.cx1(ii,2),SURF.cx1(ii,3),SURF.cx1(ii,4),SURF.cx1(ii,5),SURF.cx1(ii,6),SURF.cx1(ii,7));
            p=p.*(y<=SURF.cx1(ii,5)).*(y>=SURF.cx1(ii,7));
            sag=sag+ p.*(x/30).^SURF.cx1(ii,1);
        end
    end

    if isfield(SURF,'cx2')
        for ii=1:size(SURF.cx2,1)
            meridian=@(y) BW_Asphere([0 0 SURF.cx2(ii,3:end)],abs(y)/30) ;   % =0*r + 0*r^2 + cs2(ii,3)*r^3 + cs2(ii,4)*r^4 + ...  (r/30)
            if SURF.cx2(ii,2)<SURF.cx2(ii,3)  
               filter1=(y>=SURF.cx2(ii,2)).*(y<=SURF.cx2(ii,3));
            else
               filter1=(y<=SURF.cx2(ii,2)).*(y>=SURF.cx2(ii,3));
            end            
            p=meridian((y-SURF.cx2(ii,2)).*filter1);
            sag=sag+ p.*(x/30).^SURF.cx2(ii,1);
        end
    end
    
    
 % if 0
%     %%
% yy=-35:.1:1;
% [z,p]=BW_Meridian_Profile_1(yy,SURF.add,SURF.add_profile_shape_factor,SURF.mid_point_fraction,SURF.y0,SURF.NRP_y,SURF.off_edge_y);
% [~,p1]=BW_Meridian_Profile_1(yy,SURF.c4(1),SURF.c4(2),SURF.c4(3),SURF.c4(4),SURF.c4(5),SURF.c4(6));
%  figure(8838);
%     subplot(1,2,1)
%         plot(yy,p.*(yy<=SURF.y0))   
%         hold on
%         plot(yy(2:end-1),diff(diff(z)/.1)/.1,'.')
%              plot(yy,p1.*(yy<=SURF.y0))   
%         ylim([-.5 2.5])
%     subplot(1,2,2)
%         plot(yy,z.*(yy<=SURF.y0))   
%         hold on        
% end

 

        
end


