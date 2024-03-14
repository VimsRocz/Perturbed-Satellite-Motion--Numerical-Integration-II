% Compute position vector (r) and velocity vektor v 
% from Keplerelements to space fixed system
% 
% Input:    a       : semi-major axis a [km]
%           e       : numerical eccentricity e []
%           i       : inclination i [rad]
%           Omega   : right ascension of the ascending node [rad]
%           omega   : argument of perigee [rad]
%           M_0     : Where the satellite is in perigee [rad]
%           dt      : Time differenz [s]
%           mue     : GM [km^3/s^2]
% 
% Author:   Yannick Breva
%           2966280

function [r_ECI,v_ECI] = Kep2ECI(a,e,i,Omega,omega,M_0,dt,mue,d_omega,d_Omega,d_M)

r_ECI = [];
v_ECI = [];
E_t = [];

% Mean anomaly
M_t = M_0+ dt.*d_M;
p = a*(1-e^2);

% excentric anomaly
for j = 1:1:length(M_t)
    [E] = kepler_inet(e,M_t(j));
    E_t = [E_t;E];
end

% Correct Omega dot
Omega = (Omega+d_Omega) .* dt;
omega = (omega+d_omega) .* dt;

% True anomaly
f_t = 2 * atan2(sqrt(1+e).*sin(E_t./2),sqrt(1-e).*cos(E_t./2));
% f_t = atan2(sqrt(1+e).*sin(E_t),cos(E_t-e));

% Radius
r = p./(1+e.*cos(f_t));

% Calculate r_ECI v_ECI
tmp1 = r.*cos(f_t);
tmp2 = r.*sin(f_t);
tmp3 = -sqrt(mue/p).*sin(f_t);
tmp4 = sqrt(mue/p).*(e+cos(f_t));
r_vec = [tmp1, tmp2, zeros(length(tmp1),1)];
v_vec = [tmp3, tmp4, zeros(length(tmp3),1)];

for k = 1:1:length(Omega)
R_3_Om = [cos(-Omega(k)),-sin(-Omega(k)),0;
    sin(-Omega(k)),cos(-Omega(k)),0;
    0,0,1];

R_3_om = [cos(-omega(k)),-sin(-omega(k)),0;
    sin(-omega(k)),cos(-omega(k)),0;
    0,0,1];

R_1 = [1,0,0;
    0,cos(-i), -sin(-i);
    0,sin(-i),cos(-i)];


    r_ECI = [r_ECI, R_3_Om' * R_1' * R_3_om' * r_vec(k,:)'];
    v_ECI = [v_ECI, R_3_Om' * R_1' * R_3_om' * v_vec(k,:)'];
end

r_ECI = r_ECI';
v_ECI = v_ECI';
