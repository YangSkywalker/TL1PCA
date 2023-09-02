function [fw] = LpSPCA(x,d,p,sparse)
% Ref sparse PCA by Lp-norm maximization[J].
% Multiple Features version
% Data is the training and testing dataset
% d is the number of the dimensionality reduction
% p is the Lp-norm
% sparse is the sparse of the projections
% Code is written by: Wei-Jie Chen, wjcper2008@126.com

%% Initialization
[m,n] = size(x);
fw = zeros(n,d); 
subX =x;

%% Greedy Search Algorithm find multiple features
for k=1:d
    Norm2X = sum(subX.^2,2).^0.5;
    [~,index] = max(Norm2X);
    w = x(index,:)';w = w/norm(w); 
    Sgn =zeros(m,1);
    
    fprintf('------------the %d PC------------\n',k);
    fprintf('%d\t%10.8f\n', 0,Lpfun(x',w,p));
    
    for j=1:600
        WX = subX*w;
        Sgn(WX>=0)=1;Sgn(WX<0) = -1; 
        WX = abs(WX).^(p-1);
        wn = subX'*(Sgn.*WX);
        iw = sort(abs(wn), 'descend');
        iw(n+1) = 0;
        beta = abs(wn)- iw(sparse+1);beta(beta<0) = 0;
        wn = sign(wn).*beta;
        wn = wn/norm(wn); 
        if sum(subX*wn==0)>0
            if sum(subX(subX*wn==0,:)*sign(wn)~=0)>0
                wn = wn + (rand(n, 1)-0.5)*eps;
                wn = wn/norm(wn);
            end
        end
        
        fprintf('%d\t%10.8f\n', j,Lpfun(x',wn,p));
        
        if norm(w-wn) < 10^-2
            break; 
        end
        w = wn;   
    end
    
    fw(:,k) = wn;
    subX = subX - (subX*wn)*wn';

end
end