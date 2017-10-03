function [ tCE ] = CalculateClassificationError( patternInputs, patternOutputs, weights, biases, beta )
    
    outputs = weights * patternInputs - biases;
    activatedOutputs = TanActivation(outputs, beta);
    tCE = 0; %totalClassificationError
    for i=1:size(patternInputs,2)
        tCE = tCE + abs(patternOutputs(i) - sign(activatedOutputs(i)));
    end
    
    tCE = tCE/(2*size(patternInputs,2));


end

