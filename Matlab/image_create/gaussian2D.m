function z = gaussian2D(x,y, m_x, m_y, sig_x, sig_y)
% sig = sig_x= sig_y
% http://en.wikipedia.org/wiki/Gaussian_function

    p = -1*( (x - m_x)^2 / (2* sig_x^2) + (y - m_y)^2 / (2* sig_y^2));
    z = exp(p);
