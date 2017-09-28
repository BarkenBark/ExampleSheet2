%% Main

clc; clf; clear all;

patterns = dlmread('data_ex2_task2_2017.txt')';
centeredPatterns = CenterComponents(patterns, 'row');

nbrOfInputNeurons = size(patterns,1);
nbrOfOutputNeurons = 1;

learningRate = 0.001;
nbrOfUpdates = 2*10^4;
weightInterval = [-1 1];
weights = GenerateWeights(nbrOfInputNeurons, nbrOfOutputNeurons, weightInterval);

stepLength = 50;
weightsModulus = zeros(nbrOfUpdates/stepLength, 1);

weightModulusPlot = zeros(nbrOfUpdates/stepLength, 1);

Weights = cell(2,1);
iSecondSubplot = 3;
for iCase = 1:2
    
    if iCase == 1
      data = patterns;
    elseif iCase == 2
      data = centeredPatterns;
    end
    
    for i = 1:nbrOfUpdates
        weights = OjaUpdate(weights, data, learningRate);
        if mod(i,stepLength) ==0
            weightsModulus(i/stepLength) = norm(weights);
            weightModulusPlot(i/stepLength) = i;
        end
    end
    
    subplot(2, 2, iCase);
    plot(weightModulusPlot, weightsModulus);
    axis([0 nbrOfUpdates 0.9999 1.0004])
    
    subplot(2, 2, iSecondSubplot)
    scatter(data(1,:), data(2,:), '.')
    hold on
    quiver(0, 0, weights(1),weights(2), 0, 'LineWidth', 2)
    
    iSecondSubplot = iSecondSubplot + 1;
    
    Weights{iCase} = weights;
end

hold off

%% Check properties of weight vector

C1 = ComputeCorrelationMatrix(patterns, 'row');
weights1 = Weights{1};
[V1,D1] = eig(C1);
[lambdaMax1, I] = max(D1);
eigenVec1 = V1(:,2);

C2 = ComputeCorrelationMatrix(centeredPatterns, 'row');
weights2 = Weights{2};
[V2,D2] = eig(C2);
eigenVec2 = V2(:,2);
lambdaMax2 = D2(2,2);









