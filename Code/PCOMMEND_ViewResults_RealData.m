function PCOMMEND_ViewResults_RealData(Image, P, E, U,parameters)
%% View Results for Real Data
%
% Input-  Image, P, E, U and parameters
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
%% Flags- Plot
ScatterFlag = 1;                        % View Scatter Plot
subsampleValue = 1;                     % Interval for plotting the data  Increase this value if image is too large to plot
ProportionMaps = 1;                     % View Prop Maps
MembershipMaps = 1;                     % View Membership
ProductMaps = 1;                        % View Product of Prop and Membership
EndmembersPlot = 1;                     % View Endmembers

if(ScatterFlag)
        [numRow, numCol, D] = size(Image);
        IList = reshape(Image, numRow*numCol, D);
        m = mean(IList);
        [t, PCAresults] = pca(IList);
        IList = PCAresults(:, 1:3);
        for i = 1:length(E)
            EE = (E{i} - repmat(m, [size(E{i},1), 1]))*t;
            figure(100+i);
            hold off;
            scatter3(IList(1:subsampleValue:end,1), IList(1:subsampleValue:end,2), IList(1:subsampleValue:end,3), 30, U(i,1:subsampleValue:end),'filled');
            hold on;
            scatter3(EE(:,1), EE(:,2), EE(:,3), 100, 'k', 'filled'); title(['Scatter Plot of Partition ', (num2str(i))]);
        end
end

if(ProportionMaps)
    for i = 1:length(P)
        figure(200+i);
        for j = 1:size(P{i},2)
            subplot(ceil(size(P{i},2)/2), 2, j);
            PP = reshape(P{i}(:,j), [size(Image,1), size(Image,2)]);
            imagesc(PP, [0 1]); title(['Proportion Map of Partition ', (num2str(i)), ' & Endmember ', (num2str(j))]);
        end
    end
end

if(MembershipMaps)
    figure(300); hold off;
    for i = 1:size(U,1);
        subplot(ceil(size(U,1)/2), 2, i);
        MM = reshape(U(i,:), [size(Image,1), size(Image,2)]);
        imagesc(MM, [0 1]);  title(['Membership Map of Partition ', (num2str(i))]);
    end
end

if(ProductMaps)
    for i = 1:length(P)
        figure(500+i); hold off;
        MM = reshape(U(i,:), [size(Image,1), size(Image,2)]);
        for j = 1:size(P{i},2)
            subplot(ceil(size(P{i},2)/2), 2, j);
            PP = reshape(P{i}(:,j), [size(Image,1), size(Image,2)]);
            imagesc(PP.*MM, [0 1]); title(['Product Map of Partition ', (num2str(i)), ' & Endmember ', (num2str(j))]);
        end
    end
end

if(EndmembersPlot)
    for p = 1:parameters.C
        E1 = E{p};
        figure(600+p);
        plot(E1','DisplayName', 'Endmembers');
        xlabel('Wavelength'); ylabel('Reflectance');
        title(['Endmembers in partition ', (num2str(p))]);
    end
end

end

%% end of function
