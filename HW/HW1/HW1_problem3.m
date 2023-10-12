syms z1 p1
Ds = RR_tf([1 1],[1 10 0])
m=Ds.num.n; n=Ds.den.n;
h =1/100;

for j = 1:m 
    zN = exp(Ds.z(j)*h);
    pregainnum(j) = 1 -zN;
    zNum(j) = zN;
end
for i = 1:n
    zD = exp(Ds.p(i)*h);
    pregainden(i) = 1 - zD;
    zDen(i) = zD;
end

zgain = prod(pregainnum) / prod(pregainden);
k = 1/zgain;
Dz = RR_poly(zNum,k) / RR_poly(zDen)


% Ds = tf([1 1],[1 10 0]);
% Dz = c2d(Ds,1/100,'matched')