function transformedPatterns = TransformPatterns( patterns, gaussianWeights )

nbrOfPatterns = size(patterns, 2);
k = size(gaussianWeights, 1);
g = zeros(k, nbrOfPatterns);

for i=1:nbrOfPatterns
  g(:,i) = ActivationFunction(patterns(:,i), gaussianWeights);
end

transformedPatterns = g;

end
