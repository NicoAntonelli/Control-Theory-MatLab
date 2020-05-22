% Control Theory
% 17/04/2020
% Nico Antonelli

% --- First Exercise: Basics ---


% Working with polynomial:

% G(s) = 3s^2+5s+1 / 3s^4+s+1
num = [3, 5, 1];        % numerator
den = [3, 0, 0, 1, 1];	% denominator

% tf: Transference function
G = tf(num, den);

% input: Step function response, shows output graph
step(G);


% Now, working with poles (without zeros for the moment):

% G(s) = 1 / [(s/3 + 1)(s/2 + 1)]
% G(s) = 6 / [(s+3)(s+2)]
z = '';         % zeros (none in this exercise)
p = [-3; -2];	% poles
k = 6;          % poles multiplication

% zp2tf: Zero-pole parameters to transfer function form
[num, den] = zp2tf(z, p, k);

G = tf(num, den);
% step(G)...
