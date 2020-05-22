% Control Theory
% 17/04/2020
% Nico Antonelli

% --- Critically Damped Systems ---


% G2OA Definition
% G2OA(s) = 1/(s^2+2s+1), Critically Damped
clc;
num = [1];
den = [1, 2, 1]; 
G2OA = tf(num, den);

% G2OB Definition
% G2OB(s) = 1/(s^2+3s+1), Overdamped
num = [1];
den = [1, 3, 1]; 
G2OB = tf(num, den);

% G1O Definition
% First Order System
z = '';
p = -1;
k = 1;
[num,den] = zp2tf(z, p, k);
G1O = tf(num, den);

% Step responses
step(G1O, '-r', G2OA, '-g',G2OB, '-b');

% Graph
xlim([0 6]);
ylim([0 1]);
title('Step response - Critically damped');
xlabel('Time');
ylabel('Amplitude');
legend('C1O(t)', 'C2OA(t)', 'C2OB(t)');
