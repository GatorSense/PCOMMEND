%% This script will run PCOMMEND algorithm for HSI image data, requires the HSI cube to be in a variable named 'Image' to be loaded in memory
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

%set parameters, these need to be adjusted for each particular image. 
parameters.alpha        = 0.01;         % Regularization Parameter. Range of alpha should be between 0 and 1.
parameters.M            = 3;            % Number of Endmembers per endmember set. 
parameters.C            = 2;            % Number of clusters or number of endmember sets. 
parameters.m            = 2;            % Fuzzifier for membership. 
parameters.iterationCap = 2000;         % Maximum number of iterations.     
parameters.changeThresh = 1e-8;         % Stopping criteria for the objective function. 
parameters.EPS          = 0.0001;       % Small positive constant. 

%normalize image
Image               = Image - min(Image(:));
Image               = Image / max(Image(:));

%Reshape Image
[numRow, numCol, D] = size(Image);
X                   = reshape(Image, numRow*numCol, D);

%Run PCOMMEND
[E,P,U]             = PCOMMEND(X,parameters);

%Visualize Results
PCOMMEND_ViewResults_RealData(Image, P, E, U, parameters) ; 
%% end of script

