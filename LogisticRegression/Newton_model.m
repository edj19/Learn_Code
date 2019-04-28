function [theta,J] = Newton_model(X,y,iterMax)
[m,n] = size(X);
theta = zeros(n,1);
grad=zeros(n,1);
Hess=zeros(n,n);
Jtheta=0;
i=0;
J = zeros(iterMax,1);
for i=1:iterMax
    z = X*theta;
    h = sigmoid(z);
    grad = (1/m).*transpose(X)*(sigmoid(z)-y);
    Hess = (1/m).*transpose(X)*(diag(sigmoid(z))*(diag(1-sigmoid(z)))*X);
    theta = theta-inv(Hess)*grad;
    J(i) = (1/m)*sum(-y.*log(sigmoid(z))-(1-y).*log(1-sigmoid(z)));
%     for j=1:m
%         z = X(j,:)*theta;
%         grad = grad+ (1/m).*(sigmoid(z)-y(j)).*transpose(X(j,:));
%         Hess = Hess+ transpose(X(j,:))*(sigmoid(z)*(1-sigmoid(z))/m).*X(j,:);
%         Jtheta =Jtheta+ (-y(j)*log(sigmoid(z))-(1-y(j))*log(1-sigmoid(z)))/m;
%     end
%     theta = theta-inv(Hess)*grad;
%     disp(Jtheta)
end
end


function sig=sigmoid(z)
sig = 1.0 ./(1.0+exp(-z));

end
