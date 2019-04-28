function Loss = Lossfunction(theta,X,y)
Loss = 0;
m = length(y);
H = X*theta;
for i=1:m
    Loss = Loss+(H(i)-y(i))^2;
end
Loss = Loss/(2*m);
end