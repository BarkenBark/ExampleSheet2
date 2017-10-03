function PlotDecisionBoundary(weights, thresholds, gaussianWeights, beta, resolution, plotRange)

  xmin = plotRange(1); xmax = plotRange(2);
  ymin = plotRange(3); ymax = plotRange(4);
  
  X = linspace(xmin, xmax, resolution);
  Y = linspace(ymin, ymax, resolution);
  [X, Y] = meshgrid(X,Y);
  
  output = zeros(resolution);
  for i = 1:resolution
    for j = 1:resolution
      x = X(i,j); 
      y = Y(i,j);
      pattern = [x; y];
      g = ActivationFunction(pattern, gaussianWeights);
      output(i,j) = weights*g - thresholds;
      output(i,j) = TanActivation(output(i,j), beta);
      output(i,j) = sign(output(i,j));
    end
  end
  
  j = 0;
  for i = find(output == 1)'
    j = j+1;
    class1Patterns(:,j) = [X(i); Y(i)];
  end
  j = 0;
  for i = find(output == -1)'
    j = j+1;
    class2Patterns(:,j) = [X(i); Y(i)];
  end
  size(class1Patterns)
  size(class2Patterns)

  hold on
  scatter(class1Patterns(1,:), class1Patterns(2,:), 'o');
  scatter(class2Patterns(1,:), class2Patterns(2,:), 'x');

end

