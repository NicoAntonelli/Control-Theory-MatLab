% Control Theory
% 18/06/2020
% Nico Antonelli

% --- Controllers Sintonization: More ---


% EXERCISE 1 - PCR Method (Again)
% PID Controller
% TF_plant (Gp) = 1/(s^3+9s^2+26s+24)
num = [1];
den = [1, 9, 26, 24];
Gp = tf(num, den);

% Step response on the interval [0,8]
dt = 0.05;
t = 0:dt:8;
C = step(Gp, t);
plot(t, C, '-r');
legend('C(t) - Exact Response');

% Derivatives (First and Second Order)
dC = diff(C)/dt;
d2C = diff(dC)/dt;

% Graph with Response and derivatives
figure(2);
hold on;
plot(C, '-r');
plot(dC, '-g');
plot(d2C, '-b');
hold off;
axis([0, 70, -0.06, 0.1]);
legend('C(t)', 'dC(t)', 'd2C(t)');

% Value and Position of 1st derivative's global maximum
[m, p] = max(dC);
tpi = t(p);
% Console (erasing semicolons): m = 0.0312, p = 14, tpi = 0.6500

% Approximation Results:
T = 1.3356;
L = 0.275;

% Controller's TF Open Loop (Gc) Approximation
kp = 1.2*(T/L);
Ti = 2*L;
Td = 0.5*L;
num = [kp*Td*Ti, kp*Ti, kp];
den = [Ti, 0];
Gc = tf(num, den);

% Controller's TF Closed Loop
% Feedback (H) = 1
figure(3);
hold on;
H = 1;
TFCL = feedback(Gc*Gp, H);
step(TFCL, '-r');

% Improving TFLC
% Requirements:
% --> Improve Overshot
% --> Improve Repose Time

% First Improvement
kp1 = 1.5*kp;
Td1 = 3*Td;
Ti1 = Ti; % Unchanged
num = [kp1*Td1*Ti1, kp1*Ti1, kp1];
den = [Ti1, 0];
Gc = tf(num, den);
TFCL = feedback(Gc*Gp, H);
step(TFCL, '-g');

% Second Improvement
kp2 = kp1; % Unchanged (respect to the last improvement)
Td2 = 5*Td;
Ti2 = Ti; % Unchanged
num = [kp2*Td2*Ti2, kp2*Ti2, kp2];
den = [Ti2, 0];
Gc = tf(num, den);
TFCL = feedback(Gc*Gp, H);
step(TFCL, '-b');

% Third Improvement
kp3 = 1.3*kp;
Td3 = 4*Td;
Ti3 = Ti; % Unchanged
num = [kp3*Td3*Ti3, kp3*Ti, kp3];
den = [Ti3, 0];
Gc = tf(num, den);
TFCL = feedback(Gc*Gp, H);
step(TFCL, '-m');
hold off;

% Graphing PID's TF: Original Approximation and Improvements
legend('PID Z-N', 'PID 1st Improvement', 'PID 2nd Improvement', 'PID 3rd Improvement');
title('PID Approximation and Improvements');
