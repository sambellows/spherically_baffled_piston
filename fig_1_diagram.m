close all; clear; clc;
%
% Plot a diagram for a radially vibrating cap on a sphere
%
% Produces Fig. 1
%
% (c) SDB 2024

% Sphere radius
a = 1;
phi = linspace(0, 2 * pi);

[x, y] = polar2cartesian(a, phi);

% Cap half-angle
thetac = pi / 6;
phi = linspace(-thetac, thetac) + pi / 2;

[xc, yc] = polar2cartesian(a, phi);

phi = linspace(-thetac, 0) + pi / 2;
[xa, ya] = polar2cartesian(0.2 * a, phi);



plot(x,  y, 'k', 'LineWidth', 0.7);
hold on
plot(xc, yc, 'r', 'LineWidth', 2);
plot(xa, ya, 'k', 'LineWidth', 1.2);

plot(1.1 * [0, 0], 1.1 * [-a, a], 'k--', 'LineWidth', 0.5);
plot(1.1 * [-a, a], 1.1 * [0, 0],  'k--', 'LineWidth', 0.5);

plot([0, xc(1)], [0, yc(1)], 'k:');
plot([0, xc(end)], [0, yc(end)], 'k:');
plot([0, xc(1)], [a * cos(thetac), yc(1)], 'k:');

text(0.03, 0.25, '$\theta_c$', 'FontSize', 12);
text(0.3, 0.4, '$a$', 'FontSize', 12);
text(0.1, 0.8, '$a\sin\theta_c$', 'FontSize', 12);



axis off
axis equal

% exportgraphics(gcf, 'Figure1.jpg', 'resolution', 600);


function [x, y] = polar2cartesian(r, phi)

x = r .* cos(phi);
y = r .* sin(phi);

end


