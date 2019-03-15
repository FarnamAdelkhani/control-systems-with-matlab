syms s t

A = [-3 1 0; 2 -3 2; 0 1 -3];
B = [1; 0; 0];
C = [0 0 1];
D = [0];
T=.5;

syscont = ss(A,B,C,D) % Define continuous time state space system

sysdisc = c2d(syscont,T) % Convert to discrete time

[Ad,Bd,Cd,Dd,TT] = ssdata(sysdisc) % Extract the discrete time system data

eig(A)
eig(Ad)