% Control Theory
% 15/05/2020
% Nico Antonelli

% --- Roots: Gemetric Locus, More Poles ---


% Example 1: With two Poles:
% TF_open   = k/(s(s+1))   = k/(s^2+s+0)
% TF_closed = k/(s(s+1)+k) = k/(s^2+s+k)

% Characteristic ecuation
% s^2 + s + k  = 0, test with k = [0.1, 0.25, 3]

% G1 Definition
k = 0.1;
num = [k];
den = [1, 1, k];
G1 = tf(num, den);

% G2 Definition
k = 0.25;
num = [k];
den = [1, 1, k];
G2 = tf(num, den);

% G3 Definition
k = 3;
num = [k];
den = [1, 1, k];
G3 = tf(num, den);

hold on;
t = -1:0.01:25;
unistep = t>=0;
plot(t, unistep, '-k');
step(G1, '-r', G2, '-g', G3, '-b');

xlim([-1, 60]);
ylim([0, 1.5]);
title('Impulse responses of Example 1');
legend('Unistep', 'G1, k = 0.1', 'G2, k = 0.25', 'G3, k = 3')
hold off;

figure(2);
pzmap(G1, G2, G3);
title('Pole-Zero Map of Example 1');
legend('G1', 'G2', 'G3')

% Roots: Geometric Locus
% Parameter: TF_open with k = 1
figure(3);
num = [1];
den = [1, 1, 0];
TF_open = tf(num, den);
rlocus(TF_open);
title('Root Locus of Example 1: 1/(s^2+s+0)');


% Example 2: With 3 Poles (only RLocus):
% TF_open_new: k/(s^3+4s^2+8s+0), k = 1
figure(4);
num = [1];
den = [1, 4, 8, 0];
TF_open_new = tf(num, den);
rlocus(TF_open_new);
title('Root Locus of Example 2: 1/(s^3+4s^2+8s+0)');
