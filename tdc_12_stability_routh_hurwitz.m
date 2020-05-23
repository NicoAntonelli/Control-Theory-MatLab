% Control Theory
% 08/05/2020
% Nico Antonelli

% --- Stability: Routh-Hurwitz Criteria ---


hold on;

% TFG1 = 1 / (1s^4 + 3s^3  + 5s^2 + 4s + 2)
% Stable function
num = [1];
den = [1, 3, 5, 4, 2];
TFG1 = tf(num, den);
impulse(TFG1, '-r'); 

% TFG2 = 1 / (1s^4 + 2s^3  + 3s^2 + 4s + 5)
% Unstable function
num = [1];
den = [1, 2, 3, 4, 5];
TFG2 = tf(num, den);
impulse(TFG2, '-g');

% TFG3 = 1 / (1s^3  + 2s^2 + 1s + 2)
% Critically Stable Function
num = [1];
den = [1, 2, 1, 2];
TFG3 = tf(num, den);
impulse(TFG3, '-b');

% TFG4 = 1 / (1s^3 + 0s^2 - 3s + 2)
% Unstable function
num = [1];
den = [1, 0, -3, 2]; % Visible unstability, negative pole
TFG4 = tf(num, den);
impulse(TFG4, '-c');

% TFG5 = 1 / (s^5 + 2s^4 + 24s^3  + 48s^2 - 25s - 50)
% Unstable function
num = [1];
den = [1, 2, 24, 48, -25, -50];
TFG5  = tf(num, den);
impulse(TFG5, '-y');

xlim([0 , 20]);
ylim([-26, 20]);
xlabel('Time');
ylabel('Amplitude');
title('System Response');
legend('C1(t)', 'C2(t)', 'C3(t)', 'C4(t)', 'C5(t)');

hold off;

figure(2);
pzmap(TFG1, TFG2, TFG3, TFG4, TFG5);
xlim([-3, 3]);
ylim([-6, 6]);
legend('C1(t), 4P',  'C2(t), 4P', 'C3(t), 3P', 'C4(t), 3P', 'C5(t), 5P');

% Routh-Hurwitz Criteria:
% FT1: No unstable poles (in closed-loop system)
% FT2: 02 unstable poles (in closed-loop system)
% FT3: No unstable poles (in closed-loop system)
% FT4: 01 unstable pole (in closed-loop system)
% FT5: 01 unstable pole (in closed-loop system)
