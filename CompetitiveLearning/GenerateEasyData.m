function data = GenerateEasyData()

  for i = 1:1000
    x = rand;
    y = 0.5 + rand*0.5;
    class1Data(i,:) = [x y];
  end
  
  for i = 1:1000
    x = rand;
    y = rand*0.5;
    class2Data(i,:) = [x y];
  end
  
  data = [ones(1000,1) class1Data  ; -ones(1000,1) class2Data ];

end

