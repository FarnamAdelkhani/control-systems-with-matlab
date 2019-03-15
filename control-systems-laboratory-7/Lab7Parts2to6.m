%% Lab 7 Parts 2 to 6

%% PARTS 2, 3 and 4:
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
disp('System Poles (eigen values of A):')
eig(A)
disp('One pole is positive --> system unstable')

sys = ss(A,B,C,D)

figure
step(sys,0.5)         % System unit step responses.
                      % Make sure you label the axes.
% ---------------------------------------------------------------
%% PARTS 5 and 6:
% Pole placement:
K = acker(A, B, [-1.9 + 10j, -1.9 - 10j, -1.6 + 1.3j, -1.6 - 1.3j ])

N = (-[1 0 0 0] * inv(A - B * K) * B)^-1

% A, B, C, D system matrices AFTER state variable feedback:
% dx/dt = Anew x + Bnew r; y = Cnew x + Dnew r; r = feedback system input.
Anew = A - B * K
Bnew = B * N
Cnew = C - D * K
Dnew = D * N

sysnew = ss(Anew,Bnew,Cnew,Dnew)
eig(Anew)       % To make sure system poles are at prescribed values.

figure
step(sysnew, 10)% Unit step response after state feedback implementation.

% Transfer function:
Ts = tf(sysnew)
Ts = Ts(1)      % The top transfer function is cart position.

figure
bode(Ts)        % Bode Plots.
grid on

figure
rlocus(Ts)      % Root Locus.
