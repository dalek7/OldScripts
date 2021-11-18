clc; clear; close all;

theta_x = -10.51;%12.31;
theta_y = 39.37;%45.59;
theta_z = -3.77;%5.19;


theta_x = 12.31;
theta_y = 45.59;
theta_z = 5.19;

theta_x = pi*theta_x/180;
theta_y = pi*theta_y/180;
theta_z = pi*theta_z/180;

hX = trotx(theta_x);
hY = troty(theta_y);
hZ = trotz(theta_z);

rX = rotx(theta_x);
rY = roty(theta_y);
rZ = rotz(theta_z);


T1 = hX * hY * hZ;
T2 = hZ * hY * hX;

% Z-Y-X Euler angles -- craig p. 43
R0 = rZ * rY * rX 

% Z-Y-X Euler angles -- craig p. 43
R0xy = rY * rX


R1 = rX * rY * rZ
R1xy = rX * rY


v0 = [0;0;1];


R1_c1 = R1(:,1)';
R1_c2 = R1(:,2)';
R1_c3 = R1(:,3)';

R1xy_c1 = R1xy(:,1)';
R1xy_c2 = R1xy(:,2)';
R1xy_c3 = R1xy(:,3)';

% 
% R0_c1 = R0(:,1)';
% R0_c2 = R0(:,2)';
% R0_c3 = R0(:,3)';

P0 = [0 0 0; 0 0 0;0 0 0];
P1 = P0+0.01;

R1T = R1';
R0T = R0';
%R0xyT = R0xy';
R1xyT = R1xy';

[V0,D0] = eig(R0)
[V1,D1] = eig(R1)

% [U0,S0,V0] = svd(R0);
% [U1,S1,V1] = svd(R1);
% 
% ret_R0 = V0*U0';
% ret_R1 = V1*U1';

figure;
quiver3(P1(1,1),P1(1,2),P1(1,3),R1T(1,1),R1T(1,2),R1T(1,3),'r');hold on
quiver3(P0(1,1),P0(1,2),P0(1,3),R0T(1,1),R0T(1,2),R0T(1,3),'r:');hold on
quiver3(P1(1,1),P1(1,2),P1(1,3),R1xyT(1,1),R1xyT(1,2),R1xyT(1,3),'r--');hold on
quiver3(P1(2,1),P1(2,2),P1(2,3),R1T(2,1),R1T(2,2),R1T(2,3),'g');
quiver3(P1(3,1),P1(3,2),P1(3,3),R1T(3,1),R1T(3,2),R1T(3,3),'b');

% quiver3(P0(1,1),P0(1,2),P0(1,3),R0T(1,1),R0T(1,2),R0T(1,3),'r:');hold on
quiver3(P0(2,1),P0(2,2),P0(2,3),R0T(2,1),R0T(2,2),R0T(2,3),'g:');
quiver3(P0(3,1),P0(3,2),P0(3,3),R0T(3,1),R0T(3,2),R0T(3,3),'b:');
% 
% 
% quiver3(P1(1,1),P1(1,2),P1(1,3),R1xyT(1,1),R1xyT(1,2),R1xyT(1,3),'r--');hold on
quiver3(P1(2,1),P1(2,2),P1(2,3),R1xyT(2,1),R1xyT(2,2),R1xyT(2,3),'g--');
quiver3(P1(3,1),P1(3,2),P1(3,3),R1xyT(3,1),R1xyT(3,2),R1xyT(3,3),'b--');
% 
% legend('R_ZYX','','', 'R_XYZ', 'R_XY');
legend('R_{ZYX}','R_{XYZ}', 'R_{XY}');
view(158, 26);

% quiver3(P0(1,1),P0(1,2),P0(1,3),R0xtT(1,1),R0xtT(1,2),R0xtT(1,3),'m:');hold on
% quiver3(P0(2,1),P0(2,2),P0(2,3),R0xtT(2,1),R0xtT(2,2),R0xtT(2,3),'m');
% quiver3(P0(3,1),P0(3,2),P0(3,3),R0xtT(3,1),R0xtT(3,2),R0xtT(3,3),'m');




axis equal;

xlabel('x');
ylabel('y');
zlabel('z');
% 
% theta_x = -10.51;%12.31;
% theta_y = 39.37;%45.59;
% theta_z = -3.77;%5.19;

title('Coplanarity : \theta_x = -10.51 \theta_y = 39.37  \theta_z = -3.77');
% R1 =
% 
%     0.6969   -0.0633    0.7144
%     0.2401    0.9592   -0.1492
%    -0.6758    0.2755    0.6837
% 
% 
% R0 =
% 
%     0.6969    0.0633    0.7144
%     0.0633    0.9868   -0.1492
%    -0.7144    0.1492    0.6837



