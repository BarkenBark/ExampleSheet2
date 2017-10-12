%% Test gaussian nodes circle theory

nbrOfGaussianNodes = 2*4;
figure
axis([-1 1 -1 1])
gaussianNode = ginput(nbrOfGaussianNodes)';
scatter(gaussianNode(:,1), gaussianNode(:,2));
axis([-1 1 -1 1])

gaussianNodeStrength = ones(nbrOfGaussianNodes/2, 1);
gaussianNodeStrength = [gaussianNodeStrength ; -gaussianNodeStrength]
gaussianNodeStrength(nbrOfGaussianNodes/2) = 5;
gaussianNodeStrength(nbrOfGaussianNodes) = -5;


resolution = 100;
xmin = -1; xmax = 1;
ymin = -1; ymax = 1;

X = linspace(xmin, xmax, resolution);
Y = linspace(ymin, ymax, resolution);
[X, Y] = meshgrid(X,Y);

output = zeros(resolution);

for i = 1:resolution
  for j = 1:resolution
    x = X(i,j);
    y = Y(i,j);
    pattern = [x; y];
    output(i,j) = testGaussianFunction(pattern, ...
      gaussianNode, gaussianNodeStrength);
  end
end

j = 0;
for i = find(output == 1)'
  j = j+1;
  class1Patterns(:,j) = [X(i); Y(i)];
end
j = 0;
for i = find(output == -1)'
  j = j+1;
  class2Patterns(:,j) = [X(i); Y(i)];
end

size(class1Patterns)
size(class2Patterns)

hold on
color1 = [0.4 0.4 1];
color2 = [1 0.4 0.4];
scatter(class1Patterns(1,:), class1Patterns(2,:), '.', 'filled', ...
  'MarkerFaceColor', color1, 'LineWidth', 0.2, 'MarkerEdgeColor',...
  color1);
scatter(class2Patterns(1,:), class2Patterns(2,:), '.', 'filled', ...
  'MarkerFaceColor', color2, 'LineWidth', 0.2, 'MarkerEdgeColor', ...
  color2);

w = scatter(gaussianNode(1,:), gaussianNode(2,:), 'square', 'filled', ...
  'LineWidth', 2, 'MarkerEdgeColor', 'black', 'MarkerFaceColor', 'white');

%legend([d1, d2, w], 'Class +1', 'Class -1', 'Gaussian weights')

