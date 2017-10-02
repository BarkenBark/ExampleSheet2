%% Main

data = dlmread('data_ex2_task3_2017.txt');
patterns = data(:,2:3)';
targetOutputs = data(:,1)';

PlotData(data);

k = 100;
beta = 1/2;

nbrOfPatterns = size(patterns, 1);

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














