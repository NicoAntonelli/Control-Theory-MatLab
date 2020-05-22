% Control Theory
% 24/04/2020
% Nico Antonelli

% --- Servo and Regulator Systems Problem ---


% Servo System
% G(s) = 18 / (s^2+2s+26)
num = [18];
den = [1 2 26];
FTG_servo = tf(num, den);


% Regulator System
% G(s) = 9 / (s^2+2s+26)
num = [9];
den = [1 2 26];
FTG_regulator = tf(num, den);


% Pole-Zero map (p<=0 for all p, thus it is a stable system)
pzmap(FTG_servo, '-g', FTG_regulator, '-b');
legend('C(t) Servo', 'C(t) Regulator');

% New plot window
figure(2)
hold on;

% Time in a 'for'  loop (init, increment, condition)
t = (-2 : 0.1 : 10);

% Start input step function when t=0
unitpstep = t >= 0; % generates a vector full of ones
plot(t, unitpstep, 'r'); % plotting the step input

% Step responses
step(FTG_servo, 'g');
step(FTG_regulator, 'b');

% Graph
xlim([-2 10])
ylim([0 1.1])
title('System Response');
xlabel('Time');
ylabel('Amplitude');
legend('Step Input', 'C(t) Servo', 'C(t) Regulator');

hold off;
