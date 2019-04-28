function theta = GradientDescent(X,y,theta,alpha,num_iters)
m = length(y);
for iter = 1:num_iters
    H = X*theta;
    %theta_0 update
    for i=1:m
        theta(1) = theta(1)-alpha*(H(i)-y(i))*X(i,1)/m;
        theta(2) = theta(2)-alpha*(H(i)-y(i))*X(i,2)/m;
    end
%     theta = theta-alpha*(H-y)*X;
end

end