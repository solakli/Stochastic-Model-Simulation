%--------------a---------------%
n=1000; %random samples
x=zeros(1,n);
f=zeros(1,n);

var=0;
for j=1:1:n
    x(j)=unifrnd(0.8,3.0);
    f(j)=(1+sinh(2*x(j))*log(x(j)))^-1;
    
end
integral=(3.0-0.8)*sum(f)/n;
for j=1:1:n
    var=var+(f(j)-integral)^2;
    
end
var=var/(n-1);

%--------------a---------------%


%--------------b---------------%

n=1000; %random samples
x=zeros(1,n);
y=zeros(1,n);
f=zeros(1,n);

var=0;
for j=1:1:n
    x(j)=unifrnd(-pi,pi);
    y(j)=unifrnd(-pi,pi);
    f(j)=exp(-x(j)^4-y(j)^4);
    
end
integral=(2*pi)*(2*pi)*sum(f)/n;
for j=1:1:n
    var=var+(f(j)-integral)^2;
    
end
var=var/(n-1);


%--------------b---------------%
