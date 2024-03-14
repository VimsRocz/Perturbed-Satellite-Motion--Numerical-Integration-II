%% Satellite orbit calculation
% Exersice 5

%%
clc
clear all
close all
format long g

%% Task 1
%% From 2 exersice analytical Integration
c_20 = -0.00108263;
a_c = 6838.000;
e = 0.000;
a_e = 6378;
i = 90*pi/180;
GM = 398600.440;
n = sqrt(GM/a_c^3);
P=2*pi*sqrt(a_c^3/GM);
dt = [1:1:P]';
M_0 = 0;
Omega = 0;
omega = 0;
omega_e = 2 * pi / 86164;
y_0 = [0,0,sqrt(GM/6838),6838,0,0];

% Calculate secular perturbations
d_omega = (3*n*c_20*a_e^2)/(4*(1-e^2)^2*a_c^2) * (1-5*cos(i)^2);
d_Omega = (3*n*c_20*a_e^2)/(2*(1-e^2)^2*a_c^2) * cos(i);
d_M = n - (3*n*c_20*a_e^2)/(4*(1-e^2)^(3/2)*a_c^2) * (3* cos(i)^2-1);

[r_ECI_p,v_ECI_p] = Kep2ECI(a_c,e,i,Omega,omega,M_0,dt,GM,d_omega,d_Omega,d_M);

%% numerical Integration Moon
%direct
[t,y_md]=ode45('y_prim5ubMonddir',dt,y_0,odeset('MaxStep',1 ),'RelTol', 10^-11, 'AbsTol', 10^-12);

%indirect
[t,y_mi]=ode45('y_prim5ubMondind',dt,y_0,odeset('MaxStep',1 ),'RelTol', 10^-11, 'AbsTol', 10^-12);

%% numerical Integration Sun
%direct
[t,y_sd]=ode45('y_prim5ubSonnedir',dt,y_0,odeset('MaxStep',1 ),'RelTol', 10^-11, 'AbsTol', 10^-12);

%indirect
[t,y_si]=ode45('y_prim5ubSonneind',dt,y_0,odeset('MaxStep',1 ),'RelTol', 10^-11, 'AbsTol', 10^-12);

%% Plots
figure(1)
plot(dt(1:end-1)/60/60,r_ECI_p(1:end-1,1)-y_md(2:end,4),'b','Linewidth',2)
hold on
plot(dt(1:end-1)/60/60,r_ECI_p(1:end-1,1)-y_mi(2:end,4),'r','Linewidth',2)
hold on
plot(dt(1:end-1)/60/60,r_ECI_p(1:end-1,1)-y_sd(2:end,4),'g','Linewidth',2)
hold on
plot(dt(1:end-1)/60/60,r_ECI_p(1:end-1,1)-y_si(2:end,4),'k','Linewidth',2)