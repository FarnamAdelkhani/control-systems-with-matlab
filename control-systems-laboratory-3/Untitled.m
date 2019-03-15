% Lab 3 

s = tf('s')
Gp = 3 * 100 * (s + 1) / (3*s + 1) / (s^2 + 10*s + 100)
Kc = [0.2, 0.5, 1, 10]

figure(1)
hold
for n = 1:4
step(Kc(n) * Gp, 0:.0001:2)% Plot the step response; end time = 2 sec
legend('K_c = 0.2', 'K_c = 0.5', 'K_c = 1', 'K_c = 10')
    title('Step Response');
    xlabel('Time (secs)');
    ylabel('Amplitude');
[Y,T] = step(Kc(n) * Gp,0:.0001:2); % Simulation resolution is 0.0001 sec.
stepinfo(Y,T) % takes step response data (T,Y)
end
hold

    % Closed Loop
figure(2)
hold
for n = 1:4
step(feedback(Kc(n) * Gp, 1),0:.0001:1) % Plot the step response
    title('Step Response');
    xlabel('Time (secs)');
    ylabel('Amplitude');
legend('K_c = 0.2', 'K_c = 0.5', 'K_c = 1', 'K_c = 10')
[Y,T] = step(feedback(Kc(n) * Gp, 1),0:.0001:20); 
                    % Generate data used by “stepinfo” command
stepinfo(Y,T)
end
hold

% You may also explore settlingtime(Y,T,5); type help settlingtime.