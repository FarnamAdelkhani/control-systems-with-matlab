syms s t u1 u2 x1 x2 x3 y1 y2
u1bar = 1; u2bar = 1
% Feed in the f and g vectors of functions:
f = [x1^2*x2 + u1*u2*x2; x2^3*x3 + x1 - 2; x1*u2 + x3 - 3]
g = [x1^2*x2 + u1^2 + 2*u2; x3^3 + u1^2]
% Solve for steady state operating point xbars:
ff = subs(f,{u1,u2},{1,1})
% Solve for steady state operating point xbars by setting ff = 0; return only
% real answers:
[x1bar, x2bar, x3bar] = solve(ff==0, x1, x2, x3, 'Real', true)
% Find ybar (operating point values of output):
ybar = subs(g,{x1,x2,x3,u1,u2},{x1bar,x2bar,x3bar,u1bar,u2bar})
% Find A, B, C, D matrices:
A = jacobian(f,x)
B = jacobian(f,u)
C = jacobian(g,x)
D = jacobian(g,u)
% Substitute barred values (operating point values) in A, B, C, D matrices;
% also convert the fractions to double precision numbers:
AA = subs(A,{x1,x2,x3,u1,u2},{x1bar,x2bar,x3bar,u1bar,u2bar});
AA = double(AA)
BB = subs(B,{x1,x2,x3,u1,u2},{x1bar,x2bar,x3bar,u1bar,u2bar});
BB = double(BB)
CC = subs(C,{x1,x2,x3,u1,u2},{x1bar,x2bar,x3bar,u1bar,u2bar});
CC = double(CC)
DD = subs(D,{x1,x2,x3,u1,u2},{x1bar,x2bar,x3bar,u1bar,u2bar});
DD = double(DD)