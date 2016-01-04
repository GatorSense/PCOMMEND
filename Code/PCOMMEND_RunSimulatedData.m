%% This script will run PCOMMEND algorithm for simulated data.
%
% This product is Copyright (c) 2013 University of Missouri, University
% of Florida and University of Louisville.
% All rights reserved.
%
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions
% are met:
%
%   1. Redistributions of source code must retain the above copyright
%      notice, this list of conditions and the following disclaimer.
%   2. Redistributions in binary form must reproduce the above copyright
%      notice, this list of conditions and the following disclaimer in the
%      documentation and/or other materials provided with the distribution.
%   3. Neither the name of the University nor the names of its contributors
%      may be used to endorse or promote products derived from this software
%      without specific prior written permission.
%
% THIS SOFTWARE IS PROVIDED BY THE UNIVERSITY OF FLORIDA AND
% CONTRIBUTORS ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES,
% INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
% MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
% DISCLAIMED.  IN NO EVENT SHALL THE UNIVERSITY OR CONTRIBUTORS
% BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
% EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
% LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES,
% LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
% HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
% CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
% OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
% SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
%% 
% load endmembers from ASTER spectral library
load 'Etrue.mat';

% Generate Proportions and Data
N = 1000; 
A        = repmat(ones(1,3), [N, 1]);
Y        = randg(A) ; 
v        = sum(Y,2);
Pt       = Y./repmat(v, [1, size(A,2)]);  %Proportions generated from uniform Dirichlet distribution
P        = zeros(N, 6);
P(1:floor(N/2),1:3)   = Pt(1:floor(N/2),:);
P(floor(N/2)+1:N,4:6) = Pt(floor(N/2)+1:N,:);
X = P*Etrue' + randn(N, size(Etrue,1))*.0001; %Add zero-mean Gaussian random noise

% PCOMMEND
[parameters] = PCOMMEND_Parameters();
[E,P,U]=PCOMMEND(X,parameters);
PCOMMEND_ViewResults_ToyData( E,parameters,Etrue); 
%% end of script

