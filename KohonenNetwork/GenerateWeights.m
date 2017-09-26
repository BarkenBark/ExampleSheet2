function [ weights ] = GenerateWeights( nbrOfInputNeurons, nbrOfOutputNeurons, interval )
%GenerateWeights: Generate weights from a uniform distribution on the
%interval (interval). Weights: nbrOfOutputNeurons x nbrOfInputNeurons
    
    a = interval(1);
    b = interval(2);
    weights = zeros(nbrOfOutputNeurons, nbrOfInputNeurons);
    for i=1:nbrOfOutputNeurons
        for j=1:nbrOfInputNeurons
            weights(i,j) = a + (b-a)*rand;
        end
    end

end

