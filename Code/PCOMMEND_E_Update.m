function E=PCOMMEND_E_Update(U1,m,alpha,P,X,EPS)
%% This function updates the endmembers matrices (one per cluster)
%
% Input:
%   - U:      Fuzzy membership matrix (CxN).
%   - m:      Fuzzifier.
%   - alpha:  Regularization Parameter to trade off between the RSS and V
%             terms
%   - P:      Cell of C abundance matrices. One NxM matrix per cluster.
%   - X:      Pixel points (NxD matrix).
%
% Output:
%   - E:      Cell of C endmembers matrices. One MxD matrix per cluster
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

C    = length(P);
N    = size(X,1);
M    = size(P{1},2);
DP   = EPS*eye(M,M);
Lmda = N*alpha/((M-1)*(1-alpha));
Z    = 2*Lmda*(eye(M,M)-(1/M)*ones(M,M));

for i=1:C
        Y = (repmat((U1(i,:).^m)', [1 M]).*P{i})';
        E{i}=pinv((Y*P{i}+DP) + Z)*Y*X;                                     % Equation 6 in PCOMMEND paper
end
%% end of function
