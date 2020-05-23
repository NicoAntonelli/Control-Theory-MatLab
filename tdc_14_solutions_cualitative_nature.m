% Control Theory
% 14/05/2020
% Nico Antonelli

% --- Solutions: Cualitative Nature ---


% G1 Definition
num = [1];
den = [1, 2, 2];
G1 = tf(num, den);
% Poles: [-1-i, -1+i]
% Stability: Stable

% G2 Definition
num = [1];
den = [1, 1];
G2 = tf(num, den);
% Poles: [-1]
% Stability: Stable

% G3 Definition
num = [1];
den = [1, -2, 2];
G3 = tf(num, den);
% Poles: [1-i, 1+i]
% Stability: Unstable

% G4 Definition
num = [1];
den = [1, -1];
G4 = tf(num, den);
% Poles: [1]
% Stability: Unstable

% G5 Definition
num = [1];
den = [1, 0, 1];
G5 = tf(num, den);
% Poles: [-i, i]
% Stability: Critically Stable

% G1 & G3 Comparison
impulse(G1, '-r', G3, '-b');
xlim([-2, 10]);
ylim([-10, 10]);
title('Impulse responses');
legend('G1', 'G3')

% G2 & G4 Comparison
figure(2);
impulse(G2, '-g', G4, '-k');
xlim([-2, 10]);
ylim([-2, 6]);
title('Impulse responses');
legend('G2', 'G4')

% G5: Critically Stable
figure(3);
impulse(G5, '-m');
xlim([-2, 10]);
ylim([-6, 6]);
title('Impulse responses');
legend('G5')

% Pole-Zero map of all functions
figure(4);
pzmap(G1, G2, G3, G4, G5);
xlim([-2, 2]);
ylim([-2, 2]);
legend('G1', 'G2', 'G3', 'G4', 'G5')
