function y_Prime = y_prim5ubMondind(t,y_0)

if size(y_0,1)
    y_0=y_0';
end

GMM=4902.8000;
GM=398600.44;
r=norm(y_0(4:6));
r_mond=[0;352518;153279]';
a_erde=6378.1364;

K2=0.3;

Psi=dot(r_mond,y_0(4:6))/(norm(r_mond)*r);
P2=3*Psi;
P3=(3/2)*(5*Psi^2-1);

indirekt=K2 *a_erde^5/r^4* (GMM/(norm(r_mond)^3))* ( P2 *(r_mond/norm(r_mond))-P3*(y_0(4:6)/norm(y_0(4:6))));

y_Prime(1:3) = -GM/r^3 * y_0(4:6) + indirekt;% y_Prime(2) = -GM/r^3 * y;
% y_Prime(3) = -GM/r^3 * z;
y_Prime(4) = y_0(1);
y_Prime(5) = y_0(2);
y_Prime(6) = y_0(3);

y_Prime=y_Prime';
end

