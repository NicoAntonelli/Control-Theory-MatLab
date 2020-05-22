% Control Theory
% 23/04/2020
% Nico Antonelli

% --- First Order System: Addind new zeros analysis ---


% clc: clear outputs
clc;
% hold on: next graphs doesn't overwrite, they merge
hold on;

% Initial function and definitions
z = '';
[num, den] = zp2tf(z, -1, 1);
G = tf(num, den);
step(G, 'k');

% Adding a Zero
% k = p/z, k* = (1/z - 1)
% The third parameter of zp2tf should be -1/z value (1/8)
z = -8;
[num,den] = zp2tf(z, -1, 1/8);
G = tf(num, den);
step(G,'g');

% Another cases
z = -4;
[num,den] = zp2tf(z, -1, 1/4);
G = tf(num, den);
step(G,'r');

z = -1;
[num,den] = zp2tf(z, -1, 1);
G = tf(num, den);
step(G,'b');

z = -1/2;
[num,den] = zp2tf(z, -1,  2);
G = tf(num, den);
step(G,'y');

z = 2;
[num,den] = zp2tf(z, -1, -1/2);
G = tf(num, den);
step(G,'m');

xlabel('Time');
ylabel('Amplitude');
title('Effects of a Zero adition - First Order System');
legend('No Zeros', 'z = -8', 'z = -4', 'z = -1', 'z = -1/2', 'z = 2');
 
hold off;

% Performance Measures on the Plot Window's Tools
