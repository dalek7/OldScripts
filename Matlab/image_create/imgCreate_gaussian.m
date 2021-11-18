clc; clear; close all;

w = 1280;
h = 800;
A = zeros(h,w, 3);

A(1,1,1) = 1;
% for i=1:w
%     %v = i  / w;
%     v = sigmoid(0.06, i, w/2);
%     A(:,i,:) = v;
% end
% ms = [
% 28, 98, 159, 225, 295, 364, 428, 500, 566, 630, 699, 758, 827, 896, 962, 1028, 1102, 1164, 1237
% ];
ms = [
97, 232, 368, 505, 638, 773, 908, 1040, 1170
];

sd = 20;
B = A;
Ap  =  [0: w-1];
for i=1:h
    %A(i,:,1)
    r =0;
    for j= 1:length(ms)
        r = r + gaussian(Ap, ms(j), sd);
    end
    r = r/max(r);
    
    
    B(i ,:,1) = 1-r;
    B(i ,:,2) = 1-r;
    B(i ,:,3) = 1-r;
%     B(: ,i,1) = r;
%     B(: ,i,2) = r;
%     B(: ,i,3) = r;
    
%     B(i,i,:) = r;
end

B =  B / max(max(max(B)));
% surf(B(:,:,1))
% image(B);
fn = strcat('../gaussian_sd',num2str(sd),'.png');

imwrite(B, fn, 'PNG');


return;
C = B;
x = [1:w];
m= w/2;
sig = w/10.0;
g = 512;
y   = 512-g*gaussian(x, m, sig);

dis = ones(size(y));
lim = 2.5;
for i=1:length(y)
   xi = x(i);
   if xi< m - lim*sig || xi> m + lim*sig
       dis(i) = g-0;
   else
       dis(i) = g-g;
   end
end




image(C);
return;
hold on;
plot(x,y,'r');
plot(x,dis,'b');
legend('S1','S3');
% axis([0 w -5 h+5])


