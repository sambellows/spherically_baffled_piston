close all; clear; clc;
%
% Plots the end correction of a spherically baffled piston over cone
% half-angle
%
% Produces Figure 2
%
% (c) SDB 2024



% radius of sphere
a = 2;

% cap angle
thetac = linspace(0.001, pi, 200);

% end correction
l = zeros(size(thetac));

for i = 1:length(thetac)

    l(i) = end_correction_spherically_baffled_piston(a, thetac(i));

end


plot(thetac * 180 / pi, l / a, 'k', 'LineWidth', 1.2);
xlim([0, 180]);
ylim([0, 1.1]);
% Replace with degree markers
set(gca, 'XTick', 0:20:180);
for i = 1:10
    labels{i} = sprintf('$%d^\\circ$', (i - 1) * 20);
end
set(gca, 'XTickLabel', labels);
grid on
xlabel('$\theta_c$');
ylabel('$l_{sb} / a$');
set(gca, 'FontSize', 11);

% exportgraphics(gcf, 'Figure2.jpg', 'Resolution', 500);



