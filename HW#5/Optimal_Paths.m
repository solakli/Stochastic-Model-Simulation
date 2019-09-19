N=1000*rand(n,2);
no_of_soln=factorial(n-1)/2;
TSP = @(x,y,z,a,b,c,d,e,f,g)(sum((x-y).^2).^0.5+sum((z-y).^2).^0.5+sum((a-z).^2).^0.5+sum((b-a).^2).^0.5+sum((c-b).^2).^0.5+sum((d-c).^2).^0.5+sum((e-d).^2).^0.5+sum((f-e).^2).^0.5+sum((g-f).^2).^0.5);
loss = @(p)TSP(p(1),p(2),p(3),p(4),p(5),p(6),p(7),p(8),p(9),p(10));
