A = [-2 0; 0 -1]
B = [2; 1]
C = 0
D = 0

eig(A)


%%b
CM = ctrb(A, B)
if rank(CM) == 2
 disp('Rank is 2, System Controllable')
else
 disp('Rank is less than 2, System Not Controllable')
end

%% d
OM = obsv(A, C)
if rank(OM) == 2
 disp('Rank is 2, System Observable')
else
 disp('Rank is less than 2, System Not Observable')
end

%%f
K = acker(A, B, [-2, -1])

%%g
syms s
Anew = A - B*K
% When N = 1:
Gsn1 = C * (s *eye(2) - Anew)^-1 * B + D
invN = subs(Gsn1,s,0)
N = double(1/invN)
% Transfer function after feedback:
sys = ss(Anew, N * B, C, D)
Gnew = tf(sys)

