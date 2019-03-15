%% Part ii - Same as above with changes to tau and K
% Specifiy a new section with the above command
s = tf('s'); % Later create other transfer functions in terms of s
K = [0.1, 0.5, 5, 10];
tau = 0.5; % tau?s are put into a vector.
tfinal = 30; % Play with sim. end time to find best fit
figure % Initiate a new figure.
hold; % Hold plotting until several plots are put into the same figure.

% Use a ?for loop? to find the step response for each tau:
% Note: Don?t use i or j as loop index, they are reserved for square root of -1.
for n = 1:4
 Gs = K(n)/(tau*s + 1); % Define the transfer function.
 step(Gs, tfinal)      % Generate the step response.
end
hold; % Release the plot hold.
      % For adding title, axes labels and legend:
title('Unit Step Response of K/(\tau s + 1); K = [0.1, 0.5, 5, 10] and \tau = 0.5')
xlabel('Time')
ylabel('System Response')