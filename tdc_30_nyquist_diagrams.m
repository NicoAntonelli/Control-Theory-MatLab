% Control Theory
% 03/07/2020
% Nico Antonelli

% --- Nyquist Diagrams ---


%% Stable Example
% Open Loop TF: k/(s^4+4s^3+6s^2+5s+2)
k = 1;
num = [k];
den = [1, 4, 6, 5, 2];
TFOL = tf(num, den);

% Minimum Phase Analysis
rlocus(TFOL);
title('Root Locus');

% Nyquist Diagram, Stability Analysis
figure(2);
nyquist(TFOL);
title('Nyquist Diagram');

% Closed Loop TF: k(s+2)/(s^4+4s^3+6s^2+5s+(2+k))
num = [k, k*2];
den = [1, 4, 6, 5, (2+k)];
TFCL = tf(num, den);

% Step Response
figure(3);
step(TFCL);
title('Step Response');

%% Unstable Example
% Open Loop TF: k/(s^4+4s^3+6s^2+5s+2)
k = 10;
num = [k];
den = [1, 4, 6, 5, 2];
TFOL = tf(num, den);

% Minimum Phase Analysis
figure(4);
rlocus(TFOL);
title('Root Locus');

% Nyquist Diagram, Stability Analysis
figure(5);
nyquist(TFOL);
title('Nyquist Diagram');

% Closed Loop TF: k(s+2)/(s^4+4s^3+6s^2+5s+(2+k))
num_cl = [k, k*2];
den_cl = [1, 4, 6, 5, (2+k)];
TFCL = tf(num_cl, den_cl);

% Step Response
figure(6);
step(TFCL);
title('Step Response');

% TFCL Poles
roots(den_cl)

% Poles List:
%   -2.2587 + 1.1771i
%   -2.2587 - 1.1771i
%    0.2587 + 1.3352i
%    0.2587 - 1.3352i
