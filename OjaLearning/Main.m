%% Main

patterns = dlmread('data_ex2_task2_2017.txt')';
%centeredData = CenterComponents(patterns); %Todo: Write CenterComponents

nbrOfInputNeurons = size(patterns,1);
nbrOfOutputNeurons = 1;

learningRate = 0.001;
nbrOfUpdates = 2*10^4;
weightInterval = [-1 1];
weights = GenerateWeights(nbrOfInputNeurons, nbrOfOutputNeurons, weightInterval);

for i = 1:nbrOfUpdates
  weights = OjaUpdate(weights, pattern, learningRate);
end
