function PCOMMEND_ViewResults_ToyData(E, parameters, Etrue)
%% View Results for Toy Data
%
% Input-  E, True Endmembers and Paramters
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
%Flags- Plot
EndmembersPlot = 1;                     % View Endmembers
EstEndVsTrueEnd = 1;                    % View Estimated Endmembers vs True Endmembers

if(EndmembersPlot)
    for p = 1:parameters.C
        E1 = E{p};
        figure(600+p);
        plot(E1','DisplayName', 'Endmembers');
        xlabel('Wavelength'); ylabel('Reflectance');
        title(['Estimated Endmembers in partition ', (num2str(p))]);
    end
end

if(EstEndVsTrueEnd)
    End = {Etrue(:,1:3),Etrue(:,4:6)};
    figure(700); hold on;
    for p = 1:parameters.C
        E1 = E{p}';
        plot(E1, 'b');
        plot(End{p}, '--r');
    end
    xlabel('Wavelength'); ylabel('Reflectance');
    title('Estimated Endmembers (solid) vs. True Endmembers (dashed)');
end
clear E1 p;
end
%% end of function
