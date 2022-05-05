% Control Theory
% 11/06/2020
% Nico Antonelli

% --- Controllers Comparison ---


% General Parameters
% TF_plant = 1/s(s+1) = 1/(s^2+s+0)
% Feedback (H) = 1, Every kp = 1
kp = 1;

% Controller 1: Proportional (P)
% TF_P = kp
% TF Closed Loop: kp/(s^2+s+kp)
num = [kp];
den = [1, 1, kp];
TFCL_P = tf(num, den);

% Controller 2: Integral (I)
% TF_I = ki/s, ti = 0.5
% TF Closed Loop: ki/(s^3+s^2+0+ki)
ki = 1;
num = [ki];
den = [1, 1, 0, kp];
TFCL_I = tf(num, den); % Unstable

% Note: Controller only Derivative (D) not used

% Controller 3: Proportional Integral (PI)
% TF_PI = kp+(ki/s), ti = 0.5
% TF Closed Loop: (kps+0.5kp)/(s^3+s^2+kps+0.5kp)
num = [kp, 0.5*kp];
den = [1, 1, kp, 0.5*kp];
TFCL_PI = tf(num, den);

% Controller 4: Proportional Derivative (PD)
% TF_PD = kp+kds, td = 2
% TF Closed Loop: (2kps+kp)/(s^2+(2kp+1)s+kp)
num = [2*kp, kp];
den = [1, (2*kp)+1, kp];
TFCL_PD = tf(num, den);

% Controller 5: Proportional Integral Derivative (PID)
% TF_PID = kp+(ki/s)+kds, ti = 0.5, td = 2
% TF Closed Loop: (kps+kp)/(2s^2+kps+kp)
num = [kp, kp];
den = [2, kp, kp];
TFCL_PID = tf(num, den);

% Unistep
t = (-1:0.01:60);
unistep = t>=0;

% Step Responses
hold on;
plot(t, unistep, '-r');
step(TFCL_P, '-g', TFCL_I, '-b');
step(TFCL_PI, '-c', TFCL_PD, '-m', TFCL_PID, '-y');
hold off;

% Graphs
xlim([-1, 30]);
ylim([0, 2]);
xlabel('Time');
ylabel('Amplitude');
title('System Responses Comparison');
legend('Unistep', 'P', 'I', 'PI', 'PD', 'PID');

% Pole-Zero maps
figure(2);
pzmap(TFCL_P, TFCL_I, TFCL_PI, TFCL_PD, TFCL_PID);
xlim([-3, 1.5]);
ylim([-1, 1]);
legend('P', 'I', 'PI', 'PD', 'PID');
title('Pole-Zero Maps Comparison');

% Root Locus
% Proportional (P) vs Integral (I) Controllers

% TF Open Loop of P Controller: kp/(s^2+s+0)
figure(3);
kp = 1;
num = [kp];
den = [1, 1, 0];
TFOL_P = tf(num, den);
rlocus(TFOL_P);
legend('TF Open Loop: kp/(s^2+s)');
title('Proportional Controller (Stable) Root Locus');

% TF Open Loop of I Controller: ki/(s^3+s^2+0s+0)
figure(4);
ki = 1;
num = [ki];
den = [1, 1, 0, 0];
TFOL_I = tf(num, den);
rlocus(TFOL_I);
legend('TF Open Loop: ki/(s^3+s^2)')
title('Integral Controller (Unstable) Root Locus');
