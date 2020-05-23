% Control Theory
% 14/05/2020
% Nico Antonelli

% --- Ramp Response: Stable State Error ---


% TFG = 100 / s(s+5)(s+2)
z = '';
p = [0, -5, -2];
k = 100;
[num, den] = zp2tf(z, p, k);
TFG = tf(num, den);

% R = laplace transform of the input signal, Ramp input is 1/s^2
R = tf(1/s^2);
% Transference function * R = desired response (Ramp representation)
impulse(TFG*R);

xlim();
ylim();
xlabel('Time');
ylabel('Amplitude');
title('Ramp Response');
legend('C1(t)');
