clc; close all; clear;
d = 30;
d = pi*d / 180;
A = rotz(d);

a = [cos(d) -sin(d); sin(d) cos(d)];

[V1 D1] = eig(A);
[V2 D2] = eig(a);

V2
figure;

 plot(real(V2),imag(V2),'r*') %   Plot real and imaginary parts
     xlabel('Real')
     ylabel('Imaginary')
grid;