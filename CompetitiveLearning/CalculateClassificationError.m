function [ tCE ] = CalculateClassificationError( networkOutputs, targetOutputs )
    
    tCE = 0; %totalClassificationError
    for i=1:length(targetOutputs)
        tCE = tCE + abs(targetOutputs(i) - sign(networkOutputs(i)));
    end
    
    tCE = tCE/(2*length(targetOutputs));


end

