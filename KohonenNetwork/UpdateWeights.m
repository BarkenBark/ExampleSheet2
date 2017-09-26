function newWeights = UpdateWeights(weights, winningNeuron, pattern, learningRate, sigma)
%UpdateWeights Update weights according to the Kohenen rule
  
  newWeights = zeros(size(weights));
  nbrOfNodes = size(weights, 1);
  i0 = winningNeuron;

  for i = 1:nbrOfNodes
    weightVector = weights(i,:)'; %inputSize x 1
    deltaWeightVector = learningRate*NeighboringFunction(i, i0, sigma)...
      *(pattern-weightVector);
    newWeightVector = weightVector + deltaWeightVector;
    newWeights(i,:) = newWeightVector';
  end
  
end

