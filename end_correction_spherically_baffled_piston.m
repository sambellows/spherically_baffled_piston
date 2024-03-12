function l = end_correction_spherically_baffled_piston(a, thetac)
% END_CORRECTION_SPHERICALLY_BAFFLED_PISTON end correction for a radially
% vibrating cap on a sphere
%
% l = end_correction_spherically_baffled_piston(a, thetac)
%
% calculates the end correction for a radially vibrating cap on a sphere
%
% Input Parameters:
%   a: (scalar) [m] sphere radius
%   thetac: (scalar) [rad] cap half-angle (in radians)
%
% Returns:
%   l: (scalar) [m] end correction
%
% (c) 2024 Samuel D. Bellows



% Use Bessel Function approximation for very small cap size 
% (less than 1 degrees), otherwise use Legendre polynomials
%
if thetac < 1 * pi / 180

    % Use many terms for these small limits
    N = 1e6;
    n = (0:N)';

    An = besselj(1, (n + 1/2) * thetac) * thetac;

else

    
    N = 2e3;
    n = (0:N)';

    nn = (1:N)';

    An = zeros(N + 1, 1);

    Pm = legendrep(nn - 1, cos(thetac));
    Pp = legendrep(nn + 1, cos(thetac));

    An(1) = 0.5 * (1 - cos(thetac));
    An(2:end) = 0.5 * (Pm - Pp);

end


% Expansion coefficients
Qn = An.^2 ./ (2 * n + 1) ./ (n + 1);

% End correction
l = 2 * a / (1 - cos(thetac)) .* sum(Qn);



end