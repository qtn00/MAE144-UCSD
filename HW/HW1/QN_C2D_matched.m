function [Dz] = QN_C2D_matched(Ds,h,omega)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
m=Ds.num.n; n=Ds.den.n;

for j = 1:m 
    zN = exp(Ds.z(j)*h);
%     pregainnum(j) = 1 -zN;
    zNum(j) = zN;
end
for i = 1:n
    zD = exp(Ds.p(i)*h);
%     pregainden(i) = 1 - zD;
    zDen(i) = zD;
end
b = RR_poly(zNum);
a = RR_poly(zDen);
k = 1;
Dz = RR_tf(b,a,k);
end