function [z,dz,ddz] = BW_Asphere(power_coefficients,r)
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
z=0;
dz=0;
ddz=0;
rp=r;
    for ii=1:length(power_coefficients)
     
       z=z+power_coefficients(ii).*rp    ;
       rp=rp.*r;
       %dz=dz+power_coefficients(ii).*(ii).*r.^(ii-1)    ;
       %if ii>1
        %ddz=ddz+power_coefficients(ii).*(ii-1).*ii.*r.^(ii-2)    ;       
       %end
    end
end

