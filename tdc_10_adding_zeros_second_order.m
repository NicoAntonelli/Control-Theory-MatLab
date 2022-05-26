% Control Theory
% 07/05/2020
% Nico Antonelli

% --- Second Order System: Addind new zeros analysis ---


clc;
hold on;

% Initial function and definitions
p = [-6, -1];
z = '';
[num, den] = zp2tf(z, p, 1);
G1 = tf(num, den);

% Adding a Zero
z = -50;
[num,den] = zp2tf(z, p, 1/50);
G2 = tf(num, den);

% Another cases
z = -6;
[num,den] = zp2tf(z, p, 1/6);
G3 = tf(num, den);

z= -3;
[num,den] = zp2tf(z, p, 1/3);
G4 = tf(num, den);

z = -1;
[num,den] = zp2tf(z, p, 1);
G5 = tf(num, den);
 
z = -1/2;
[num,den] = zp2tf(z, p,2);
G6 = tf(num, den);

z = 2;
[num,den] = zp2tf(z, p, -1/2);
G7 = tf(num, den);

% Step Responses
step(G1,'-r', G2, '-g', G3, '-b', G4, '-c', G5, 'm', G6, 'y', G7, 'k');

xlabel('Time');
ylabel('Amplitude');
title('Effects of a Zero adition - Second Order System');
legend('No Zeros', 'z = -50', 'z = -6', 'z = -3', 'z = -1', 'z = -1/2', 'z = 2');

hold off;

% Pole-Zero map
figure(2);
pzmap(G1, G2, G3, G4, G5, G6, G7);
legend('No Zeros', 'z = -50', 'z = -6', 'z = -3', 'z = -1', 'z = -1/2', 'z = 2');
