num = xlsread('oldfaithful.xlsx');
Er=num(:,2);
Du=num(:,3);

scatter(Er,Du)
hold on 

xlabel('eruption time mins');
ylabel('duration time mins');
X=[Er, Du];
opts = statset('Display','final');
[idx,C] = kmeans(X,2,'Distance','sqeuclidean',...
    'Replicates',5,'Options',opts);
figure;
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12)
hold on
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12)
plot(C(:,1),C(:,2),'kx',...
     'MarkerSize',15,'LineWidth',3) 
legend('Cluster 1','Cluster 2','Centroids',...
       'Location','NW')
title 'Cluster Assignments and Centroids'
hold off


