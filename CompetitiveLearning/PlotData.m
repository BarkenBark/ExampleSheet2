function PlotData(data)

  patterns = data(:,2:3)';
  targetOutput = data(:,1)';

  for i = find(targetOutput == 1)
    class1Patterns = patterns(:,i);
  end
  for i = find(targetOutput = -1);
    class2Patterns = patterns(:,i);
  end

  hold on
  scatter(class1Patterns(1,:), class1Patterns(2,:), 'o');
  scatter(class2Patterns(1,:), class2Patterns(2,:), 'x');
  
end

