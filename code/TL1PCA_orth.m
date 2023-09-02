function [w] = TL1PCA_orth(data_x, num, a)

% function: TL1PCA by novlty orthognation
% x - data, num - the number of PCs

[data_m,~] = size(data_x);        
w = [];                                        
T = eye(data_m);                      
maxIter = 1000;
tol = 1e-6;

% PCs
for l = 1:num
    
    if(l == data_m)
         T = null(w'); w1=T;
         w=[w,w1];
         break;
    end
    
    x = T'*data_x;
    [m,n] = size(x);        
    w0 = initialization1(x,a);
    fprintf('---------the %d PC---------\n',l);
    fprintf('%d\t%10.8f\n',0,TL1fun(x,w0,a));
    theta0 = rand(1)*pi/2; 
    for i = 1:maxIter
        % compute gradient
        gradf = zeros(m,1);
        for k = 1:n
            gradf = gradf+a*(a+1)*sign(x(:,k)'*w0)*x(:,k)/(a+abs(x(:,k)'*w0))^2;
        end
        
        if (abs(abs(w0'*gradf/(norm(w0)*norm(gradf)))-1)<1e-64)
            disp('Hello')
            while 1 
                noisy = rand(m,1);
                if(noisy'*gradf>0)
                    break;
                end
            end
            noisy = noisy/norm(noisy);   
            epsilon = 0.5; eita = rand(1)*10;
            for j = 1:1000
                g0 = gradf+epsilon*noisy; g0 = g0/norm(g0);
                w1 = w0+eita*g0; w1 = w1/norm(w1);
                if(TL1fun(x,w1,a) >= TL1fun(x,w0,a))
                    break;
                end
                epsilon = epsilon/2;
                eita = eita/2;
            end
            fprintf('%d\t%10.8f\n',i,TL1fun(x,w1,a));
        else
            g = gradf-(gradf'*w0)*w0;
            g0 = g/norm(g);
            while 1
                w1 = w0*cos(theta0)+g0*sin(theta0);
                if(TL1fun(x,w1,a)>=TL1fun(x,w0,a))
                    break;
                end
                theta0=theta0/2;
            end
            fprintf('%d\t%10.8f\n',i,TL1fun(x,w1,a));
            %  update theta1
            theta1 = min(theta0*2,pi/2);
             if(TL1fun(x,w1,a) - TL1fun(x,w0,a) < tol)
                 break;
             end
             theta0 = theta1;
             w0 = w1;
        end
    end    
    w1 = T*w1;
    w = [w,w1];
    T = null(w');
end
disp('Tl1PCA_orth finished');
end





