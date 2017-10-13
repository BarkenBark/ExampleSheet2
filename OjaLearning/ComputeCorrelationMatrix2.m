function C = ComputeCorrelationMatrix2(patterns, mode)

  if strcmp(mode, 'row')
    C = ComputeCovarianceMatrix(patterns');
    C = corrcov(C);
  elseif strcmp(mode, 'column')
    C = ComputeCovarianceMatrix(patterns);
    C = corrcov(C);  
  end

end

