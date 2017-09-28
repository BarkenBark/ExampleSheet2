function C = ComputeCorrelationMatrix(patterns, mode)

  if strcmp(mode, 'row')
    C = cov(patterns');
    C = corrcov(C);
  elseif strcmp(mode, 'column')
    C = cov(patterns);
    C = corrcov(C);  
  end

end

