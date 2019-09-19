
n=20; %number of samples
k=50; %number of estimates
z=20; %number of variance estimates
v=zeros(1,z);
for t=1:1:z
p_bar=zeros(1,k);
for i=1:1:k
u1=zeros(1,n);
u2=zeros(1,n);
x=zeros(1,n);

 for j=1:1:n
    u1(j)=rand;
    u2(j)=rand;
 if ((u1(j))^2+(u2(j))^2)<=1
     x(j)=1;
 end
 
end
 p_bar(i)=4*(sum(x)/n);
end
histogram(p_bar);

v(t)= var(p_bar);
n=n+20;
end
figure
plot(v,'-o');
ylim([0 0.2])
