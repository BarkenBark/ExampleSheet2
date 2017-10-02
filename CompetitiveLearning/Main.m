%% Main

data = dlmread('data_ex2_task3_2017.txt');
patterns = data(:,2:3)';
targetOutputs = data(:,1)';

PlotData(data);

k = 100;
<<<<<<< HEAD
nbrOfOutputNeurons = size(targetOutputs, 1);
networkDimensions = [nbrOfOutputNeurons k];
weightInterval = [-1 1];
thresholdInterval = [-1 1];
=======
>>>>>>> f0afba3e8334c788dbcd3e852aea7ca57cac9d2c
beta = 1/2;
TRAINING_STEPS = 3000;

nbrOfPatterns = size(patterns, 1);

transformedPatterns = TransformPatterns(patterns, k);

weights = InitializeWeights(networkDimensions, weightInterval);
thresholds = InitializeThresholds(networkDimensions, thresholdInterval);

for iSupervisedIterations = 1:TRAINING_STEPS
    
    iRandom = randi(nbrOfPatterns);
    thisPattern = transFormedPatterns(:,iRandom);
    zeta = targetOutputs(iRandom);
    
    output = weights*thisPattern - thresholds;
    output = TanActivation(output, beta);
    
    %Update weights
    deltaWeight = zeros(1,k);
    for j=1:size(weights,2)
        deltaWeight(1,j) = learningRate*beta*(zeta - output)*(1-output^2)*input(j,1);
        weights(1,j) = weights(1,j) + deltaWeight(1,j);
    end
    
    %Update Biases
    deltaBiases = learningRate*beta*(zeta-output)*(1-output^2);
    biases = biases - deltaBiases;
    
end














