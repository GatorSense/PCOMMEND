function [E,P,U]=PCOMMEND(X,parameters)
%% Main function for PCOMMEND
% This function computes multi-model endmembers and their respective abundances
%
% Input:
%   - X         : Data (N x D) matrix. N data points of dimensionality D.
%   - parameters: The parameters set by PCOMMEND_Parameters function.
%
% Output:
%   - E         : Cell of C endmembers matrices. One MxD matrix per cluster.
%   - P         : Cell of C abundance matrices. One NxM matrix per cluster.
%   - U         : Fuzzy membership matrix CxN.
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

% Initialize parameters
[E,U] = PCOMMEND_Initialize(X,parameters.C,parameters.M);
[N,D] = size(X);
Cond_old = inf;

% Initialize Proportions
for i = 1:parameters.C
      P{i} = ones(N,parameters.M)*(1/parameters.M) ;
end

for iter = 1:parameters.iterationCap
    %Update abundance
    P_old = P;
    P     = PCOMMEND_P_update(X,E,parameters.C,parameters.EPS);

    %Update Endmembers
    E_old = E;
    E     = PCOMMEND_E_Update(U,parameters.m,parameters.alpha,P,X, parameters.EPS);

    %Update fuzzy membership
    U_old = U;
    U     = PCOMMEND_U_update( X,P,E,U,parameters.m);

    %Stopping criteria
    Cond  = norm(U - U_old);
    for i = 1:parameters.C
        Cond = Cond + norm(P{i} - P_old{i}) + norm(E{i} - E_old{i}) ;
    end

    if(abs(Cond - Cond_old) <parameters.changeThresh)
        break;
    end
    Cond_old = Cond;

    if(~mod(iter, 100))
        fprintf('iter= %d   Cond= %f \n', iter, Cond);
    end

end

%% end of function
