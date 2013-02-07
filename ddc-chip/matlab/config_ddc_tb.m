
config = [];

% Do not edit the code above.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% 4'b add + 16'b control word
config(end+1) = 2^16 + 8;

config(end+1) = 0; % disable config interface


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not edit the code below.

config(:,2) = config(:,1);
config(:,1) = [1:size(config,1)] / 80e6;

