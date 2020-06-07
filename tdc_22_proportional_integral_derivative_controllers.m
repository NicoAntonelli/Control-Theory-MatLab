% Control Theory
% 05/06/2020
% Nico Antonelli

% --- Proportional Integral Derivative Controllers ---


% Proportional Control - TF
kp = 1;
GcP = tf(kp);

% PID Control - Transference Function
% kp*[1 + (1/Ti*s) + Td*s] = (kp*Ti*Td*s^2 + kp*Ti*s + kp)/Ti*s
Ti = 1;   % Integral Coefficient
Td = 0.5; % Derivative Coefficient
num = [kp*Td*Ti, kp*Ti, kp];
den = [Ti, 0];
GcPID = tf(num, den);

% Gp = Plant - TF (Poles on -0.5 & 1, No Zeros)
z = [''];
p = [-0.5, -1];
k = 1;
[num, den] = zp2tf(z, p, k);
Gp = tf(num, den);

% Unitary Feedback - TF
H = [1];

% TF Open Loop - PID Controller (No Delay)
TfloPID = GcPID*Gp*H;

% PID Controller Rlocus
rlocus(TfloPID);
title("PID Controller");

% Unistep
figure(2);
hold on;
t = (-1:0.01:60);
unistep = t>=0;
plot(t, unistep, '-k');

% PID Controller - Output with Td = 0.1
kp = 1;
Ti = 1;
Td = 0.1;
num = [kp*Td*Ti, kp*Ti, kp];
den = [Ti, 0];
GcPID = tf(num, den);
Tflc1 = feedback(GcPID*Gp, H);

% PID Controller - Output with Td = 2
kp = 1;
Ti = 1;
Td = 2;
num = [kp*Td*Ti, kp*Ti, kp];
den = [Ti, 0];
GcPID = tf(num, den);
Tflc2 = feedback(GcPID*Gp, H);

% PID Controller - Output with Td = 10
kp = 1;
Ti = 1;
Td = 10;
num = [kp*Td*Ti, kp*Ti, kp];
den = [Ti, 0];
GcPID = tf(num, den);
Tflc3 = feedback(GcPID*Gp, H);

% Step Responses for PID Controller
step(Tflc1, '-r', Tflc2, '-g', Tflc3, '-b');

% Graphs
xlim([-1, 20]);
ylim([0, 1.5]);
xlabel('Time');
ylabel('Amplitude');
title('PID Controllers - System Response');
legend('Unistep', 'TFLC1 - Td=0.1', 'TFLC1 - Td=2', 'TFLC1 - Td=10');
hold off;
