function centeredData = CenterComponents(data, mode)
%CenterComponents Mode = 'row' or 'column' => Center data along row or
%column

  if strcmp(mode, 'row')
    centeredData = zscore(data, 0, 2);
  elseif strcmp(mode, 'column')
    centeredData = zscore(data, 0, 1);
  end

end

