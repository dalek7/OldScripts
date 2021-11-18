clc; clear; close all;



sn_x = 0.56;
sn_y = 0.12;
sn_z = 0.82;

sn_len = sqrt(sn_x*sn_x + sn_y*sn_y + sn_z*sn_z);
sn_x = sn_x / sn_len;
sn_y = sn_y / sn_len;
sn_z = sn_z / sn_len;

theta_x = -8.312;%12.31;
theta_y = 33.868;%45.59;
theta_z = -2.535;%5.19;

theta_x = pi*theta_x/180;
theta_y = pi*theta_y/180;
theta_z = pi*theta_z/180;

rX = rotx(theta_x);
rY = roty(theta_y);
rZ = rotz(theta_z);

rotaxis = [ -sn_y, sn_x, 0];
rotaxis_len  = sqrt(sn_y*sn_y + sn_x*sn_x);%norm(rotaxis);
rotaxis = rotaxis/rotaxis_len;
% Z-Y-X Euler angles -- craig p. 43
R0 = rZ * rY * rX 

zero3 = [0,0,0];
snv   = [sn_x, sn_y, sn_z];
snvv = [zero3; snv];

zero3 = [0,0,0];
snz   = [0,0,1];

snzv = [zero3; snz];

rotaxisv =  [zero3; rotaxis];


%% DRAW A CIRCLE FOR DISPLAYING SURFACE !!
theta_c = [0:2*pi/32:2*pi];
x_c = cos(theta_c);
y_c = sin(theta_c);
z_c = zeros(1,length(y_c));


%% Figure
figure;
% plot3( snvv(:,1), snvv(:,2), snvv(:,3)); hold on;
% plot3( rotaxisv(:,1), rotaxisv(:,2), rotaxisv(:,3),'r');
quiver3( 0,0,0,snv(1), snv(2), snv(3),'b');hold on;
quiver3( 0,0,0,snz(1), snz(2), snz(3),'k');hold on;
quiver3( 0,0,0,rotaxis(1), rotaxis(2), rotaxis(3),'r');hold on;




plot3( x_c, y_c, z_c,'m');
grid on;

% axis([0 1 0 1 0 1]);
xlabel('X');ylabel('Y');zlabel('Z');
view(17,36);
view(-14,40);

