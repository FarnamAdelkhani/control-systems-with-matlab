% Find a state space repres. x=ax+bu,....
%             for the continuous time transfer function
%      G(s) = s + 2 / S^3 + s^2 + 3s

Gs = tf([1],[1 1 1 0]) % Define transfer function by coefficients.
Gss = ss(Gs) % Find a state space model for the above.

% Answer is diff from done by hand but both have the same
% transfer function

T = 0.1; % Given that T = 0.1;
A = [-1 -1 0; 1 0 0; 0 1 0];
B = [1; 0; 0];
Ad = expm(A*T)

M = eye(3); % Initialize M = I, M = ....
for k = 1:5
 M = M + ((A*T)^k)/factorial(k + 1); % Computationally 
%                                       not optimized.
end

format longg % Show more significant digits.
Bd = T * M * B 

