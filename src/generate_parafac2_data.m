%% Generate data from the constrained PARAFAC2 model
% Author: Søren Føns Vind Nielsen (sfvn at dtu dot dk)

p = 3; % number of brain regions
T = 200; % number of time points
S = 10; % number of subjects

X = nan(p,T,S); % data matrix
R = randn(p); % R matrix
C = nan(p,S); % subject specific scores in the columns of C
P = nan(p,T,S);
noise = 0.01; % noise level

% For each subject...
for s = 1:S
    C(:,s) = rand(p,1);
    D = diag(C(:,s));
    P(:,:,s) = orth(randn(p,T)')';
    X(:,:,s) = D*R*P(:,:,s) + noise*randn(p,T); % add a little bit of noise
 end