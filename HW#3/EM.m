%------------------a-------------------%

mu = [3 5;-3 -5]; %generating a mean matrix, where each row represents the mean of two different gaussian distribution
sigma = cat(3,[2 .5],[1 1]); % 1-by-2-by-2 array
gm = gmdistribution(mu,sigma); %generates gaussian mixture distribution using EM algorithm, taking samples from 2 different gaussian represented with their mean and variance
figure
ezsurf(@(x,y)pdf(gm,[x y])) %surface plot

%------------------a-------------------%
%------------------b-------------------%

mu1 = [1 2];          % Mean of the 1st component
sigma1 = [2 0; 0 .5]; % Covariance of the 1st component
mu2 = [-3 -5];        % Mean of the 2nd component
sigma2 = [1 0; 0 1];  % Covariance of the 2nd component


rng('default') % For reproducibility
r1 = mvnrnd(mu1,sigma1,1000); %generating random numbers using respective mu and sigmas, chosen from multivaraite normal disribution
r2 = mvnrnd(mu2,sigma2,1000);
X = [r1; r2]; %putting the numbers in to the Matrix X
gm = gmdistribution.fit(X,2); %fits the distribution using Expectation maximization algorithm to construct gm distribution object containing maximum likelihood estimates of the parameters

scatter(X(:,1),X(:,2),10,'.') % Scatter plot with points of size 10
hold on
ezcontour(@(x,y)pdf(gm,[x y]),[-8 6],[-8 6]) %plotting the level curves on the scatter plot

%------------------b-------------------%

%------------------c-------------------%
mu1 = [1 2];          % Mean of the 1st component
sigma1 = [2 0; 0 .5]; % Covariance of the 1st component
mu2 = [-3 -5];        % Mean of the 2nd component
sigma2 = [1 0; 0 1];  % Covariance of the 2nd component

rng('default') % For reproducibility
r1 = mvnrnd(mu1,sigma1,300);
r2 = mvnrnd(mu2,sigma2,300);
X = [r1; r2];
tic
gm = gmdistribution.fit(X,2);
toc
scatter(X(:,1),X(:,2),10,'.') % Scatter plot with points of size 10
hold on
ezcontour(@(x,y)pdf(gm,[x y]),[-8 6],[-8 6])

%------------------c-------------------%
num = xlsread('oldfaithful.xlsx');
Er=num(:,2);
Du=num(:,3);
X=[Er, Du];
gm = gmdistribution.fit(X,2);
figure
scatter(X(:,1),X(:,2),'.')
ezcontour(@(x,y)pdf(gm,[x y]),[-8 6],[-8 6])

%------------------d-------------------%

