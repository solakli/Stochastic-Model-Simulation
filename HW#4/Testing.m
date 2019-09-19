n=10000; %random samples
x=zeros(1,n);
y=zeros(1,n);
f=zeros(1,n);

var=0;
for j=1:1:n
    x(j)=unifrnd(-5,5);
    y(j)=unifrnd(-5,5);
    f(j)=20+(x(j)^2)+(y(j)^2)-10*(cos(2*pi*x(j))+cos(2*pi*y(j)));
end
integral=10*5*sum(f)/n;
for j=1:1:n
    var=var+(f(j)-integral)^2;
    
end

var=var/(n-1);
