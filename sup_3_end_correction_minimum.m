close all; clear; clc;
% Find the minimum value of the end correction using a brute-force search
%
%
%
% 

a = 1;

% This obtains a fine resolution
thetac = linspace(0.88, 0.884, 1e3);

lm = zeros(size(thetac));

for i = 1:length(thetac)

    lm(i) = end_correction_spherically_baffled_piston(a, thetac(i));

end

ln = lm ./ (a * sin(thetac));

figure;
plot(thetac, ln)

[val, ind] = min(ln);

hold on
scatter(thetac(ind), val, 'r', 'filled');


fprintf('Minimum value was %.6f at an angle of %.2f degrees\n\n', val, thetac(ind) * 180 / pi);


