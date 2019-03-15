gm=0.005;
Cm=20*10^(-12);
R0=200;
R=1000;
L=10^(-4);
A=[-1/(R0*Cm) 1/Cm; -1/L -R/L]
B=[(gm*R0+1)/(R0*Cm); 1/L]
C=[-1 0]
D=[1]
sys=ss(A,B,C,D);
[b,a]=ss2tf(A,B,C,D);
t=tf(b,a)

Y(s) = (C * inv(s * eye(3) - A) * B + D) * U(s);
