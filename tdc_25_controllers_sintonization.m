% Control Theory
% 12/06/2020
% Nico Antonelli

% --- Controllers Sintonization ---


% PID Controller
% TF_plant (Gp) = (s+3)/(s^3+5s^2+9s+5)
num = [1, 3];
den = [1, 5, 9, 5];
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
axis([0, 100, -0.25, 1]);
legend('C(t)', 'dC(t)', 'd2C(t)');

% Value and Position of 1st derivative's global maximum
[m, p] = max(dC);
tpi = t(p);
% Console (erasing semicolons): m = 0.3090, p = 16, tpi = 0.7500

% Process Courve Reaction (PCR) Method* results:
% (*): PCR is the first Ziegler-Nichols Method
T = 1.9418;
L = 0.2241;

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
% --> Overshot < 15%
% --> Repose Time < 5seg

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
hold off;

% Graphing PID's TF: Original Approximation and Improvements
legend('PID Z-N', 'PID 1st Improvement', 'PID 2nd Improvement');
title('PID Approximation and Improvements');
