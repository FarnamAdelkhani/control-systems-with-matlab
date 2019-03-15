%% LAB2 Part i Code

s = tf('s'); % Later create other transfer functions in terms of s
K = 1;
tau = [0.1, 0.5, 1, 10]; % tau?s are put into a vector.
tfinal = 30; % Play with sim. end time to find best fit
figure % Initiate a new figure.
hold; % Hold plotting until several plots are put into the same figure.

% Use a ?for loop? to find the step response for each tau:
% Note: Don?t use i or j as loop index, they are reserved for square root of -1.
for n = 1:4
    Gs = K/(tau(n)*s + 1) % Define the transfer function.
    step(Gs, tfinal)      % Generate the step response.
end
hold; % Release the plot hold.
% For adding title, axes labels and legend:
title('Unit Step Response of K/(\tau s + 1); K = 1 and \tau = 0.1, 0.5, 1, 10')
xlabel('Time')
ylabel('System Response')
legend('\tau = 0.1','\tau = 0.5',... % ... means continued on next line.
    '\tau = 1','\tau = 10','location','southeast')
text(10, .5, 'All Plots on 1 graph')

%% Part i code continued - Plotting graphs invidually

s = tf('s'); % Later create other transfer functions in terms of s
K = 1;
tau = [0.1, 0.5, 1, 10]; % tau?s are put into a vector.
tfinal = 30; % Play with sim. end time to find best fit
%figure % comment out - pause figure initiation
%hold; % comment out - hold

% Use a ?for loop? to find the step response for each tau:
% Note: Don?t use i or j as loop index, they are reserved for square root of -1.
for n = 1:4
    figure %Added this
    Gs = K/(tau(n)*s + 1) % Define the transfer function.
    step(Gs, tfinal)      % Generate the step response.
end
%hold; % Release the plot hold.
% For adding title, axes labels and legend:
title('Unit Step Response of K/(\tau s + 1); K = 1 and \tau = 0.1, 0.5, 1, 10')
xlabel('Time')
ylabel('System Response')
%legend('\tau = 0.1','\tau = 0.5',... % ... means continued on next line.
%'\tau = 1','\tau = 10','location','southeast')
text(10, .5, 'Plots graphed individually')

