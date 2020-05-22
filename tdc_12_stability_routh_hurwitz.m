% Control Theory
% 08/05/2020
% Nico Antonelli

% --- Stability: Routh-Hurwitz Criteria ---


hold on;

% TFG1 = 1 / (s^4 + 2s^3  + 3s^2 + 4s + 5)
% Unstable function
num = [1];
den = [1, 2, 3, 4, 5];
TFG1 = tf(num, den);
impulse(TFG1, '-r');

% TFG2 = 1 / (1s^3  + 2s^2 + 1s + 2)
% Critically Stable Function
num = [1];
den = [1, 2, 1, 2];
TFG2 = tf(num, den);
impulse(TFG2, '-g');

% TFG3 = 1 / (s^5 + 2s^4 + 24s^3  + 48s^2 - 25s - 50)
% Unstable function
num = [1];
den = [1, 2, 24, 48, -25, -50];
TFG3  = tf(num, den);
impulse(TFG3, '-b');

xlim([0 , 20]);
ylim([-26, 20]);
xlabel('Time');
ylabel('Amplitude');
title('System Response');
legend('C1(t)', 'C2(t)', 'C3(t)');

hold off;

figure(2);
pzmap(TFG1, TFG2, TFG3);
legend('C1(t)', 'C2(t)', 'C3(t)');

% Routh-Hurwitz Criteria:
% FT1: 2 unstable poles (in closed-loop system)
% FT2: No unstable poles (in closed-loop system)
% FT3: 1 unstable pole (in closed-loop system)
