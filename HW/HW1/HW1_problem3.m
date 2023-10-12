syms z1 p1
Ds = RR_tf([1 1],[1 10 0]);
h =1/100; 
omega = 1; 
Dz = QN_C2D_matched(Ds,h,omega)
%%
Ds_matlab = tf([1 1],[1 10 0]);
Dz_matlab = c2d(Ds_matlab,1/100,'matched')

%%
function [Dz] = QN_C2D_matched(Ds,h,omega)
% The function transform the continuous time function to discreet time
% function that taking symbolic variable
%   Ds: the continuous time transfer function.
%   h: period of time
%   omega: rad/s 

m=Ds.num.n; n=Ds.den.n;

for g = 1:m 
    zN = exp(Ds.z(g)*h);  
    zNum(g) = zN;
end
for i = 1:n
    zD = exp(Ds.p(i)*h);
    zDen(i) = zD;
end


b = RR_poly(zNum,1);
a = RR_poly(zDen,1);
ksu =1;
kzu =1;
ksd =1;
kzd =1;
for g =1:m
    ksu = ksu*(j*omega -Ds.z(g));
    kzu = kzu*(exp(j*omega*h) - zNum(g));
end
for i = 1:n 
    ksd = ksd*(j*omega-Ds.p(i));
    kzd = kzd*(exp(j*omega*h) -zDen(i));
end
k = abs((ksu/ksd)/(kzu/kzd));
Dz = RR_tf(zNum,zDen,k); 
end