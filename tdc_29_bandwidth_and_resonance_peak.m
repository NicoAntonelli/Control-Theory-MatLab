% Control Theory
% 03/07/2020
% Nico Antonelli

% --- Bandwidth and Resonance Peak ---


%% Bandwith
% Closed Loop TF 1: 1/(s+1)
TFCL1 = tf([1], [1, 1]);
bode(TFCL1, '-b');
title('Bode Diagram 1');

% Closed Loop TF 1: 1/(3s+1)
figure(2);
TFCL2 = tf([1], [3, 1]);
bode(TFCL2, '-r');
title('Bode Diagram 2');

% Step Responses
figure(3);
step(TFCL1, TFCL2);
title('Step Responses');
xlabel('Time');
ylabel('Amplitude');
legend('C(t) TFCL1', 'C(t) TFCL2');

%% Resonance Peak
% Bode Diagrams Comparison
figure(4);
TFCL1 = tf([9], [1, 3, 9]);   % TFCL1: 9/(s^2+3s+9)
TFCL2 = tf([9], [1, 0.5, 9]); % TFCL2: 9/(s^2+0.5s+9)
bode(TFCL1, TFCL2);
title('Bode Diagrams');
legend('TFCL1', 'TFCL2');

% Step Responses (Overshoot Analysis)
figure(5);
step(TFCL1, TFCL2);
title('Step Responses');
xlabel('Time');
ylabel('Amplitude');
legend('C(t) TFCL1', 'C(t) TFCL2');

%% Note
% Closed Loop on Bode Diagrams ONLY for this type of measurements
% For something different to Bandwidth & Resonance, use Open Loop
