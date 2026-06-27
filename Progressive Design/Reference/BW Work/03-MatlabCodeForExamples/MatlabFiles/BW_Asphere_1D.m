function [z] = BW_Asphere_1D(c,k,r,even_power_coefficients)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
  z=(c*r.^2)./(1+sqrt(1-(1+k)*c^2*r.^2))  ;
  if nargin ==4
    for ii=1:length(even_power_coefficients)
       z=z+even_power_coefficients(ii).*r.^(ii*2)    ;
    end
  end
end

