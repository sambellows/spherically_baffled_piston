close all; clear; clc;
% Evaluate the validity of the sum to integral approximation
%
%
% Using a 1e-3 degree piston with about 2 million terms!! is necessary to 
% achieve within 3 significant digits of the value of the infinitely
% baffled case

thetac = 0.001 * pi / 180;
N = 2e6;

n = (0:N)';

Bn = besselj(1, (n + 0.5) * thetac);

Qn = Bn.^2 ./ (thetac * (n + 1) .* (n + 1/2));


eta = (n + 1/2) * thetac;

f = besselj(1, eta).^2 ./ eta.^2;


figure;
plot(eta, f * thetac, 'k', 'LineWidth', 1.5);
hold on
scatter(eta, Qn, 2, 'r', 'filled');
grid on
hold off
xlabel('$\eta$');
legend('Continuous Approximation', 'Infinite Summation Series');

lh = 2 * sum(Qn);
fprintf('End correction is: %.3fa \n compared to: %.3fa\n of an infinitely baffled circular piston\n\n', lh, 8 / (3 * pi));






