%% Main

data = dlmread('data_ex2_task3_2017.txt');
patterns = data(:,2:3)';
targetOutputs = data(:,1)';

%scatter(patterns(:,1), patterns(:,2))

k = 100;
networkDimensions = [2 k];
weightInterval = [-1 1];
thresholdInterval = [-1 1];
beta = 1/2;

nbrOfPatterns = size(patterns, 1);

%weights = InitializeWeights(networkDimensions, weightInterval);

transformedPatterns = TransformPatterns(patterns, k);

weights = InitializeWeights(networkDimensions, weightInterval);
thresholds = InitializeThresholds(networkDimensions, thresholdInterval);

for iSupervisedIterations = 1:NUMBER_OF_ITERATIONS
    
    thisPattern = transFormedPatterns(:,randi(nbrOfPatterns));
    output = weights*thisPattern - thresholds;
    output = TanActivation(output, beta);
     = ForwardPropagate(thisPattern, weights);
    weights = BackPropStep()
    
end



input = transformedPatterns

%nbrOfNeurons = 














