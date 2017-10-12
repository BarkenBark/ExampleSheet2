function centeredData = CenterComponents(data, mode)
%CenterComponents Mode = 'row' or 'column' => Center data along row or
%column

  if strcmp(mode, 'row')
    centeredData = data - repmat(mean(data,2), 1, length(data));
  elseif strcmp(mode, 'column')
    centeredData = data - mean(data,1);
  end

end

