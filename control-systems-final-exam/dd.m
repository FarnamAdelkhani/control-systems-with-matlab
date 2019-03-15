A = [1 0; 2 -3]; C = [1 1]; 
L_trans = acker(A', C', [-5 -5]);
L = L_trans'

eig(A - L * C)