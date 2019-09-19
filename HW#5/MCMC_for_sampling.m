%%
nsamples=1000;
delta=0.5;
pd1 =@(x) betapdf(x,1,8);
pd2= @(x)betapdf(x,9,1);
pdf = @(x)( 0.6*pd1(x) + 0.4*pd2(x));


start=0;
proppdf = @(x,y)normpdf(y-x,0,1);
proprnd = @(x) x + rand*2*delta - delta;
tic;
smpl =  mhsample(start,nsamples,'pdf',pdf,'proppdf',proppdf,'proprnd',proprnd);
t=toc;
xxhat = cumsum(smpl.^2)./(1:nsamples)';
figure;
plot(1:nsamples,xxhat)

figure;
h = histfit(smpl,50);
h(1).FaceColor = [.8 .8 1];
