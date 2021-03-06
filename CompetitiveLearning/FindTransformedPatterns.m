function [transformedPatterns, gaussianWeights] = FindTransformedPatterns( patterns, k )

nbrOfPatterns = size(patterns, 2);
nbrOfInputNeurons = 2;
nbrOfOutputNeurons = k;

weightInterval = [-1 1];
learningRate = 0.02;

NUMBER_OF_ITERATIONS = 10^5;


weights = InitializeWeights(weightInterval, nbrOfInputNeurons, nbrOfOutputNeurons);

for iIterations = 1:NUMBER_OF_ITERATIONS
    
    thisPattern = patterns(:, randi(nbrOfPatterns));
    g = ActivationFunction(thisPattern, weights);
    [~, iWinningNeuron] = max(g);
    deltaWeights = learningRate*(thisPattern' - weights(iWinningNeuron,:));
    weights(iWinningNeuron,:) = weights(iWinningNeuron,:) + deltaWeights;
    
end
    
for i=1:nbrOfPatterns
  g(:,i) = ActivationFunction(patterns(:,i), weights);
end
    
transformedPatterns = g;
gaussianWeights = weights;

end

