% Control Theory
% 17/04/2020
% Nico Antonelli

% --- Subdamped Systems, Varying Imaginary Part ---


% G2OA Definition
z = '';
p1 = 1 + 2i;
p2 = 1 - 2i;
p = [-p1; -p2];
k = p1 * p2;
[num,den] = zp2tf(z, p, k);
G2OA = tf(num, den);

% G2OB Definition
p1 = 1 + 3i;
p2 = 1 - 3i;
p = [-p1; -p2];
k = p1 * p2;
[num,den] = zp2tf(z, p, k);
G2OB = tf(num, den);

% G20C Definition
p1 = 1 + 4i;
p2 = 1 - 4i;
p = [-p1; -p2];
k = p1 * p2;
[num,den] = zp2tf(z, p, k);
G2OC = tf(num, den);

% Step responses
step(G2OA, '-r', G2OB, '-g',G2OC, '-b');

% Graph
xlim([0 6]);
ylim([0 1.5]);
title('Step response - Subdamped');
xlabel('Time');
ylabel('Amplitude');
legend('C2OA(t) poles: -1±2i', 'C2OB(t) poles: -1±3i', 'C2OC(t) poles: -1±4i');
