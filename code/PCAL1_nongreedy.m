function [w] = PCAL1_nongreedy(x, num)

% function£ºpca based on L1-norm maximization with non-greedy method

% Feiping Nie, Heng Huang, Chris Ding, Dijun Luo, Hua Wang.
% Principal Component Analysis with Non-Greedy L1-Norm Maximization.
% The 22nd International Joint Conference on Artificial Intelligence (IJCAI), Barcelona, 2011.

[x_m,x_n] = size(x);                
w = pca(x','Centered',false,'NumComponents',num);
maxIter = 1000;

p0 = 0;
for i = 1:maxIter
    p = ones(num,x_n);
    wx = w'*x;
    p(wx<0) = -1;
    p(wx==0) = 0;
    dp = abs(p-p0);
    if max(dp(:))>0
        b = x*p';
        [u,s,v] = svds(b,num);
        w =u(:,1:num)*v';
        fprintf('%d\t%10.8f\n',i,sum(abs(wx(:))));
    else
        fprintf('%d\t%10.8f\n',i,sum(abs(wx(:))));
        break;
    end
    p0 = p;
end



