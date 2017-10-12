function output = testGaussianFunction(input, gaussianNode, gaussianNodeStrength)

  nbrOfGaussianNodes = size(gaussianNode, 2);
  
  output = 0;
  for iNode = 1:nbrOfGaussianNodes
    iNode;
    output = output + ...
      gaussianNodeStrength(iNode)*exp(-norm(input-gaussianNode(:,iNode))^2);
  end

  output = sign(output);
  
end