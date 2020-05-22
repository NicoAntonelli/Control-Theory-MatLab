% Control Theory
% 30/04/2020
% Nico Antonelli

% --- Impulse Response: Performance Measures ---


clc;
hold on;

% TF for 2nd order function:
% w^2 / (s^2 + 2zw s + w^2)

% Definitions for A (w=2, z=0.1)
w = 2;	 % normal velocity
z = 0.1; % dumpting coeficient (dzeta)
num = w^2;
den = [1, 2*z*w, w^2];
TFA = tf(num, den);

% Definitions for B (w=2, z=0.7)
w = 2;	 % normal velocity
z = 0.7; % dumpting coeficient (dzeta)
num = w^2;
den = [1, 2*z*w, w^2];
TFB = tf(num, den);

% Definitions for C (w=2, z=2)
w = 2;	 % normal velocity
z = 2; % dumpting coeficient (dzeta)
num = w^2;
den = [1, 2*z*w, w^2];
TFC = tf(num, den);

% Impulse Responses
impulse(TFA, '-r', TFB, '-g', TFC, '-b');

% If I had needed the Poles
% p = roots(den);

% Graph
xlim([-2, 30])
ylim([-2, 2])
title('Impulse Responses');
xlabel('Time');
ylabel('Amplitude');
legend('TFA, \zeta = 0.1', 'TFB, \zeta = 0.7', 'TFC, \zeta = 2');

hold off;

% Pole-Zero map
figure(2);
pzmap(TFA, TFB, TFC);
legend('TFA, \zeta = 0.1', 'TFB, \zeta = 0.7', 'TFC, \zeta = 2');

% Performance Measures on the Plot Windows' Tools

