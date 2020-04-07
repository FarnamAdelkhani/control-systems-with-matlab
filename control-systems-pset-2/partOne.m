syms s t

A = [-3 1 0; 2 -3 2; 0 1 -3];
B = [1; 0; 0];
C = [0 0 1];
D = [0; 0; 0];

%[num,den] = ss2tf(A,B,C,D);
%t = tf(num,den)

% Input U(s) = step of magnitude 0.04; 
% recall Laplace transform of unit step = 1/s:
U(s) = 1 / s;

% Type in equation (I?6) without x0 term as x0 = 0; 
% eye(3) is 3x3 identity matrix:
Y(s) = (C * inv(s * eye(3) - A) * B + D) * U(s);

% Take inverse Laplace transform:
yt = ilaplace(Y(s))

% Round to 4 decimal places:
vpa(yt,4)


