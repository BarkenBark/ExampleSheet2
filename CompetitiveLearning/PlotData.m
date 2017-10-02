function PlotData(data)

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
  scatter(class1Patterns(1,:), class1Patterns(2,:), 'o');
  scatter(class2Patterns(1,:), class2Patterns(2,:), 'x');
  
end

