

clc; close all; clear
w=sym('w');
x=sym('x');
y=sym('y');
z=sym('z');


%%

R2 = [w^2 + x^2 - y^2, 2*x*y, 2*w*y ;
2*x*y,     w^2 - x^2 + y^2, -2*w*x;
-2*w*y, 2*w*x, w^2-x^2 - y^2
];


[V2,D2] = eig(R2)


%% 
R1 = [w^2 + x^2 - y^2 - z^2, 2*x*y - 2*w*z, 2*x*z+2*w*y ;
2*x*y + 2*w*z,     w^2 - x^2 + y^2 - z^2, -2*w*x+ 2*y*z ;
%2*x*y + 2*w*z,     w^2 - x^2 + y^2 - z^2, 2*y*z -2*w*x;
-2*w*y+2*x*z , 2*y*z + 2*w*x, w^2-x^2 - y^2 + z^2
];
[V1,D1] = eig(R1)


%[V,D] = eig(R1)

