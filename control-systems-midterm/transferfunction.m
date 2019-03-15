%transfer function #1 page 3of5 
syms s t Us
A = [-1 1; 0 -2]; 
B = [0; 1]; 
C = [0 1]; 
D = 0; 
x0 = [0; 0];

Ys = (C * (s*eye(2) - A)^-1 * B + D) * Us + C * (s*eye(2) - A)^-1 * x0
%expand and simplify expression

%% Use this to simplify the output fraction
%simplifyFraction(Us/(s + 2))

%%
%--> sub U(s) = 1/s in Y(s): ...

YYs = subs(Ys,Us,2/s)
ilaplace(YYs)