function [z,p]=BW_Meridian_Profile_1(y,add,add_profile_shape_factor,mid_point_fraction,y0,NRP_y,off_edge_y)

if off_edge_y>NRP_y
    y0=-y0;
    NRP_y=-NRP_y;
    off_edge_y=-off_edge_y;
    y=-y;
end
ADD=add;
add=1;
if add==0
    add=.01;
end
    z=zeros(1,length(y));
    p=zeros(1,length(y));
L1=(y0-NRP_y);
L2=(NRP_y-off_edge_y);
    u=@(NRP_y,y,y0) (y-y0)./L1;
c0=@()0.0;
c1=@()0.0;
c2=@()0.0;
c4=@(add,add_profile_shape_factor,mid_point_fraction)(add.*2.9e+1-mid_point_fraction.*1.28e+2+add.*add_profile_shape_factor.*5.0)./add;
c5=@(add,add_profile_shape_factor,mid_point_fraction)((add.*3.6e+1-mid_point_fraction.*1.28e+2+add.*add_profile_shape_factor.*3.0).*3.0)./add;
c6=@(add,add_profile_shape_factor,mid_point_fraction)(add.*1.22e+2-mid_point_fraction.*3.84e+2+add.*add_profile_shape_factor.*7.0)./add;
c7=@(add,add_profile_shape_factor,mid_point_fraction)((add.*2.2e+1-mid_point_fraction.*6.4e+1+add.*add_profile_shape_factor).*2.0)./add;
sag=@(u,add,add_profile_shape_factor,c0,c1,c2,c4,c5,c6,c7) ADD*(add.*add_profile_shape_factor.*u.^5.*(-1.0./2.0e+1)-(add.*c0.*u.^2)./2.0-(add.*c1.*u.^3)./6.0-(add.*c2.*u.^4)./1.2e+1-(add.*c4.*u.^6)./3.0e+1-(add.*c5.*u.^7)./4.2e+1-(add.*c6.*u.^8)./5.6e+1-(add.*c7.*u.^9)./7.2e+1)*L1.^2;
power=@(u,add,add_profile_shape_factor,c0,c1,c2,c4,c5,c6,c7)-ADD*add.*(c0+c1.*u+add_profile_shape_factor.*u.^3+c2.*u.^2+c4.*u.^4+c5.*u.^5+c6.*u.^6+c7.*u.^7);
slope=@(u,add,add_profile_shape_factor,c0,c1,c2,c4,c5,c6,c7) ADD*(-add.*c0.*u-(add.*add_profile_shape_factor.*u.^4)./4.0-(add.*c1.*u.^2)./2.0-(add.*c2.*u.^3)./3.0-(add.*c4.*u.^5)./5.0-(add.*c5.*u.^6)./6.0-(add.*c6.*u.^7)./7.0-(add.*c7.*u.^8)./8.0)*L1;

    z=sag(u(NRP_y,y,y0),add,add_profile_shape_factor,c0(),c1(),c2(),c4(add,add_profile_shape_factor,mid_point_fraction),c5(add,add_profile_shape_factor,mid_point_fraction),c6(add,add_profile_shape_factor,mid_point_fraction),c7(add,add_profile_shape_factor,mid_point_fraction));
    p=power(u(NRP_y,y,y0),add,add_profile_shape_factor,c0(),c1(),c2(),c4(add,add_profile_shape_factor,mid_point_fraction),c5(add,add_profile_shape_factor,mid_point_fraction),c6(add,add_profile_shape_factor,mid_point_fraction),c7(add,add_profile_shape_factor,mid_point_fraction));
    sag_at_nrp1=sag(u(NRP_y,NRP_y,y0),add,add_profile_shape_factor,c0(),c1(),c2(),c4(add,add_profile_shape_factor,mid_point_fraction),c5(add,add_profile_shape_factor,mid_point_fraction),c6(add,add_profile_shape_factor,mid_point_fraction),c7(add,add_profile_shape_factor,mid_point_fraction));
    slope_at_nrp1=slope(u(NRP_y,NRP_y,y0),add,add_profile_shape_factor,c0(),c1(),c2(),c4(add,add_profile_shape_factor,mid_point_fraction),c5(add,add_profile_shape_factor,mid_point_fraction),c6(add,add_profile_shape_factor,mid_point_fraction),c7(add,add_profile_shape_factor,mid_point_fraction));

    c6=0;%@(add,c6,c7)-(-add.*c6+add.*c7.*3.0+1.0e+1)./add;
    c7=0;%@(add,c6,c7)-(add.*c6.*-3.0+add.*c7.*8.0+1.5e+1)./add;
    u=@(NRP_y,off_edge_y,y)-(NRP_y-y)./L2;
c0=@()-1.0;
c1=@()0.0;
c2=@()0.0;
c3=@(c6,c7)c6-c7.*3.0-1.0e+1;
c4=@(c6,c7)c6.*3.0-c7.*8.0-1.5e+1;
c5=@(c6,c7)c6.*3.0-c7.*6.0-6.0;

slope_at_nrp1=slope_at_nrp1/L2;
sag_at_nrp1=sag_at_nrp1/L2.^2;
sag=@(u,add,c0,c1,c2,c3,c4,c5,c6,c7,sag_0,slope_0) (sag_0+slope_0.*u-(ADD*add.*c0.*u.^2)./2.0-(ADD*add.*c1.*u.^3)./6.0-(ADD*add.*c2.*u.^4)./1.2e+1-(ADD*add.*c3.*u.^5)./2.0e+1-(ADD*add.*c4.*u.^6)./3.0e+1-(ADD*add.*c5.*u.^7)./4.2e+1-(ADD*add.*c6.*u.^8)./5.6e+1-(ADD*add.*c7.*u.^9)./7.2e+1)*L2^2;
power=@(u,add,c0,c1,c2,c3,c4,c5,c6,c7) -ADD*add.*(c0+c1.*u+c2.*u.^2+c3.*u.^3+c4.*u.^4+c5.*u.^5+c6.*u.^6+c7.*u.^7);


    z(y<NRP_y)=sag(u(NRP_y,off_edge_y,y(y<NRP_y)),add,c0(),c1(),c2(),c3(c6,c7),c4(c6,c7),c5(c6,c7),c6,c7,sag_at_nrp1,slope_at_nrp1);
    p(y<NRP_y)=power(u(NRP_y,off_edge_y,y(y<NRP_y)),add,c0(),c1(),c2(),c3(c6,c7),c4(c6,c7),c5(c6,c7),c6,c7);

end