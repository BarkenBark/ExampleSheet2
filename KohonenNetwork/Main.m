%% Main

T_ORDER = 10^3;
T_CONV = 2*10^4;
NUMBER_OF_ITERATIONS = T_ORDER + T_CONV;

nbrOfPatterns = 1000; %p
outputDimension = 100; %M

sigma_initial = 100;
learningRate_initial = 0.1;
tauSigma = 300;

patterns = GeneratePatterns(nbrOfPatterns); %Return 2 x nbrOfPatterns matrix
inputDimension = size(patterns, 1); %N
weightInterval = [-1, 1];
weights = GenerateWeights(inputDimension, outputDimension, weightInterval); %Return outputDimension x inputDimension matrix

for iteration = 1:NUMBER_OF_ITERATIONS
  
  if iteration <= T_ORDER
    learningRate = TimeDependentEta(iteration, learningRate_initial, tauSigma);
    sigma = TimeDependentSigma(iteration, sigma_initial, tauSigma);
  else
    learningRate = 0.01;
    sigma = 0.9;
  end
  
  pattern = patterns(:, randi(nbrOfPatterns)); %Select random pattern
  winningNeuron = FindWinningNeuron(pattern, weights);
  weights = UpdateWeights(weights, winningNeuron, pattern, learningRate, sigma);
  
end




