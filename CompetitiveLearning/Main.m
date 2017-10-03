%% Main
clf; clear all;
clc;

data = dlmread('data_ex2_task3_2017.txt');

%data = GenerateEasyData;

patterns = data(:,2:3)';
targetOutputs = data(:,1)';

%PlotData(data);

k = 4;

nbrOfPatterns = size(patterns, 2);

nbrOfInputNeurons = k;
nbrOfOutputNeurons = size(targetOutputs, 1);
networkDimensions = [k nbrOfOutputNeurons];
weightInterval = [-1 1];
thresholdInterval = [-1 1];
beta = 1/2;
learningRate = 0.1;
TRAINING_STEPS = 3000;


[transformedPatterns, gaussianWeights] = TransformPatterns(patterns, k);

weights = InitializeWeights(weightInterval, nbrOfInputNeurons, nbrOfOutputNeurons);
thresholds = -1 + rand*(thresholdInterval(2) - thresholdInterval(1));

for iSupervisedIterations = 1:TRAINING_STEPS
    
    iRandom = randi(nbrOfPatterns);
    thisPattern = transformedPatterns(:,iRandom);
    zeta = targetOutputs(iRandom);
    
    output = weights*thisPattern - thresholds;
    output = TanActivation(output, beta);
    
    %Update weights
    deltaWeight = zeros(size(weights));
    for j=1:size(weights,2)
        deltaWeight(j) = learningRate*beta*(zeta - output)*(1-output^2)*thisPattern(j,1);
        weights(j) = weights(j) + deltaWeight(j);
    end
    
    %Update Biases
    deltaThresholds = -learningRate*beta*(zeta-output)*(1-output^2);
    thresholds = thresholds + deltaThresholds;
    
end
%%
output = zeros(1,2000);

for i = 1:2000
  thisPattern = transformedPatterns(:,i);
  output(i) = weights*thisPattern - thresholds;
  output(i) = TanActivation(output(i), beta);
end












