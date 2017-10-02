function g = ActivationFunction(x, weights)
    
    g = zeros(size(weights,1), 1);
    for i = 1:size(weights,1)
        g(i) = exp(-(norm(x'-weights(i,:)))^2/2 );
    end
    
    g = g/sum(g);


end

