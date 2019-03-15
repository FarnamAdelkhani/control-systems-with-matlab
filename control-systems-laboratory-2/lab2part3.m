%% Part iii -
s = tf('s'); % Later create other transfer functions in terms of s
w = 3;
z = [0, 0.1, 0.5, 0.707, 1, 3]; % tau?s are put into a vector.
tfinal = 30; % Play with sim. end time to find best fit
figure % Initiate a new figure.
hold; % Hold plotting until several plots are put into the same figure.

% Use a ?for loop? to find the step response for each tau:
% Note: Don?t use i or j as loop index, they are reserved for square root of -1.
for n = 1:6
    Gs = ((w)^2) / ((s^2 + 2*z(n)*(w)*s + (w)^2)) % Define the transfer function.
    step(Gs, tfinal)      % Generate the step response.
end
a=1;b=2;
hold; % Release the plot hold.
      % For adding title, axes labels and legend:
title('Unit Step Response of omega / Gs = ((w)^2) / ((s^2 + 2*z(n)*(w)*s + (w)^2)) - z = [0, 0.1, 0.5, 0.707, 1, 3]' )
xlabel('Time')
ylabel('System Response')
legend('zeta = 0', 'zeta = 0.1', 'zeta = 0.5', 'zeta = 0.707',...
    'zeta = 1', 'zeta = 4', 'location', 'southeast')