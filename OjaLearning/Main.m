%% Main

clc; clear all;

patterns = dlmread('data_ex2_task2_2017.txt')';
%centeredData = CenterComponents(patterns); %Todo: Write CenterComponents

nbrOfInputNeurons = size(patterns,1);
nbrOfOutputNeurons = 1;

learningRate = 0.001;
nbrOfUpdates = 2*10^4;
weightInterval = [-1 1];
weights = GenerateWeights(nbrOfInputNeurons, nbrOfOutputNeurons, weightInterval);

weightsModulus = zeros(nbrOfUpdates, 1);

for iTwoRuns = 1:2
    
    if iTwoRuns == 2
        patterns = CenterComponents(patterns, 'columns');
    end
    
    for i = 1:nbrOfUpdates
        weights = OjaUpdate(weights, patterns, learningRate);
        
        weightsModulus(i) = norm(weights);
    end
    
    subplot(1, 2, iTwoRuns);
    plot(1:nbrOfUpdates, weightsModulus);
    
end

