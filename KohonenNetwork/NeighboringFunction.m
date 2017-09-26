function value = NeighboringFunction(i1, i2, sigma)
%NeighboringFunction Returns a value in the range (0,1] where larger values
%indicate that i1 and i2 are topologically close in the output space.
    
    value = exp(-(i1-i2)^2/(2*sigma^2));

end

