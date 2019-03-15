A = [-3 1 0;2 -3 2;0 1 -3];
B = [1;0;0];
C = [1 0 0];
D = 0;
ob = obsv(A,C)
unob = length(A) - rank(ob)

eigen = eig(A)
%tc = inv(eigen)

sys = ss(A, B, C, D)
step(sys)

AA = (A - (B*K));
BB = B;
CC = C;
DD = 0;
sys2 = ss(AA, BB, CC, DD)
figure; step(sys2)
simulink
