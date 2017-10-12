function [d1, d2] = PlotData(data)

  patterns = data(:,2:3)';
  targetOutput = data(:,1)';

  j = 0;
  for i = find(targetOutput == 1)
    j = j+1;
    class1Patterns(:,j) = patterns(:,i);
  end
  j = 0;
  for i = find(targetOutput == -1)
    j = j+1;
    class2Patterns(:,j) = patterns(:,i);
  end

  hold on
  d1 = scatter(class1Patterns(1,:), class1Patterns(2,:), 'o', 'LineWidth', 1, ...
    'MarkerEdgeColor', 'blue', 'MarkerEdgeAlpha', 0.8);
  d2 = scatter(class2Patterns(1,:), class2Patterns(2,:), 'o', 'LineWidth', 1, ...
    'MarkerEdgeColor', 'red', 'MarkerEdgeAlpha', 0.8);
  
end

