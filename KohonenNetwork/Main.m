%% Main

NUMBER_OF_ITERATIONS = 10^4;

nbrOfPatterns = 1000; %p
outputDimension = 100; %M

patterns = GeneratePatterns(nbrOfPatters); %Return 2xnbrOfPatterns matrix
inputDimension = size(patterns, 1); %N
weights = GenerateWeights(inputDimension, outputDimension); %Return outputDimensionxinputDimension matrix

for iteration = 1:NUMBER_OF_ITERATIONS
  
  if iteration < T_order
    learningRate = initialLearningRate*exp(-iteration/tau);
  else
    learningRate = 0.01;
  end
  
  pattern = patterns(:, randi(nbrOfPatterns)); %Select random pattern
  winningNeuron = FindWinningNeuron(pattern, weights);
  weights = UpdateWeights(weights, winningNeuron, pattern, learningRate, sigma);
  
end




