% Control Theory
% 17/04/2020
% Nico Antonelli

% --- Overdamped Systems ---


% G2OA Definition
clc;
z = '';
p = [-1; -6];
k = 6;
[num,den] = zp2tf(z, p, k);
G2OA = tf(num, den);

% G2OB Definition
p = [-1; -50];
k = 50;
[num,den] = zp2tf(z, p, k);
G2OB = tf(num, den);

% G1O Definition
p = -1;
k = 1;
[num,den] = zp2tf(z, p, k);
G1O = tf(num, den);

% Step responses
step(G1O, '-r', G2OA, '-g',G2OB, '-b');

% Graph
xlim([0 6]);
ylim([0 1]);
title('Step response - Overdamped');
xlabel('Time');
ylabel('Amplitude');
legend('C1O(t) poles: -1', 'C2OA(t) poles: -1, -6', 'C2OB(t) poles: -1, -50');
% Important: the distance away of the imaginary axis
% The distance between poles doesn't matter
