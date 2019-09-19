function y = @(x) schwefel(x)
d = length(x);
sum = 0;
for ii = 1:1:d
	xi = x(ii);
	sum = sum + xi*sin(sqrt(abs(xi)));
end

y = 418.9829*d - sum;

end
