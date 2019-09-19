X=[1 0 0;1 1 1;1 3 9;1 4 16];
b=[0;8;8;20];
x=pinv(X)*b;
e=X*x-b;
e_bar=b-9;
R=1-(norm(e)^2/norm(e_bar)^2);
display(R);