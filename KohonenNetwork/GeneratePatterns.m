function patterns = GeneratePatterns(nbrOfPatterns)
%GenerateData Generated datapoints (patterns) uniformily distributed on the
%shape in Example Sheet 2

  patterns = zeros(2, nbrOfPatterns);
  
  for i = 1:nbrOfPatterns
    patterns(:,i) = [rand rand]';
    while patterns(1,i) > 0.5 && patterns(2,i) < 0.5
    patterns(:,i) = [rand rand]';
    end
  end

end

