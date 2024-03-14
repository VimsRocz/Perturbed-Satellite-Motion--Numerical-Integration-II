function y_Prime = y_prim5ubSonneind(t,y_0)

if size(y_0,1)
    y_0=y_0';
end

GMS=132700000000;
GM=398600.44;
r=norm(y_0(4:6));
r_sonne=[0;137.559*10^6;60*10^6]';
a_erde=6378.1364;

K2=0.3;

Psi=dot(r_sonne,y_0(4:6))/(norm(r_sonne)*norm(y_0(4:6)));
P2=3*Psi;
P3=(3/2)*(5*Psi^2-1);

indirekt=K2 *a_erde^5/r^4* (GMS/(norm(r_sonne)^3))* ( P2 *(r_sonne/norm(r_sonne))-P3*(y_0(4:6)/norm(y_0(4:6))));

y_Prime(1:3) = -GM/r^3 * y_0(4:6) + indirekt;%K2 *a_erde^5/r^4* (GMS/(norm(r_sonne)^3))* ( P2 *(y_0(4:6)/r)-P3*(r_sonne/norm(r_sonne)));
% y_Prime(2) = -GM/r^3 * y;
% y_Prime(3) = -GM/r^3 * z;
y_Prime(4) = y_0(1);
y_Prime(5) = y_0(2);
y_Prime(6) = y_0(3);

y_Prime=y_Prime';
end

