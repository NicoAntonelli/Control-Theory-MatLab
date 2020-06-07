% Control Theory
% 04/06/2020
% Nico Antonelli

% --- Controller ---


% Transference Function (Closed Loop): kp(s+1)/2s^2+kps+kp
kp = 1;
num = [kp, kp];
den = [2, kp, kp];
TFLC = tf(num, den);

% Unistep
t = (-1:0.01:60);
unistep = t>=0;
hold on;
plot(t, unistep, '-r');

% Step Response
step(TFLC, '-g');

% Ramp Response (Impulse of TFLC * Laplace Transform of Ramp Input)
s = tf('s');
R = 1/s^2;
impulse(TFLC*R, '-b');
hold off;

% Graphs
xlim([-1, 20]);
ylim([0, 2]);
xlabel('Time');
ylabel('Amplitude');
title('System Responses');
legend('Unistep', 'TFLC - Step Response', 'TFLC - Ramp Response');

% Pole-Zero map for TFLC
figure(2);
pzmap(TFLC);

% Transference Function (Open Loop): Root Locus
figure(3);
kp = 1;
num = [kp, kp];
den = [2, 0, 0];
TFLO = tf(num, den);
rlocus(TFLO);
