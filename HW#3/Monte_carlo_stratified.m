%--------------a---------------%


n=1000; %random samples
lambda=0.25;
Na=lambda*n;
Nb=n-Na;
x1=zeros(1,Na);
f1=zeros(1,Na);
x2=zeros(1,Nb);
f2=zeros(1,Nb);
var1=0;
var2=0;
for j=1:1:Na
    x1(j)=unifrnd(0.8,0.8+(3.0-0.8)*lambda);
    f1(j)=(1+sinh(2*x1(j))*log(x1(j)))^-1;
    
end
integral1=(((3.0-0.8)*lambda))*sum(f1)/Na;
for j=1:1:Na
    var1=var1+(f1(j)-integral1)^2;
    
end
var1=var1/(Na-1);
for j=1:1:Nb
    x2(j)=unifrnd((0.8+(3.0-0.8)*lambda),3);
    f2(j)=(1+sinh(2*x2(j))*log(x2(j)))^-1;
    
end
integral2=((3.0-0.8)*(1-lambda))*sum(f2)/Nb;

integral=integral1+integral2;

for j=1:1:Nb
    var2=var2+(f2(j)-integral2)^2;
    
end
var2=var2/(Nb-1);
var=(lambda/n)*var1+((1-lambda)/n)*var2;

%--------------a---------------%

%--------------b---------------%

n=1000; %random samples
lambda=0.4;
Na=lambda*n;
Nb=n-Na;
x1=zeros(1,Na);
y1=zeros(1,Na);
f1=zeros(1,Na);
x2=zeros(1,Nb);
y2=zeros(1,Nb);
f2=zeros(1,Nb);
var1=0;
var2=0;
for j=1:1:Na
    x1(j)=unifrnd(-pi,-pi+(pi-(-pi))*lambda);
    y1(j)=unifrnd(-pi,pi);
    f1(j)=exp(-x1(j)^4-y1(j)^4);
end
integral1=(pi-(-pi))*(pi-(-pi))*lambda*sum(f1)/Na;
for j=1:1:Na
    var1=var1+(f1(j)-integral1)^2;
    
end
var1=var1/(Na-1);
for j=1:1:Nb
    x2(j)=unifrnd((-pi+(pi-(-pi))*lambda),pi);
    y1(j)=unifrnd(-pi,pi);
    f2(j)=exp(-x2(j)^4-y2(j)^4);
    
end
integral2=((pi-(-pi))^2)*(1-lambda)*sum(f2)/Nb;

integral=integral1+integral2;

for j=1:1:Nb
    var2=var2+(f2(j)-integral2)^2;
    
end
var2=var2/(Nb-1);
var=(lambda/n)*var1+((1-lambda)/n)*var2;

%--------------b---------------%
