clc; clear; close all;

w = 1280;
h = 800;
A = zeros(w,h, 3);

m_x = w/2;
m_y = h/2;
sig_x = 50*1.4;
sig_y = 50*1.4;

for i=1:h
    for j=1:w
        
        v1 = gaussian2D(j,i, 1024/4, m_y, sig_x, sig_y);
        
        v2 = gaussian2D(j,i, 3*1024/4, m_y - 100, sig_x, sig_y);%sig_x*1.5, sig_y*1.5
        v3 = gaussian2D(j,i, 1024/2, m_y+100, sig_x, sig_y);
        v = v1 + v2+v3;
       if v>1 
           v = 1;
       end
        A(j,i,:) = v;
        
        
    end
end
% 
% A(1,1,1) = 1;
% for i=1:w
%     %v = i  / w;
%     %v = sigmoid(0.06, i, w/2);
%     %v = 0.5*(1 + sin(2*pi*i/w));
%     v = gaussian(
%     A(:,i,:) = v;
% end


% B =  B / max(max(max(B)));

% surf(A(:,:,1));
image(A);


imwrite(A, 'gaussian_2d_1280_y.png', 'PNG');

