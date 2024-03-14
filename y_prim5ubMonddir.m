function y_Prime = y_prim5ubMonddir(t,y_0)

if size(y_0,1)
    y_0=y_0';
end

GMM=4902.8;
GM=398600.44;
r=norm(y_0(4:6));
r_mond=[0;352518;153279]';

y_Prime(1:3) = -GM/r^3 * y_0(4:6) +GMM*((r_mond-y_0(4:6))/(norm(r_mond-y_0(4:6))^3) -r_mond/norm(r_mond)^3);
% y_Prime(2) = -GM/r^3 * y;
% y_Prime(3) = -GM/r^3 * z;
y_Prime(4) = y_0(1);
y_Prime(5) = y_0(2);
y_Prime(6) = y_0(3);

y_Prime=y_Prime';
end