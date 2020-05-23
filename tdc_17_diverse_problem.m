% Control Theory
% 21/05/2020
% Nico Antonelli

% --- Diverse Problem ---


% G1   = 1/s
% G2   = k/s^2+s+1
% H	   = 1/s+2
% GTF  = (G1*G2)/1+(G1*G2*H)

% Global Transference Function 1, k = 1
k  = 1;
G1 = tf([1], [1 , 0]);
G2 = tf([k], [1, 1, 1]);
H  = tf([1], [1, 2]);
GTF1 = (G1*G2)/(1+G1*G2*H);

% Global Transference Function 2, k = 2 
k  = 2;
G1 = tf([1], [1 , 0]);
G2 = tf([k], [1, 1, 1]);
H  = tf([1], [1, 2]);
GTF2 = (G1*G2)/(1+G1*G2*H);

t = (-1:0.01:60);
unistep = t>=0;

hold on;
plot(t, unistep, '-r');
step(GTF1, '-g', GTF2, '-b');
hold off;

xlim([-1, 60]);
ylim([0, 6]);
xlabel('Time');
ylabel('Amplitude');
title('System Responses');
legend('Unistep', 'GTF1, Stable', 'GTF2, Unstable');
% GTFs' value = k(s+2)/s^4+3s^3+3s^2+2s+k
% GTF1 Stable State Error = 1
% GTF2 Never Stabilizes

figure(2);
pzmap(GTF1, GTF2);
legend('GTF1, Stable', 'GTF2, Unstable');
