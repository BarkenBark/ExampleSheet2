%% Main

NUMBER_OF_ITERATIONS = 10^4;
T_ORDER = 10^3;

nbrOfPatterns = 1000; %p
outputDimension = 100; %M

sigma_initial = 100;
learningRate_initial = 0.1;
tauSigma = 300;

patterns = GeneratePatterns(nbrOfPatters); %Return 2 x nbrOfPatterns matrix
inputDimension = size(patterns, 1); %N
weights = GenerateWeights(inputDimension, outputDimension); %Return outputDimension x inputDimension matrix

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




