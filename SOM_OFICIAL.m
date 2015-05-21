function [y, i] = closest(x, ys)
% [Y, I] = CLOSEST(X, YS) returns point Y and index I of closest point in
% YS to X.

xs = repmat(x, size(ys, 1), 1);

d = eucdist(xs, ys);

s = sum(d, 2);

[ignore, i] = min(s);

y = ys(i,:);

function d = eucdist(x, y)
% D  = EUCDIST(X, Y) returns Euclidean distance between vectors X and Y.

d = mag(x-y);

function i = index_of_closest(x, w)
% I = INDEX_OF_CLOSEST(X, W) takes length-N vector X nad MxN matrix W
% and returns row I of W closest to X.
[ignore, i] = closest(x, w);

function y = mag(x)
% Y = MAG(X) returns magnitude Y = ||X||.

y = sqrt(sum(abs(x).^2, 2));

function obj = pickrand(objs)
% OBJ = PICKRAND(OBJS) returns a random object OBJ from a vector or cell
% array OBJS of objects.  If OBJS is a matrix, PICKRAND returns a random
% row from the matrix.

i = randindex(objs);

if size(objs, 1) > 1
    obj = objs(i,:);
else
    obj = objs(i);
end

function i = randindex(objs)
% I = RANDINDEX(OBJS) returns a random index into a vector or cell
% array OBJS of objects.  If OBJS is a matrix, RANDINDEX returns a random
% row index from the matrix.

if size(objs, 1) > 1
    i = 1+fix(rand*size(objs,1));
else
    i = 1+fix(rand*length(objs));
end

function i = randindex(objs)
% I = RANDINDEX(OBJS) returns a random index into a vector or cell
% array OBJS of objects.  If OBJS is a matrix, RANDINDEX returns a random
% row index from the matrix.

if size(objs, 1) > 1
    i = 1+fix(rand*size(objs,1));
else
    i = 1+fix(rand*length(objs));
end


function y = scale(ival, fval, frac)
% Y = SCALE(IVAL, FVAL, FRAC) temporal scaling function
y = ival + frac * (fval - ival);


function [a,w]  = som(x, n, tmax, seed)
% SOM Kohonen's two-dimensional Self-Organizing Map
%     A  = SOM(X, N, TMAX) returns an N-by-N matrix A of output nodes 
%     learned as an unsupervised map from input vectors X, using Kohonen's 
%     Self-Oganizing Map algorithm.  Matrix A contains indices of X. TMAX 
%     is the number of time steps to to run.   Empirically-determined 
%     learning  parameters are hard-coded in the source code and can be 
%     modified.
%
%     [A,W]  = SOM(X, N, TMAX) also returns the N^2 weights on A.
%
%     SOM(X, N, TMAX, SEED) supports seeding the random-number 
%     generator for reproducible results.
%
%     See also SOMLEARN, PLOT_NODES.

% learning parameters

MU_I        = 0.5;          % learning rate: initial
MU_F        = 0.1;          %              : final

SIGMA_I     =  3.0e0;       % attraction between points : initial
SIGMA_F     =  1.0e-1;      %                           : final

% seed random-number generator if specified
if nargin > 7
    rand('state', seed)
end

% set up NxN grid
[o(:,1), o(:,2)] = ind2sub([n n], 1:n^2);

% create random initial weights
w = rand(n^2, size(x,2));

% run SOM learning for specified number of steps
for t = 1:tmax
    w = somlearn(w, o, x, MU_I, MU_F, SIGMA_I, SIGMA_F, t, tmax);
end

% return grid of input indices
a = zeros(n,n);
for i = 1:size(o,1)
    j = o(i,1);
    k = o(i,2);
    a(j,k) = index_of_closest(w(i,:), x);
end


function w = somlearn(w, u, x, mu_i, mu_f, sigma_i, sigma_f, t, tmax)
% SOMLEARN  Run one step of learning using Kohonen's Self-Organizing Map.
%    W = SOMLEARN(W, U, X, MU_I, MU_F, SIGMA_I, SIGMA_F, T, TMAX) returns
%    new weights W based on current weights W, output vectors U, and input
%    vectors X.  Remaining parameters specify weight update according to 
%    the formulas:
%
%         mu_t = MU_I + T/TMAX * (MU_F - MU_I)
%    
%         sigma_t = SIGMA_I + T/TMAX * (SIGMA_F - SIGMA_I)
%  
%         aleph(i, k) = e^(-|u_i-u_k|^2 / 2 * sigma_t^2)
%    
%         w_i = w_i + mu_t * aleph(i, k) * (x - w_i) 
%
%     where w_i is the weight vector associate with output vector u_i, and
%     u_k is the output vector that wins the competition on this round.

% randomly choose an input vector x
x_pick = pickrand(x);

% determine the winning output node i closest to x
i = index_of_closest(x_pick, w);

% update weights and track weight changes
w = update_weights(w, u, x_pick, i, t, tmax, mu_i, mu_f, sigma_i, sigma_f);


function w = update_weights(w, u, x_pick, i, t, tmax, ...
                            mu_i, mu_f, sigma_i, sigma_f)
% UPDATE_WEIGHTS  Update weights for Kohonen's Self-Organizing Map.
%     Generally this function should not be called directly, but is called
%     automatically by SOMLEARN.  See SOMLEARN for an explanation of the
%     parameters.

% scale learning paramters by elapsed time                        
tfrac = t / tmax;
mu = scale(mu_i, mu_f, tfrac);
sigma = scale(sigma_i, sigma_f, tfrac);

% udpate the weights, tracking mean weight change
for k = 1:size(w, 1)
    aleph = exp(-sum((u(i,:)-u(k,:)).^2) / (2*sigma^2));
    dw = mu * aleph * (x_pick - w(k,:));
    w(k,:) = w(k,:) + dw; 
end