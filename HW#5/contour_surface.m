
[X,Y] = meshgrid(-500:0.5:500,-500:0.5:500);
Z= (418.9829*2-(X.*sin(sqrt(abs(X)))+Y.*sin(sqrt(abs(Y)))));
C = X.*Y;
surf(X,Y,Z,C)
figure
contour(X,Y,Z)


