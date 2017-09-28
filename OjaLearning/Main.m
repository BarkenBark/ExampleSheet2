%% Main

clc; clear all;

patterns = dlmread('data_ex2_task2_2017.txt')';
%patterns = CenterComponents(patterns, 'row');

nbrOfInputNeurons = size(patterns,1);
nbrOfOutputNeurons = 1;

learningRate = 0.001;
nbrOfUpdates = 2*10^4;
weightInterval = [-1 1];
weights = GenerateWeights(nbrOfInputNeurons, nbrOfOutputNeurons, weightInterval);

weightsModulus = zeros(nbrOfUpdates, 1);

iSecondSubplot = 3;
for iTwoRuns = 1:2
    
    if iTwoRuns == 2
        patterns = CenterComponents(patterns, 'row');
    end
    
    for i = 1:nbrOfUpdates
        weights = OjaUpdate(weights, patterns, learningRate);
        weightsModulus(i) = norm(weights);
    end
    
    subplot(2, 2, iTwoRuns);
    plot(1:nbrOfUpdates, weightsModulus);
    
    subplot(2, 2, iSecondSubplot)
    scatter(patterns(1,:), patterns(2,:), '.')
    hold on
    %vectarrow([0 0], [weights(1) weights(2)])
    
    iSecondSubplot = iSecondSubplot + 1;
end

hold off

%% Check properties of weight vector

C = ComputeCorrelationMatrix(patterns, 'row');










