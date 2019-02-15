function [Membership, Centers] = PCOMMEND_fcm(X, NumClusters)
%% This funciton will initialize Membership matrix using Fuzzy C Means
%
% Input:
% 	- X: (NxD) Data matrix
%   - Number of clusters
%
% Output:
% 	- U: Membership (CxN)
%	- Centers (CxD)
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

mFuzzifier = 2;

%Initialization
stopThresh = 1e-5;
[NumPoints, NumDims] = size(X);
ImageList = X';
Membership = rand(NumPoints, NumClusters);
Membership = Membership./repmat(sum(Membership')', [1, NumClusters]);
Centers = ones(NumClusters, NumDims);
continueFlag = 1;

while(continueFlag)
    prevMembership = Membership;

    %Update Cluster Centers
    Centers = ((Membership.^mFuzzifier)'*ImageList')./repmat(sum((Membership.^mFuzzifier))', [1, NumDims]);

    %Update Membership
    D = (1./(pdist2(ImageList', Centers)).^2).^(1/(mFuzzifier-1));
    S = sum((D)')';
    Membership = D./repmat(S, [1, NumClusters]);

    %Check Convergence
    n = max(max(abs(Membership - prevMembership)));
    if(n < stopThresh)
        continueFlag =0;
    end

end

Membership = Membership';
%% end of function
