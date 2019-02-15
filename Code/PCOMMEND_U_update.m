function U=PCOMMEND_U_update(X,P,E,U,m)
%% This function updates the fuzzy membership matrix (CxN).
%
% Input:
%   - X: Pixel points (NxD matrix).
%   - P: Cell of C abundance matrices. One (NxM) matrix per cluster.
%   - E: Cell of C endmembers matrices. One (MxD) matrix per cluster.
%   - U: the fuzzy membership matrix (CxN).
%   - m: Fuzzifier.
%   - EPS: small positive constant.
%
% Output:
%   - U: the fuzzy membership matrix (CxN).
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
N     = size(X,1);
C     = size(U,1);
EPS   = 1e-40;
Dist  = zeros(C,N);

for i = 1:C
    Y         = (X - P{i}*E{i}).^2;
    Dist(i,:) = sum(Y,2);
end

Dist_1 = 1./(((Dist+EPS).^(1/(m-1)))+EPS);
S      = sum(Dist_1,1);
U      = (Dist_1)./repmat(S, [C,1]);                                             % Equation 9 in PCOMMEND paper
%% end of function
