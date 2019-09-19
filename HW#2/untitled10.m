n=100; %number of people 
p=0.06; %probability of connection
u=zeros(n,n); %to generate the random numbers
A=zeros(n,n); %generating nxn matrix to select node i j if there is any connection between people
d=zeros(1,100); %generating a sparse array for the histogram bins, 100 bins seemed adequate for me
for k=1:1:100
for i=1:1:n %iterating over rows
    for j=1:1:n %iterating over columns
       if i==j
           A(i,j)=0; %to make sure people no self-connectio  
       end
u(i,j)=rand; %random sampling
if u(i,j)<p
    A(i,j)=1; 
    A(j,i)=1;  %ensuring if 2 nodes connectied they should be connected in both ways since it is an undirected graph.
else 
    A(i,j)=0;
    A(j,i)=0;
end
    end
G=graph(A); %putting the matrix values in a graph
d(k)=numedges(G); %counting the degree of a graph for each sample k
end
end

histogram(d); 

