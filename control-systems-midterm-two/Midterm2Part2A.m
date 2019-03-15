% Find a state space repres. x=ax+bu,....
%             for the continuous time transfer function
%      G(s) = s + 2 / S^3 + s^2 + 3s

Gs = tf([1 2],[1 1 3 0]) % Define transfer function by coefficients.
Gss = ss(Gs) % Find a state space model for the above.

% Answer is diff from done by hand but both have the same
% transfer function

T = 0.1;
Gz = c2d(Gs, T,'zoh') 
% Convert to discrete time using zero order hold method.
% ...** take this answer and divide by the highest power
% of z seen in the denominator and multiply out