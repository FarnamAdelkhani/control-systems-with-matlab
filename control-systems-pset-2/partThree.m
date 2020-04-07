syms s t

A = [-3 1 0; 2 -3 2; 0 1 -3];
B = [1; 0; 0];
C = [0 0 1];
D = [0];

tfinal = 10; % Simulation end time.
T = 0.5; % Sampling period.
kfinal = 10/T; % Final time increment.
D = 0; % Ad, Bd, C and D matrices must be defined by now.
x = [0; 0; 0]; % Initial values.
y = 0; % Initial value of output.
u = 1; % unit step input.
for k = 1: kfinal % Iterations.

x = Ad * x + Bd * u;
 ynew = C * x + D * u;
 y = [ y, ynew] % Put together the new value of y with all previous y's.
end 

% Input U(s) = step of magnitude 0.04; 
% recall Laplace transform of unit step = 1/s:
U(s) = 1 / s;

% Type in equation (I?6) without x0 term as x0 = 0; 
% eye(3) is 3x3 identity matrix:
Y(s) = (C * inv(s * eye(3) - A) * B + D) * U(s);

% Take inverse Laplace transform:
yt = ilaplace(Y(s))

figure % Initiate a new figure.
hold % Hold plotting.
ezplot(yt,[0,10]) % Plot the problem 1 solution yt for 0 < t < 10 sec.
plot(0:T:tfinal, y, 'x') % Plot with X's the discrete time system solution.
hold % Release hold to plot all on same graph.
axis tight % Force plot axes cover the complete plot range.