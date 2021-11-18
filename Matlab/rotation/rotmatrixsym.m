clc; close all; clear
a=sym('a');
b=sym('b');
c=sym('c');

Rzyx = rotz(a) * roty(b) * rotx(c)
Rxyz = rotx(a) * roty(b) * rotz(c)
Rxy = rotx(a) * roty(b)

Rxyz2 = rotx(c) * roty(b) * rotz(a)
%Rxyz = rotx(c) * roty(b)

%%

%
% svd(Rxy)

% Test with real numbers
theta_x = -23.0965;%+20
theta_y = 55.031;
theta_z = -12.1511;

% theta_x = -8.312;%12.31;
% theta_y = 33.868;%45.59;
% theta_z = -2.535;%5.19;

theta_x = pi*theta_x/180;
theta_y = pi*theta_y/180;
theta_z = pi*theta_z/180;

rX = rotx(theta_x);
rY = roty(theta_y);
rZ = rotz(theta_z);



RVzyx = rZ * rY * rX
RVxy = rX * rY


% [V,D] = eig(RVzyx)
[U,S,V] = svd(RVzyx)





return;
%%
nx=sym('nx');
ny=sym('ny');
nz=sym('nz');




v1 = [0,0,1];
v2 = [nx, ny, nz];
v = cross(v1, v2)
