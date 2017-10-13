function centeredData = CenterComponents(data, mode)
%CenterComponents Mode = 'row' or 'column' => Center data along row or
%column

  if strcmp(mode, 'row')
    centeredData = data - mean(data,2);
    %centeredData(1,:) = centeredData(1,:)/(std(centeredData(1,:)));
    %centeredData(2,:) = centeredData(2,:)/(std(centeredData(2,:)));
  elseif strcmp(mode, 'column')
    centeredData = data - mean(data,1);
  end

end

