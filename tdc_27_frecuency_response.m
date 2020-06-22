% Control Theory
% 19/06/2020
% Nico Antonelli

% --- Frecuency Response ---


% Time Examples
t1 = [0:0.1:20];
t2 = [0:0.0001:1];
t3 = [0:0.0001:0.5];

% Sinusoidal Function Examples
x1 = 1 * sin(t1);
x2 = 1 * sin(100 * t2);
x3 = 1 * sin(100 * t3);

% TF Definition
num =[100];
den = [1, 10];
GA = tf(num, den);

% Response Example 1
lsim(GA, x1, t1); % lsim: For a non-default MatLab input (like Sin)
title('Sinusoidal Response 1');
legend('CA1(t)');

% Response Example 2
figure(2);
lsim(GA, x2, t2);
title('Sinusoidal Response 2');
legend('CA2(t)');

% Response Example 3
figure(3);
lsim(GA, x3, t3);
title('Sinusoidal Response 3');
legend('CA3(t)');
