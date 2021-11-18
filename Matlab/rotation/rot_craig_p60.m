alpha = 10;
beta = 20;
gamma = 30;


alpha = pi*alpha/180;
beta = pi*beta/180;
gamma = pi*gamma/180;

rX = rotx(gamma);
rY = roty(beta);
rZ = rotz(alpha);


H0 = rZ*rY*rX
H0_inv = inv(H0)

