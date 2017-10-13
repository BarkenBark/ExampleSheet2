function covarianceMatrix = ComputeCovarianceMatrix( patterns, mode )

  if strcmp(mode, 'row')
    nbrOfVariables = size(patterns, 1);
    nbrOfPatterns = size(patterns, 2);
    covarianceMatrix = zeros(nbrOfVariables);
    meanValue = zeros(nbrOfVariables, 1);
    for i = 1:nbrOfVariables
      meanValue(i) = mean(patterns(i,:));
    end
    for i = 1:nbrOfVariables
      for j = 1:nbrOfVariables
        covarianceMatrix(i,j) = 1/nbrOfPatterns * ...
          sum((patterns(i,:)-meanValue(i)).*patterns(j,:)-meanValue(j));
      end
    end
  elseif strcmp(mode, 'column')
    nbrOfVariables = size(patterns, 2);
    nbrOfPatterns = size(patterns, 1);
    covarianceMatrix = zeros(nbrOfVariables);
    meanValue = zeros(1, nbrOfVariables);
    for i = 1:nbrOfVariables
      meanValue(i) = mean(patterns(:,i));
    end
    for i = 1:nbrOfVariables
      for j = 1:nbrOfVariables
        covarianceMatrix(i,j) = 1/nbrOfPatterns * ...
          sum((patterns(:,i)-meanValue(i)).*(patterns(:,j)-meanValue(j)));
      end
    end
  end

end

