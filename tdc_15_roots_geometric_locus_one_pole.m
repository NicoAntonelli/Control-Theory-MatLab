% Control Theory
% 15/05/2020
% Nico Antonelli

% --- Roots: Geometric Locus, One Pole ---


% TF_open   = k/(s+2)
% TF_closed = k/(s+2+k)

% Characteristic ecuation
% s + 2 + k = 0, test with k = [1, 3, 5]

% G1 Definition
k = 1;
num = [k];
den = [1, 2+k];
G1 = tf(num, den);

% G2 Definition
k = 3;
num = [k];
den = [1, 2+k];
G2 = tf(num, den);

% G3 Definition
k = 5;
num = [k];
den = [1, 2+k];
G3 = tf(num, den);

hold on;
t = -1:0.01:25;
unistep = t>=0;
plot(t, unistep, '-k');
step(G1, '-r', G2, '-g', G3, '-b');

xlim([-1, 3]);
ylim([0, 1.2]);
title('Step responses');
legend('Unistep', 'G1, k = 1', 'G2, k = 3', 'G3, k = 5')
hold off;

figure(2);
pzmap(G1, G2, G3);
legend('G1', 'G2', 'G3')

% Roots: Geometric Locus
% Parameter: TF_open with k = 1
figure(3);
num = [1];
den = [1, 2];
TF_open = tf(num, den);
rlocus(TF_open);
