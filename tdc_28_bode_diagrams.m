% Control Theory
% 19/06/2020
% Nico Antonelli

% --- Bode Diagrams ---


%% First Example: Stable
% Yeah, "%%" opens a new section OMG

% Open Loop TF - Bode Diagram
TFOL = zpk([-70], [0, -4, -25], 8);
bode(TFOL);
title('Bode Diagram of Example 1');

% Step Response
figure(2);
TFDT = TFOL; % Direct Transference TF (With Unitary Feedback)
TFCL = feedback(TFDT, 1); % Closed Loop TF - Step Response
step(TFCL);
title('Step Response of Example 1');

%% Second Example: Unstable

figure(3);
TFOL = zpk([], [0, -1, -1], 10);
bode(TFOL);
title('Bode Diagram of Example 2');

figure(4);
TFDT = TFOL;
TFCL = feedback(TFDT, 1);
step(TFCL);
title('Step Response of Example 2');

%% Third Example: Critically Stable

figure(5);
TFOL = zpk([], [0, -1, -1], 2);
bode(TFOL);
title('Bode Diagram of Example 3');

figure(6);
TFDT = TFOL;
TFCL = feedback(TFDT, 1);
step(TFCL);
title('Step Response of Example 3');
