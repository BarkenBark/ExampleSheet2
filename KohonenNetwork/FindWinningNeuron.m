function winningNeuron = FindWinningNeuron(pattern, weights)
%FindWinningNeuron Returns the winning neuron index, which is the neuron
%whose associated weight vector is closest to the patterns

  nbrOfNodes = size(weights, 1);
  distance = zeros(nbrOfNodes,1);

  for i = 1:nbrOfNodes
    weightVector = weights(i,:)';
    distance(i) = norm(pattern - weightVector);
  end
  
  [~,winningNeuron] = min(distance);

end

