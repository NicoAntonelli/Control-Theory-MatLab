% Control Theory
% 05/06/2020
% Nico Antonelli

% --- Proportional Controllers and Transport Delay ---


% Proportional Control - Transference Function
kp = 1;
GcP = tf(kp);

% Gp = Plant - TF (Poles on -0.5 & 1, No Zeros)
z = [''];
p = [-0.5, -1];
k = 1;
[num, den] = zp2tf(z, p, k);
Gp = tf(num, den);

% Unitary Feedback - TF
H = [1];

% Transport Delay
% Pade: Delay (coefficient = 0.5, Taylor polynomial: grade one)
[numD, denD] = pade(0.5, 1);
D = tf(numD, denD);

% TF Open Loop - Without Delay
TfloProp1 = GcP*Gp*H;

% TF Open Loop - Transport Delay
TfloProp2 = GcP*Gp*H*D;

% Proportional Controller Rlocus - Without Delay
figure(2);
rlocus(TfloProp1);
xlim([-6, 8]);
ylim([-4, 4]);
title("Proportional Controller without Delay");

% Proportional Controller Rlocus - Transport Delay
figure(3);
rlocus(TfloProp2);
xlim([-6, 8]);
ylim([-4, 4]);
title("Proportional Controller with Transport Delay");

% Unistep
figure(4);
hold on;
t = (-1:0.01:60);
unistep = t>=0;
plot(t, unistep, '-r');

% Proportional Controller - Output without Delay
% Feedback function = Get the TF Closed Loop
Tflc1 = feedback(GcP*Gp, H);

% Proportional Controller - Output with Transport Delay
Tflc2 = feedback(GcP*Gp*D, H);

% Step Responses
step(Tflc1, '-g', Tflc2, '-b');

% Graphs
xlim([-1, 20]);
ylim([0, 1.2]);
xlabel('Time');
ylabel('Amplitude');
title('Proportional Controllers - System Response');
legend('Unistep', 'TFLC1 - No Delay', 'TFLC2 - Transport Delay');
hold off;
