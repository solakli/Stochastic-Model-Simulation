R=xlsread('nips-87-92.xlsx');
X=R(2:end,3:end);
[num,txt,raw]=xlsread('nips-87-92.xlsx','B2:B701');
[idx,C,sumd]=kmeans(X,4); %elbow method is used, so we pick k at the point where sumd abrubtly decrease. This is a heuristic algorithm rather than optimal

A=cell(700,1);
B=cell(700,1);
E=cell(700,1);
D=cell(700,1);
for i=1:1:700
    if idx(i)==1
        A(i)=txt(i);
        
    end
    if idx(i)==2
        B(i)=txt(i);
    end
    if idx(i)==3
        E(i)=txt(i);
    end
    if idx(i)==4
        D(i)=txt(i);
    end
    
end
    
    
    