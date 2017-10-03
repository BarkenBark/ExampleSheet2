function transformedPatterns = TransformPatterns( patterns, k )
    
k = 100;
networkDimensions = [2 k];
weightInterval = [-1 1];
learningRate = 0.02;
NUMBER_OF_ITERATIONS = 10^5;

nbrOfPatterns = size(patterns, 2);




weights = InitializeWeights(weightInterval, networkDimensions);
for iIterations = 1:NUMBER_OF_ITERATIONS
    
    thisPattern = patterns(:, randi(nbrOfPatterns));
    g = ActivationFunction(thisPattern, weights);
    [~, iWinningNeuron] = min(g);
    deltaWeights = learningRate*(thisPattern' - weights(iWinningNeuron,:));
    weights(iWinningNeuron,:) = weights(iWinningNeuron,:) + deltaWeights;
    
end
    
    for i=1:nbrOfPatterns
        g(:,i) = ActivationFunction(patterns(:,i), weights);
    end
    
    transformedPatterns = g;

end

