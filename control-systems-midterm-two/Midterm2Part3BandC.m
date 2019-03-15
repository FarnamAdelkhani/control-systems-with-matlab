syms vc il vi
x = [vc, il]
u = vi
fxu = [1e6 * ( sqrt((vi -vc)/1000) - il); 1000 * vc]
gxu = sqrt((vi -vc)/1000)
% Solve for operating point values:
vibar = 10
[vcbar, ilbar] = solve(fxu ==[0;0], vc, il)
% Find A,B,C,D matrices:
AA = jacobian(fxu,x)
BB = jacobian(fxu,u)
CC = jacobian(gxu,x)
DD = jacobian(gxu,u)
% Substitute operating point values:
AAA = subs(AA,{vc,il,vi},{vcbar,ilbar,vibar});
BBB = subs(BB,{vc,il,vi},{vcbar,ilbar,vibar});
CCC = subs(CC,{vc,il,vi},{vcbar,ilbar,vibar});
DDD = subs(DD,{vc,il,vi},{vcbar,ilbar,vibar});
% Final answer:
A = double(AAA) % Convert to regular numbers (double precision).
B = double(BBB)
C = double(CCC)
D = double(DDD)

