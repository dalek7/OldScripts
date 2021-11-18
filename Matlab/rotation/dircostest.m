clc; clear; close all;
%% 2013/12/30
% Testing the directional cosine

%%

k = [0 0 1];
ntest = 20;
B = zeros(ntest,3);
cnt = 0;


cY = zeros(ntest,3);
cX = zeros(ntest,3);
cZ = zeros(ntest,3);

for i=-1:1/ntest:1
   
   cnt = cnt+1;
   x = sin( pi*i/2);
   y = 0;
   z  = cos( pi*i/2);
   
   n = [x y z];
   cZ(cnt, :)= n;
   cY(cnt, :)= cross(n, k);
   cX(cnt, :)= cross(n, cY(cnt, :));
   
   %cY(cnt, :) = cY(cnt, :) ./ norm(cY(cnt, :));
    
end
B = cZ;

%% Plotting 1
%plot3(B(:,1),B(:,2),B(:,3),'o');

figure;
quiver3(B(:,1),B(:,2),B(:,3),cY(:,1),cY(:,2),cY(:,3),'g');
hold on;
quiver3(B(:,1),B(:,2),B(:,3),cX(:,1),cX(:,2),cX(:,3),'r');
quiver3(B(:,1),B(:,2),B(:,3),cZ(:,1),cZ(:,2),cZ(:,3),'b');

xlabel('X'); ylabel('Y'); zlabel('Z');

%% Plotting 2
%plot3(B(:,1),B(:,2),B(:,3),'o');

figure;
quiver3(B(:,1),B(:,2),B(:,3),cY(:,1),cY(:,2),cY(:,3),'bo');

xlabel('X'); ylabel('Y'); zlabel('Z');
