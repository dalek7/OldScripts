clc; clear; close all;

v0 = [0;0;1];

ptx = 0;
pty = 0;
ptz = 0;
ds = 15;
figure;
for i=0:ds:90
    for j=0:ds:90
        for k=0:ds:90
        theta_x = i;%12.31;
        theta_y = j;%45.59;
        theta_z = k;%5.19;

        theta_x = pi*theta_x/180;
        theta_y = pi*theta_y/180;
        theta_z = pi*theta_z/180;


        rX = rotx(theta_x);
        rY = roty(theta_y);
        rZ = rotz(theta_z);


        R1 = rX * rY * rZ;
        R2 = rZ * rY * rX;


        R1_c1 = R1(:,1)';
        R1_c2 = R1(:,2)';
        R1_c3 = R1(:,3)';

        R2_c1 = R2(:,1)';
        R2_c2 = R2(:,2)';
        R2_c3 = R2(:,3)';

        P = [ptx pty ptz; ptx pty ptz;ptx pty ptz];
        P2 = P;%+0.01;
        R1T = R1';
        R2T = R2';

        ptx = i/ds;
        pty = j/ds;
        ptz = k/ds;

        
        %quiver3(P(1,1),P(1,2),P(1,3),R1T(1,1),R1T(1,2),R1T(1,3),'r');hold
        %on
        %quiver3(P(2,1),P(2,2),P(2,3),R1T(2,1),R1T(2,2),R1T(2,3),'g');
        quiver3(P(3,1),P(3,2),P(3,3),R1T(3,1),R1T(3,2),R1T(3,3),'b');hold on

        %quiver3(P2(1,1),P2(1,2),P2(1,3),R2T(1,1),R2T(1,2),R2T(1,3),'m:');
        %quiver3(P2(2,1),P2(2,2),P2(2,3),R2T(2,1),R2T(2,2),R2T(2,3),'g:');
        quiver3(P2(3,1),P2(3,2),P2(3,3),R2T(3,1),R2T(3,2),R2T(3,3),'r');
    end
    end
end

axis equal;

xlabel('x');
ylabel('y');
zlabel('z');

title('Coplanarity');
% R1 =
% 
%     0.6969   -0.0633    0.7144
%     0.2401    0.9592   -0.1492
%    -0.6758    0.2755    0.6837
% 
% 
% R2 =
% 
%     0.6969    0.0633    0.7144
%     0.0633    0.9868   -0.1492
%    -0.7144    0.1492    0.6837



