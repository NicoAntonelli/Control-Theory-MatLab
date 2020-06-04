% Control Theory
% 28/05/2020
% Nico Antonelli

% --- Roots: Geometric Locus ---


% GTF1 = k/s+(2+k)
% GTF2 = k/s^2+4s+(1+k) 
% GTF3 = k(s+1)/s(s+2) = (ks+k)/s^2+2s+0
% GTF4 = k/(s+1)(s+2)(s+3)+k = k/s^3+6s^2+11s+(6+k)

% Global Transference Function 1, k = 1
k = 1;
num = [k];
den = [1 , 2+k];
GTF1 = tf(num, den);

% Global Transference Function 2, k = 1
k = 1;
num = [k];
den = [1, 4, 1+k];
GTF2 = tf(num, den);

% Global Transference Function 3, k = 1
k = 1;
num = [k, k];
den = [1, 2, 0];
GTF3 = tf(num, den);

% Global Transference Function 4, k = 1
k = 1;
num = [k];
den = [1, 6, 11, 6+k];
GTF4 = tf(num, den);

% Unistep
t = (-1:0.01:60);
unistep = t>=0;

% Step Responses
hold on;
plot(t, unistep, '-r');
step(GTF1, '-g', GTF2, '-b', GTF3, '-c', GTF4, '-m');
hold off;

% Graphs
xlim([-1, 60]);
ylim([0, 1.2]);
xlabel('Time');
ylabel('Amplitude');
title('System Responses');
legend('Unistep', 'GTF1', 'GTF2', 'GTF3', 'GTF4');

% Roots: Geometric Locus
% Parameter: TF_open
figure(2);
TFG1_open = tf([1], [1, 2]);
rlocus(TFG1_open);
title('Root Locus of TFG1: 1/(s+2)');

figure(3);
TFG2_open = tf([1], [1, 4, 1]);
rlocus(TFG2_open);
title('Root Locus of TFG2: 1/(s^2+4s+1)');

figure(4);
TFG3_open = tf([1, 1], [1, 2, 0]);
rlocus(TFG3_open);
title('Root Locus of TFG3: (s+1)/s^2+2s+0');

figure(5);
TFG4_open = tf([1], [1, 6, 11, 6]);
rlocus(TFG4_open);
title('Root Locus of TFG4: 1/s^3+6s^2+11s+6');
