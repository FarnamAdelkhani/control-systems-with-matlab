%% Part iv -
s = tf('s'); % Later create other transfer functions in terms of s
w = [0.5, 1, 3, 15];
z = 0.5; % tau?s are put into a vector.
tfinal = 30; % Play with sim. end time to find best fit
figure % Initiate a new figure.
hold; % Hold plotting until several plots are put into the same figure.

% Use a ?for loop? to find the step response for each tau:
% Note: Don?t use i or j as loop index, they are reserved for square root of -1.
for n = 1:4
    Gs = w(n)^2 / ((s^2 + 2*z*w(n)*s + w(n)^2)) % Define the transfer function.
    step(Gs, tfinal)      % Generate the step response.
end
a=1;b=2;
hold; % Release the plot hold.
      % For adding title, axes labels and legend:
title('Unit Step Response of omega / Gs = ((w)^2) / ((s^2 + 2*z(n)*(w)*s + (w)^2)) - z = [0.5] /omega = 0.5' )
xlabel('Time')
ylabel('System Response')
legend('\omega = 0.5', '\omega = 1', '\omega = 3', '\omega = 15',...
    'location', 'southeast')