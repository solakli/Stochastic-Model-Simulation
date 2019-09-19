p=0.5; 
u1=zeros(1,300);
u2=zeros(1,300);
x=zeros(1,300);
for i=1:1:300
 for k=1:1:50
    u(k)=rand;
    
if u(k)>p
   x(i)=x(i)+1;
end
end
end
histogram(x);

