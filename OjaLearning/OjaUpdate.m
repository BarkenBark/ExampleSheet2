function newWeights = OjaUpdate(weights, patterns, eta)
%OjaUpdate 

  nbrOfPatterns = length(patterns);
  pattern = patterns(:, randi(nbrOfPatterns));
  
  output = weights*pattern;

  deltaWeights = eta*output*(pattern - output*pattern);
  newWeights = weights + deltaWeights;

end

