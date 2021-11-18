clc; close all; clear
a=sym('a');
b=sym('b');
c=sym('c');

Rzyx = rotz(a) * roty(b) * rotx(c)
Rxyz = rotx(a) * roty(b) * rotz(c)
Rxy = rotx(a) * roty(b)

Rxyz2 = rotx(c) * roty(b) * rotz(a)
%Rxyz = rotx(c) * roty(b)



theta_x = -23.0965+2;%+20
theta_y = 55.031;
theta_z = -12.1511;
    
theta_x = pi*theta_x/180;
theta_y = pi*theta_y/180;
theta_z = pi*theta_z/180;

rX = rotx(theta_x);
rY = roty(theta_y);
rZ = rotz(theta_z);

RVzyx = rZ * rY * rX;

%RVxy = rX * rY


% [V,D] = eig(RVzyx)
[U,S,V] = svd(RVzyx);

[Ve,De] = eig(RVzyx)

%X = U*S*V'.

V = V';
Xdisp1 = V(:,1)';
Ydisp1 = V(:,2)';
Zdisp1 = V(:,3)';

Xdisp1 = [0 0 0 ; Xdisp1];
Ydisp1 = [0 0 0 ; Ydisp1];
Zdisp1 = [0 0 0 ; Zdisp1];


plot3(Xdisp1(:,1), Xdisp1(:, 2), Xdisp1(:,3),'r'); hold on;
plot3(Ydisp1(:,1), Ydisp1(:, 2), Ydisp1(:,3),'g'); 
plot3(Zdisp1(:,1), Zdisp1(:, 2), Zdisp1(:,3),'b'); 
xlabel('x');
ylabel('y');
zlabel('z');

title('the right singular vectors (expression level vectors)');
grid on;
return;
    
%%

%
% svd(Rxy)

% Test with real numbers
lim = 90;
a = 0;
for i=0:0.1:lim
a = a + 1;
end

Xdisp = zeros(a, 3)';
Ydisp = zeros(a, 3)';
Zdisp = zeros(a, 3)';

a =1;
for i=0:0.1:lim
    
    theta_x = -23.0965+i;%+20
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

    RVzyx = rZ * rY * rX;
    %RVxy = rX * rY


    % [V,D] = eig(RVzyx)
    [U,S,V] = svd(RVzyx);
    
    Xdisp(:,a) = V(:,1);
    Ydisp(:,a) = V(:,2);
    Zdisp(:,a) = V(:,3);


    a = a+1;
end


Xdisp = Xdisp';
Ydisp = Ydisp';
Zdisp = Zdisp';

plot3(Xdisp(:,1),Xdisp(:,2),Xdisp(:,3),'ro');
hold on;
plot3(Ydisp(:,1),Ydisp(:,2),Ydisp(:,3),'go');
plot3(Zdisp(:,1),Zdisp(:,2),Zdisp(:,3),'bo');

% plot3(Xdisp(:,1),Xdisp(:,2),Xdisp(:,3),'bo-');

grid on;




