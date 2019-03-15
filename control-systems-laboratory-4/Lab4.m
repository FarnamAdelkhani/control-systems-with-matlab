% LAB 4 Code
% Farnam Adelkhani (915815724)

clear; % Clear all variables.
Kp = 3; 
tau = 3; 
zeta = 0.5; 
wn = 10;
Kc = [.2; .5; 1; 10]

s = tf('s')
Gp = Kp * wn^2 * (s + 1) / (tau *s +1) / (s^2 + 2* zeta * wn *s +wn^2)

% ******* OPEN LOOP Case *******
figure
hold % Hold plotting.
for n = 1:4
Gs = Gp * Kc(n);
bode(Gs); % Draw Bode plots.
disp(['********** Open Loop Kc = ', num2str(Kc(n)), ' **********'])

BW = bandwidth(Gs) %bandwidth
DCGain = dcgain(Gs) %dcgain
DCGaindB = 20 * log10(DCGain) % Convert to dB, log10=log
[MaxGain, MaxFreq] = getPeakGain(Gs) %getPeakGain
MaxGaindB = 20 * log10(MaxGain) % Gain is not in dB; convert to dB.
end
hold % Release the plots.

title('Open Loop Case')
legend('Kc = 0.2', 'Kc = 0.5', 'Kc = 1', 'Kc = 10', 'location', 'northeast')

% ******* CLOSED LOOP *******
figure
hold
for n = 1:4
Gs = feedback(Gp * Kc(n), 1);
bode(Gs)
disp(['********** Closed Loop Kc = ', num2str(Kc(n)), ' **********'])
BW = bandwidth(Gs)
DCGain = dcgain(Gs)
DCGaindB = 20 * log10(DCGain)
[MaxGain, MaxFreq] = getPeakGain(Gs)
MaxGaindB = 20 * log10(MaxGain)
end
hold
title('Closed Loop Case')
legend('Kc = 0.2', 'Kc = 0.5', 'Kc = 1', 'Kc = 10', 'location', 'northeast')