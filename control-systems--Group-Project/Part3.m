clear all;
clc

syms s t;
gm=0.005; Cm=20*10^(-12); R0=200; R=1000; L=10^(-4);
A=[-1/(R0*Cm) 1/Cm; -1/L -R/L];
B=[(gm*R0+1)/(R0*Cm); 1/L];
C=[-1 0];
D=[1];

n = A*B*C;
d = 1 - (A*B*C);
r = 1/s; %step function
tf = (n/d)*r;
h = ilaplace(tf);
step(h,n)