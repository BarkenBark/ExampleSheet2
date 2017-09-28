function centeredData = CenterComponents(data, mode)
%CenterComponents Mode = 'row' or 'column' => Center data along row or
%column

  if strcmp(mode, 'row')
    centeredData = data - mean(data,2);
  elseif strcmp(mode, 'column')
    centeredData = data - mean(data,1);
  end

end

