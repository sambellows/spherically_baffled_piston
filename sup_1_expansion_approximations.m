close all; clear; clc;
%
% This code demonstrates the values of the limitng values of small cap size
% on the expansion coefficients and also demonstrates the infinite
% summation to integral approximation
%
% 


%% Small angle approximation of An

% small cap size (10 degrees)
thetac = 3 * pi / 180;

% Calculate the first 200 terms of An using Eq. (5)
N = 200;


% First compute using legendre polynomials
nn = (1:N)';

An = zeros(N + 1, 1);

Pm = legendrep(nn - 1, cos(thetac));
Pp = legendrep(nn + 1, cos(thetac));

An(1) = 0.5 * (1 - cos(thetac));
An(2:end) = 0.5 * (Pm - Pp);

% Caluclate the first 200 terms of An using Eq. (14)

n = (0:N)';
Anh = besselj(1, (n + 0.5) * thetac) * thetac;

% find maximum percentage relative difference
err = max(abs((An - Anh) ./ An));
fprintf('Maximum percent error was: %.5f percent\nfor cap half-angle %.2f degrees\n\n', err * 100, thetac * 180 / pi);


%% Make a figure for small cases

% small cap size (10 degrees)
thetac = 1 * pi / 180;

% Calculate the first 200 terms of An using Eq. (X)
N = 1000;


% First compute using legendre polynomials
nn = (1:N)';

An = zeros(N + 1, 1);

Pm = legendrep(nn - 1, cos(thetac));
Pp = legendrep(nn + 1, cos(thetac));

An(1) = 0.5 * (1 - cos(thetac));
An(2:end) = 0.5 * (Pm - Pp);

% Caluclate the first 200 terms of An using Eq. (x)

n = (0:N)';
Anh = besselj(1, (n + 0.5) * thetac) * thetac;

figure;
% plot the results
scatter(n, An, 5, 'r', 'filled');
hold on
scatter(n, Anh, 10, 'k');
hold off
grid on
ylabel('$A_n$');
xlabel('$n$');
legend('Calculation with Legendre Polynomials', 'Calculation with Bessel Functions', ...
    'Location', 'best');









