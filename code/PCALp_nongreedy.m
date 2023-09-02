function [w] = PCALp_nongreedy(x, num, p)

% function£ºpca based on Lp-norm maximization with non-greedy method

% Nojun Kwak, Member, IEEE.
% Principal Component Analysis by Lp-norm Maximization.
% IEEE Transactions on Cybernetics, 2014. 

[x_m,x_n] = size(x);                     
w0=pca(x','Centered',false,'NumComponents',num);
% w0 = orth(rand(x_m,num));     
maxIter = 1000;
tol = 1e-2;

fprintf('%d\t%10.8f\n',0,Lpfun(x,w0,p));

for i=1:maxIter
    m = zeros(x_m,num);
    for j=1:num
        for k=1:x_n
            m(:,j) = m(:,j)+sign(w0(:,j)'*x(:,k))*(abs(w0(:,j)'*x(:,k)))^(p-1)*x(:,k);
        end
    end
    [u,s,v] = svds(m,num);
    w=u*v';
    fprintf('%d\t%10.8f\n',i,Lpfun(x,w,p));
    % stop criteration
    if(sqrt(trace((w-w0)'*(w-w0))) < tol || abs(Lpfun(x,w,p) - Lpfun(x,w0,p)) < 1e-4)
        break;
    end
    w0=w;
end

end




