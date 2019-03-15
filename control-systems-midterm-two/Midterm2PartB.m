% Find a state space repres. x=ax+bu,....
%             for the continuous time transfer function
%      G(s) = s + 2 / S^3 + s^2 + 3s

Gs = tf([1 2],[1 1 3 0]) % Define transfer function by coefficients.
Gss = ss(Gs) % Find a state space model for the above.

% Answer is diff from done by hand but both have the same
% transfer function

T = 0.1;
A = [-1 -1 0; 1 0 0; 0 1 0];
B = [1; 0; 0];
C = [0 0 1];
D = 0;
csys = ss(A,B,C,D) 
      % Create continuous time state space system.
dsys = c2d(csys,T,'zoh') 
      % Convert, zoh -> zero order hold method.
