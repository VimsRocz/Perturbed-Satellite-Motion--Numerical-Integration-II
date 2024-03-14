function y_Prime = y_prim5ubSonnedir(t,y_0)

if size(y_0,1)
    y_0=y_0';
end

GMS=1.327*10^11;
GM=398600.44;
r=norm(y_0(4:6));
r_Sonne=[0;137.559*10^6;60*10^6]';

y_Prime(1:3) = -GM/r^3 * y_0(4:6) +GMS*((r_Sonne-y_0(4:6))/(norm(r_Sonne-y_0(4:6))^3) -r_Sonne/norm(r_Sonne)^3);
% y_Prime(2) = -GM/r^3 * y;
% y_Prime(3) = -GM/r^3 * z;
y_Prime(4) = y_0(1);
y_Prime(5) = y_0(2);
y_Prime(6) = y_0(3);

y_Prime=y_Prime';
end