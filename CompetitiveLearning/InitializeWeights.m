function [ weights ] = InitializeWeights( interval, nbrOfInputNeurons, nbrOfOutputNeurons )
%InitializeWeights: Creates a matrix with weights with
%dimensions(dimensions=[M, N]). Values for weights are chosen randomly from
%a uniform distribution on the interval (interval = [-x, +x]).

    weights = zeros(nbrOfOutputNeurons, nbrOfInputNeurons);
    for i=1:size(weights,1)
        for j=1:size(weights,2)
            weights(i,j) = interval(1)+(interval(2)-interval(1))*rand;
        end
    end

end

