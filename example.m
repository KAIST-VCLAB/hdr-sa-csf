%% Comment
% Example of usage of our models.

%% Input
infile = "csf_measurement\csf_13sbj.mat";
addpath("csf_model");

%% Read & preprocess
load(infile, 'calib', 'freqs');
L = calib; % stimulus luminance
Ls = reshape(diag(calib), 1,5); % surrounding luminance
u = reshape(freqs, 1,1,5); % spatial frequency

disp("csf_mat(i,j,k) == oredicted surround-aware CSF at (i,j,k)-th levels of stimulus luminance, surrounding luminance, and spatial frequency, resp., in our experimental setup.");

disp("Practical model:");
csf_mat = SCSF_pract(u, L, Ls);
disp(csf_mat);

disp("Full model:");
csf_mat = SCSF_full(u, L, Ls);
disp(csf_mat);