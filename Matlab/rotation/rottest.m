clc; clear; close all;
% http://math.stackexchange.com/questions/319642/special-values-for-3d-rota
% tions-matrices?rq=1
gamma =  18.651;
beta  = -28.063;
alpha = -4.7;

% 
gamma =-31.947;
beta = 29.248;
alpha = -8.543;
% 
% 
alpha   = 7.417;
beta    = -26.150;
gamma   = -31.186;
% % 
% 
% alpha   = 7.417;
% beta    = -26.150;
% gamma   = -31.186;
% 

alpha = pi*alpha/180;
beta = pi*beta/180;
gamma = pi*gamma/180;

rX = rotx(gamma);
rY = roty(beta);
rZ = rotz(alpha);

H0 = rZ*rY*rX

[vx dx] = eig(rX);
[v d] = eig(H0)

