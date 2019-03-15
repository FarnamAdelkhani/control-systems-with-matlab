syms M m Lp Ic Kt Km Kg Rm r Jm g
syms xdd xd x thdd thd th Vin

w = xd * Kg / r
wd = xdd * Kg / r
emf = Km * w 

I = (Vin - emf)/ Rm

T = Kt * I
Ti = Jm * wd
F = (T - Ti) * Kg / r


eq1 = (M + m) * xdd + m * Lp * thdd - F
 
eq3 = xdd + 4 * Lp * thdd/3 - g * th

[xxdd, tthdd] = solve(eq1, eq3, xdd, thdd)

XX = [x; xd; th; thd]
FXU = [xd; xxdd; thd; tthdd]

AA = jacobian(FXU, XX)
BB = jacobian(FXU, Vin)

y = [x; th]

C = jacobian(y, XX)
D = jacobian(y, Vin)

A = subs(AA,{M, m, Lp, Kt, Km, Kg, Rm, r, Jm, g},{0.94, .23, .3302, .00767...
    , .00767, 3.71, 2.6, .00635, 3.9e-7, 9.81})

B = subs(BB,{M, m, Lp, Kt, Km, Kg, Rm, r, Jm, g},{0.94, .23, .3302, .00767...
    , .00767, 3.71, 2.6, .00635, 3.9e-7, 9.81})

A = double(A)
B = double(B)
C = double(C)
D = double(D)


sa = size(A);

CM = ctrb(A,B)
disp(['Controlability Matrix Rank = ',num2str(rank(CM))])

if rank(CM) == sa(1)
    disp('System Controllable')
else
    disp('Synstem Not Controllable')
end

OM = obsv(A,C)
disp(['Observability Matrix Rank = ',num2str(rank(OM))])

if rank(OM) == sa(1)
    disp('System Observable')
else
    disp('Synstem Not Observable')
end

sys = ss(A,B,C,D)
step(sys,0.5)         % System unit step responses.
                      % Make sure you label the axes.