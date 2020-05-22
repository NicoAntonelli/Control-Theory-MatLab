% Control Theory
% 30/04/2020
% Nico Antonelli

% --- Impulse Response, Varying Real & Imaginary Part ---


% General
hold on;
z = '';
k = 1;
% function: impulse

% GA1 Definition
p1 = -2.5 + 3.5824i;
p2 = -2.5 - 3.5824i;
p = [p1; p2];
[num,den] = zp2tf(z, p, k);
GA1 = tf(num, den);

% GA2 Definition
p1 = -1.5 + 3.5824i;
p2 = -1.5 - 3.5824i;
p = [p1; p2];
[num,den] = zp2tf(z, p, k);
GA2 = tf(num, den);

% GA3 Definition
p1 = -0.5 + 3.5824i;
p2 = -0.5 - 3.5824i;
p = [p1; p2];
[num,den] = zp2tf(z, p, k);
GA3 = tf(num, den);

% GB1 Definition
p1 = -2 + 3.5i;
p2 = -2 - 3.5i;
p = [p1; p2];
[num,den] = zp2tf(z, p, k);
GB1 = tf(num, den);

% GB2 Definition
p1 = -2 + 5i;
p2 = -2 - 5i;
p = [p1; p2];
[num,den] = zp2tf(z, p, k);
GB2 = tf(num, den);

% GB3 Definition
p1 = -2 + 6.5i;
p2 = -2 - 6.5i;
p = [p1; p2];
[num,den] = zp2tf(z, p, k);
GB3 = tf(num, den);

% Impulse responses (only varying real part)
impulse(GA1, '-r', GA2, '-g', GA3, '-b');

% Graph
title('Impulse responses');
xlabel('Time');
ylabel('Amplitude');
legend('GA1', 'GA2', 'GA3')

% Impulse responses (only varying imaginary part)
figure(2)
impulse(GB1, '-c', GB2, '-m', GB3, '-y');

% Graph
title('Impulse responses');
xlabel('Time');
ylabel('Amplitude');
legend('GB1', 'GB2', 'GB3')

hold off;

% Pole-Zero map of all functions
figure(3);
pzmap(GA1, GA2, GA3, GB1, GB2, GB3);
legend('GA1', 'GA2', 'GA3', 'GB1', 'GB2', 'GB3');
