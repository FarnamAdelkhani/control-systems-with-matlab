% Use MATLAB to calculate the Laplace transform 
% of deviation current and find its inverse Laplace
% transform:

syms s t

dIs = (C * (s*eye(2) - A)^-1 * B + D) * 1/s
dIs = simplifyFraction(dIs)
dit = ilaplace(dIs)
dit = vpa(dit,5)