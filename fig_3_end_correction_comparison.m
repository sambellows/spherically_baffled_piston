close all; clear; clc;
%
% This code does a comparison of the end corrections scaled by the
% spherical cap radius
%
% Produces Fig. 3
%
% (c) SDB 2024



% radius of sphere
a = 1;

% cap angle (angles greater than 90 degrees don't really make sense here
thetac = linspace(0.001, pi / 2, 300);

l = zeros(size(thetac));

for i = 1:length(thetac)

    l(i) = end_correction_spherically_baffled_piston(a, thetac(i));

end

% normalized by cap radius
lsp = l ./ (a * sin(thetac));

% baffled circular psiton
lbp = 8 / (3 * pi);

% unbaffled circular piston
lubp = 0.6133;

thetacd = thetac * 180 / pi;


plot(thetacd, lsp, 'k', 'LineWidth', 1.5);
hold on
plot(thetacd, lbp * ones(size(thetacd)), 'k--', 'LineWidth', 0.8);
plot(thetacd, lubp * ones(size(thetacd)), 'k--', 'LineWidth', 0.8);
hold off
xlim([0, 90]);
ylim([0.5, 1]);

angles = 0:15:90;
set(gca, 'XTick', angles);
for i = 1:length(angles)
    labels{i} = sprintf('$%d^\\circ$', angles(i));
end
set(gca, 'XTickLabel', labels);
grid on

xlabel('$\theta_c$');
ylabel('$l_{sb} / a_c$');
set(gca, 'FontSize', 11);
text(15, 0.86, 'Baffled Circular Piston ($l/a_p \approx 0.8488$)');
text(15, 0.599, 'Unbaffled Circular Pipe ($l/a_p \approx 0.6133$)');
set(gca, 'FontSize', 10);
legend('$l_{sb}/a_c$', 'location', 'northeast');


% exportgraphics(gcf, 'Figure3.jpg', 'Resolution', 500);






