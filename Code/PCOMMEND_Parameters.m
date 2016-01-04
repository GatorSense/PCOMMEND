function [parameters] = PCOMMEND_Parameters()
%%   This function sets the parameters to be used for PCOMMEND code
%  parameters - struct - The struct contains the following fields:
%                   1. alpha : Regularization Parameter to trade off
%                       between the RSS and V terms of ICE and PCOMMEND
%                       (0<alpha<1)
%                   2. changeThresh: Stopping Criteria, Change threshold
%                       for Objective Function.
%                   3. M: Number of endmembers per cluster.
%                   4. iterationCap: Maximum number of iterations.
%                   5. C: Number of clusters.
%                   6. m: Fuzzifier.
%                   7. EPS: small positive constant.
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
%
%% NOTE:  ALL PARAMETERS MUST BE ADJUSTED FOR A PARTICULAR DATA SET

parameters.alpha        = 0.0001;         % Regularization Parameter. Range of alpha should be between 0 and 1.
parameters.changeThresh = 1e-5;         % Stopping criteria for the objective function. 
parameters.M            = 3;            % Number of Endmembers per endmember set. 
parameters.iterationCap = 1500;         % Maximum number of iterations.     
parameters.C            = 2;            % Number of clusters or number of endmember sets. 
parameters.m            = 2;            % Fuzzifier for membership. 
parameters.EPS          = 0.0001;       % Small positive constant. 
%% end of function