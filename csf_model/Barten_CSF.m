% Shinyoung Yi 2018
% Ver 1.00 2018/04/24
% Ver 2.00 2018/04/25
%   | enable to give matrix arguments
%   | Critical error fixed: log->log10, arcmin->deg
%   | Test done

% Test the function
% u = [0.1:0.1:1.0, 2.0:1.0:10.0, 20:10:100];
% L = 10.^(-3:4);
% [u,L] = meshgrid(u,L);
% CSF = Barten_CSF(u,L,40);
% surf(u,L,CSF);

% Barten CSF
function res = Barten_CSF(u, L, Xo)
    % Constants
    k = 3.0;
    sigma0 = 0.5/60; % 0.5arcmin
    Cab = 0.08/60;   % 0.08arcmin/mm
    T = 0.1;         % sec
    Xmax = 12;       % deg
    Nmax = 15;       % cycles
    eta = 0.03;
    Phi0 = 3e-8;     % sec deg^2
    u0 = 7;          % cycles/deg
    p = 1.2e+6;      % photons/sec/deg^2/Td
    % Realated functions
    d = 5 - 3*tanh(0.4.*log10(L.*(Xo).^2./(40).^2));
    sigma = sqrt((sigma0).^2 + (Cab.*d).^2);
    Mopt = exp(-2 .* (pi).^2 .* (sigma).^2 .* (u).^2);
    E = pi.*(d.^2)/4 .* L .* (1 - (d/9.7).^2 + (d/12.4).^4);

    res = Mopt/k./sqrt(2/T*(1./(Xo^2) + 1/(Xmax^2) + (u.^2)/(Nmax^2)).*(1/eta/p./E + Phi0./(1-exp(-((u/u0).^2)))));
end