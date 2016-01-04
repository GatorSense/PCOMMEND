PCOMMEND (Piecewise Convex Multiple-Model Endmember Detection and Spectral Unmixing) ReadMe

******
NOTE: If the PCOMMEND Algorithm is used in any publication or presentation, the following reference must be cited:
Zare, A.; Gader, P.; Bchir, O.; Frigui, H., "Piecewise Convex Multiple-Model Endmember Detection and Spectral Unmixing," IEEE Transactions on Geoscience and Remote Sensing, vol.51, no.5, pp.2853-2862, May 2013.
******

The command to run the PCOMMEND code: 

[E,P,U]=PCOMMEND(inputData,parameters)

The inputData is a NxD matrix of N input data points each of D spectral bands (dimensionality).    

The parameters input is a struct with the following fields:

parameters.alpha                 % Regularization Parameter. Range of alpha should be between 0 and 1. 
parameters.changeThresh          % Stopping criteria for the objective function. 
parameters.M                     % Number of Endmembers per endmember set. 
parameters.iterationCap          % Maximum number of iterations.     
parameters.C                     % Number of clusters or number of endmember sets. 
parameters.m                     % Fuzzifier for membership. 
parameters.EPS=.0001;            % Small positive constant. 

The parameters structure can be generated using the PCOMMEND_Parameters.m function.  

The parameters must be adjusted for a particular data set. Generally, m (the fuzzifer) is set to between 1.1 and 2 (usually, 2) depending on the data set. Alpha (the regularization parameter) is generally set to a value between 0.001 and 0.1 depending on the data set. We have also found that PCOMMEND has improved performance if the data has been normalized between 0 and 1 before running PCOMMEND (e.g. subtracting the minimum and then dividing by the max OR normalizing each spectrum by its L2 norm, depending on the application and data set).**

****************************************************************
Simulated Hyperspectral Data Demo: 

To Run the PCOMMEND Algorithm, with the example simulated hyperspectral data set run the scipt -

"PCOMMEND_RunSimulatedData.m"

This script will estimate endmembers and proportions for the simulated hyperspectral data set and plot the results.
****************************************************************

****************************************************************
Run the PCOMMEND Algorithm on a Hyperspectral Image Cube:

Load an HSI image cube into a variable named: Image and then run: PCOMMEND_RunRealData

NOTE: You *will* need to vary the input parameters for real hyperspectral data set. As the default values listed in the current code is for our specific simulated hyperspectral data set. 
****************************************************************

If you have any questions, please contact:

Alina Zare
Electrical and Computer Engineering
University of Missouri
327 Engineering Building West
Columbia, MO 65211
zarea@missouri.edu

 
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
% THIS SOFTWARE IS PROVIDED BY THE UNIVERSITY OF MISSOURI AND
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
% SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE

