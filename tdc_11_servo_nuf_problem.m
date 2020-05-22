% Control Theory
% 07/05/2020
% Nico Antonelli

% --- Servo NUF (Non-Unit Feedback) Problem ---


% TFG = (18s + 36) / (1s^3 + 4s^2 + 12s + 34)
hold on;

num = [18, 36];
den = [1, 4, 12, 34];
TFG = tf(num, den);
step(TFG, '-b');
t = 0:0.01:25;
unistep = t>=0;
plot(t, unistep, '-r');

xlabel('Time');
ylabel('Amplitude');
title('Servo NUF Problem');
legend('TFG');

hold off;
% Ess (Error on stable-state) = -0.06
