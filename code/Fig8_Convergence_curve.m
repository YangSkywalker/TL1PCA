clear all; clc;
% =======artifical dataset ================
load artifical1.mat; 
data = [x;y];
outlier=[-4,4.8;-3.7,5.1;-3.3,6;-2.4,5.5]';
alldata=[data,outlier];

% set parameter
x=data';  
num=1;
a=100;  
fvalue_toy=[];      % store the objection of f
iter_toy=[];           % store the number of iteration 
 
[m,n]=size(x);   
w=zeros(m,num);
maxIter=1000;
tol=1e-7;
% compute num PCs
for l=1:num
    w0=initialization1(x,a);
    fprintf('---------the %d PC---------\n',l);
    fprintf('%d\t%10.8f\n',0,TL1fun(x,w0,a));
    % compute fvalue and iter
    fvalue_toy(1)=TL1fun(x,w0,a);   iter_toy(1)=0;
    theta0=rand(1)*pi/2;
    for i=1:maxIter
        % compute gradient
        gradf=zeros(m,1);
        for k=1:n
            gradf=gradf+a*(a+1)*sign(x(:,k)'*w0)*x(:,k)/(a+abs(x(:,k)'*w0))^2;
        end
        if (abs(abs(w0'*gradf/(norm(w0)*norm(gradf)))-1)<1e-64&&l<m)
            disp('Hello')
            while 1   
                noisy=rand(m,1); 
                if(noisy'*gradf>0)
                    break;
                end
            end
            noisy=noisy/norm(noisy);   
            epsilon=0.5; eita=rand(1)*10;
            for j=1:100
                g0=gradf+epsilon*noisy; g0=g0/norm(g0);
                w1=w0+eita*g0; w1=w1/norm(w1);
                if(TL1fun(x,w1,a)>=TL1fun(x,w0,a))
                    break;
                end
                epsilon=epsilon/2;
                eita=eita/2;
            end
            fprintf('%d\t%10.8f\n',i,TL1fun(x,w1,a));
            % compute fvalue and iter
            fvalue_toy(i+1)=TL1fun(x,w1,a);  
            iter_toy(i+1)=i;
        else
            g=gradf-(gradf'*w0)*w0;
            g0=g/norm(g);
            while 1
                w1=w0*cos(theta0)+g0*sin(theta0);
                if(TL1fun(x,w1,a)>=TL1fun(x,w0,a))
                    break;
                end
                theta0=theta0/2;
            end
            fprintf('%d\t%10.8f\n',i,TL1fun(x,w1,a));
            % compute fvalue and iter
            fvalue_toy(i+1)=TL1fun(x,w1,a); 
            iter_toy(i+1)=i;
            % update theta1
            theta1=min(theta0*2,pi/2);
            if(TL1fun(x,w1,a)-TL1fun(x,w0,a)<tol)
                break;
            end
            theta0=theta1;
            w0=w1;
        end
    end
    w(:,l)=w1;
    x=x-w(:,l)*w(:,l)'*x;
end 
% =======artifical dataset ================
load artifical1.mat; 
data = [x;y];
outlier=[-4,4.8;-3.7,5.1;-3.3,6;-2.4,5.5]';
alldata=[data,outlier];

% set parameter
x=alldata';  
num=1;
a=100;  
fvalue_toyoutlier=[];      % store the objection of f
iter_toyoutlier=[];           % store the number of iteration 

[m,n]=size(x);   
w=zeros(m,num);  
maxIter=1000;
tol=1e-7;
% compute num PCs
for l=1:num
    w0=initialization1(x,a);
    fprintf('---------the %d PC---------\n',l);
    fprintf('%d\t%10.8f\n',0,TL1fun(x,w0,a));
    % compute fvalue and iter
    fvalue_toyoutlier(1)=TL1fun(x,w0,a);   iter_toyoutlier(1)=0;
    theta0=rand(1)*pi/2;
    for i=1:maxIter
        % compute gradient
        gradf=zeros(m,1);
        for k=1:n
            gradf=gradf+a*(a+1)*sign(x(:,k)'*w0)*x(:,k)/(a+abs(x(:,k)'*w0))^2;
        end
        if (abs(abs(w0'*gradf/(norm(w0)*norm(gradf)))-1)<1e-64&&l<m)
            disp('Hello')
            while 1   
                noisy=rand(m,1); 
                if(noisy'*gradf>0)
                    break;
                end
            end
            noisy=noisy/norm(noisy);   
            epsilon=0.5; eita=rand(1)*10;
            for j=1:100
                g0=gradf+epsilon*noisy; g0=g0/norm(g0);
                w1=w0+eita*g0; w1=w1/norm(w1);
                if(TL1fun(x,w1,a)>=TL1fun(x,w0,a))
                    break;
                end
                epsilon=epsilon/2;
                eita=eita/2;
            end
            fprintf('%d\t%10.8f\n',i,TL1fun(x,w1,a));
            % compute fvalue and iter
            fvalue_toyoutlier(i+1)=TL1fun(x,w1,a);  
            iter_toyoutlier(i+1)=i;
        else
            g=gradf-(gradf'*w0)*w0;
            g0=g/norm(g);
            while 1
                w1=w0*cos(theta0)+g0*sin(theta0);
                if(TL1fun(x,w1,a)>=TL1fun(x,w0,a))
                    break;
                end
                theta0=theta0/2;
            end
            fprintf('%d\t%10.8f\n',i,TL1fun(x,w1,a));
            % compute fvalue and iter
            fvalue_toyoutlier(i+1)=TL1fun(x,w1,a); 
            iter_toyoutlier(i+1)=i;
            % update theta1
            theta1=min(theta0*2,pi/2);
            if(TL1fun(x,w1,a)-TL1fun(x,w0,a)<tol)
                break;
            end
            theta0=theta1;
            w0=w1;
        end
    end
    w(:,l)=w1;
    x=x-w(:,l)*w(:,l)'*x;
end 
%% ===========Yale=================
% ========Yale================
% load data
load('E:\MatLab2016a\work\TL1\Yale\Yale_32x32'); fea=double(fea)/255;
% load('E:\MatLab2016a\work\TL1\Yale\Yale_blacknoise8_32x32');
% load('E:\MatLab2016a\work\TL1\Yale\Yale_blacknoise12_32x32');

% set parameter
x=fea';  
num=1;
a=100;  
fvalue_Yale=[];      % store the objection of f
iter_Yale=[];           % store the number of iteration 
%%% 
[m,n]=size(x);   
w=zeros(m,num);  
maxIter=1000;
tol=1e-7;
% compute num PCs
for l=1:num
    w0=initialization1(x,a);
    fvalue_Yale(1)=TL1fun(x,w0,a);   iter_Yale(1)=0;
    theta0=rand(1)*pi/2;
    for i=1:maxIter
        % compute gradient
        gradf=zeros(m,1);
        for k=1:n
            gradf=gradf+a*(a+1)*sign(x(:,k)'*w0)*x(:,k)/(a+abs(x(:,k)'*w0))^2;
        end
        if (abs(abs(w0'*gradf/(norm(w0)*norm(gradf)))-1)<1e-64&&l<m)
            disp('Hello')
            while 1   
                noisy=rand(m,1); 
                if(noisy'*gradf>0)
                    break;
                end
            end
            noisy=noisy/norm(noisy); 
            epsilon=0.5; eita=rand(1)*10;
            for j=1:100
                g0=gradf+epsilon*noisy; g0=g0/norm(g0);
                w1=w0+eita*g0; w1=w1/norm(w1);
                if(TL1fun(x,w1,a)>=TL1fun(x,w0,a))
                    break;
                end
                epsilon=epsilon/2;
                eita=eita/2;
            end
            fprintf('%d\t%10.8f\n',i,TL1fun(x,w1,a));
            % compute fvalue and iter
            fvalue_Yale(i+1)=TL1fun(x,w1,a);  
            iter_Yale(i+1)=i;
        else
            g=gradf-(gradf'*w0)*w0;
            g0=g/norm(g);
            while 1
                w1=w0*cos(theta0)+g0*sin(theta0);
                if(TL1fun(x,w1,a)>=TL1fun(x,w0,a))
                    break;
                end
                theta0=theta0/2;
            end
            fprintf('%d\t%10.8f\n',i,TL1fun(x,w1,a));
            % compute fvalue and iter
            fvalue_Yale(i+1)=TL1fun(x,w1,a); 
            iter_Yale(i+1)=i;
            % update theta1
            theta1=min(theta0*2,pi/2);
            if(TL1fun(x,w1,a)-TL1fun(x,w0,a)<tol)
                break;
            end
            theta0=theta1;
            w0=w1;
        end
    end
    w(:,l)=w1;
    x=x-w(:,l)*w(:,l)'*x;
end 
% ========Yale================
% load data
% load('E:\MatLab2016a\work\TL1\Yale\Yale_32x32'); fea=double(fea)/255;
load('E:\MatLab2016a\work\TL1\Yale\Yale_blacknoise8_32x32');
% load('E:\MatLab2016a\work\TL1\Yale\Yale_blacknoise12_32x32');

% set parameter
x=fea';  
num=1;
a=100;  
fvalue_Yale8=[];      % store the objection of f
iter_Yale8=[];           % store the number of iteration 
%%% 
[m,n]=size(x);  
w=zeros(m,num);  
maxIter=1000;
tol=1e-7;
% compute num PCs
for l=1:num
    w0=initialization1(x,a);
    fprintf('---------the %d PC---------\n',l);
    fprintf('%d\t%10.8f\n',0,TL1fun(x,w0,a));
    % compute fvalue and iter
    fvalue_Yale8(1)=TL1fun(x,w0,a);   iter_Yale8(1)=0;
    theta0=rand(1)*pi/2;
    for i=1:maxIter
        % compute gradient
        gradf=zeros(m,1);
        for k=1:n
            gradf=gradf+a*(a+1)*sign(x(:,k)'*w0)*x(:,k)/(a+abs(x(:,k)'*w0))^2;
        end
        if (abs(abs(w0'*gradf/(norm(w0)*norm(gradf)))-1)<1e-64&&l<m)
            disp('Hello')
            while 1   
                noisy=rand(m,1); 
                if(noisy'*gradf>0)
                    break;
                end
            end
            noisy=noisy/norm(noisy);  
            epsilon=0.5; eita=rand(1)*10;
            for j=1:100
                g0=gradf+epsilon*noisy; g0=g0/norm(g0);
                w1=w0+eita*g0; w1=w1/norm(w1);
                if(TL1fun(x,w1,a)>=TL1fun(x,w0,a))
                    break;
                end
                epsilon=epsilon/2;
                eita=eita/2;
            end
            fprintf('%d\t%10.8f\n',i,TL1fun(x,w1,a));
            % compute fvalue and iter
            fvalue_Yale8(i+1)=TL1fun(x,w1,a);  
            iter_Yale8(i+1)=i;
        else
            g=gradf-(gradf'*w0)*w0;
            g0=g/norm(g);
            while 1
                w1=w0*cos(theta0)+g0*sin(theta0);
                if(TL1fun(x,w1,a)>=TL1fun(x,w0,a))
                    break;
                end
                theta0=theta0/2;
            end
            fprintf('%d\t%10.8f\n',i,TL1fun(x,w1,a));
            % compute fvalue and iter
            fvalue_Yale8(i+1)=TL1fun(x,w1,a); 
            iter_Yale8(i+1)=i;
            % update theta1
            theta1=min(theta0*2,pi/2);
            if(TL1fun(x,w1,a)-TL1fun(x,w0,a)<tol)
                break;
            end
            theta0=theta1;
            w0=w1;
        end
    end
    w(:,l)=w1;
    x=x-w(:,l)*w(:,l)'*x;
end 
% ========Yale================
% load data
% load('E:\MatLab2016a\work\TL1\Yale\Yale_32x32'); fea=double(fea)/255;
% load('E:\MatLab2016a\work\TL1\Yale\Yale_blacknoise8_32x32');
load('E:\MatLab2016a\work\TL1\Yale\Yale_blacknoise12_32x32');

% set parameter
x=fea';  
num=1;
a=100;  
fvalue_Yale12=[];      % store the objection of f
iter_Yale12=[];           % store the number of iteration 
%%% 
[m,n]=size(x); 
w=zeros(m,num); 
maxIter=1000;
tol=1e-7;
% compute num PCs
for l=1:num
    w0=initialization1(x,a);
    fprintf('---------the %d PC---------\n',l);
    fprintf('%d\t%10.8f\n',0,TL1fun(x,w0,a));
    % compute fvalue and iter
    fvalue_Yale12(1)=TL1fun(x,w0,a);   iter_Yale12(1)=0;
    theta0=rand(1)*pi/2;
    for i=1:maxIter
        % compute gradient
        gradf=zeros(m,1);
        for k=1:n
            gradf=gradf+a*(a+1)*sign(x(:,k)'*w0)*x(:,k)/(a+abs(x(:,k)'*w0))^2;
        end
        if (abs(abs(w0'*gradf/(norm(w0)*norm(gradf)))-1)<1e-64&&l<m)
            disp('Hello')
            while 1 
                noisy=rand(m,1); 
                if(noisy'*gradf>0)
                    break;
                end
            end
            noisy=noisy/norm(noisy);  
            epsilon=0.5; eita=rand(1)*10;
            for j=1:100
                g0=gradf+epsilon*noisy; g0=g0/norm(g0);
                w1=w0+eita*g0; w1=w1/norm(w1);
                if(TL1fun(x,w1,a)>=TL1fun(x,w0,a))
                    break;
                end
                epsilon=epsilon/2;
                eita=eita/2;
            end
            fprintf('%d\t%10.8f\n',i,TL1fun(x,w1,a));
            % compute fvalue and iter
            fvalue_Yale12(i+1)=TL1fun(x,w1,a);  
            iter_Yale12(i+1)=i;
        else
            g=gradf-(gradf'*w0)*w0;
            g0=g/norm(g);
            while 1
                w1=w0*cos(theta0)+g0*sin(theta0);
                if(TL1fun(x,w1,a)>=TL1fun(x,w0,a))
                    break;
                end
                theta0=theta0/2;
            end
            fprintf('%d\t%10.8f\n',i,TL1fun(x,w1,a));
            % compute fvalue and iter
            fvalue_Yale12(i+1)=TL1fun(x,w1,a); 
            iter_Yale12(i+1)=i;
            % update theta1
            theta1=min(theta0*2,pi/2);
            if(TL1fun(x,w1,a)-TL1fun(x,w0,a)<tol)
                break;
            end
            theta0=theta1;
            w0=w1;
        end
    end
    w(:,l)=w1;
    x=x-w(:,l)*w(:,l)'*x;
end
%% ========Jaffe====================
% ========Jaffe================
% load data
load('E:\MatLab2016a\work\TL1\Jaffe\Jaffe_32x32'); fea=double(fea)/255;
% load('E:\MatLab2016a\work\TL1\Jaffe\Jaffe_blacknoise8_32x32');
% load('E:\MatLab2016a\work\TL1\Jaffe\Jaffe_blacknoise12_32x32');

% set parameter
x=fea';  
num=1;
a=100;  
fvalue_Jaffe=[];      % store the objection of f
iter_Jaffe=[];           % store the number of iteration 
%%% 
[m,n]=size(x);  
w=zeros(m,num);  
maxIter=1000;
tol=1e-7;
% compute num PCs
for l=1:num
    w0=initialization1(x,a);
    fprintf('---------the %d PC---------\n',l);
    fprintf('%d\t%10.8f\n',0,TL1fun(x,w0,a));
    % compute fvalue and iter
    fvalue_Jaffe(1)=TL1fun(x,w0,a);   iter_Jaffe(1)=0;
    theta0=rand(1)*pi/2;
    for i=1:maxIter
        % compute gradient
        gradf=zeros(m,1);
        for k=1:n
            gradf=gradf+a*(a+1)*sign(x(:,k)'*w0)*x(:,k)/(a+abs(x(:,k)'*w0))^2;
        end
        if (abs(abs(w0'*gradf/(norm(w0)*norm(gradf)))-1)<1e-64&&l<m)
            disp('Hello')
            while 1
                noisy=rand(m,1); 
                if(noisy'*gradf>0)
                    break;
                end
            end
            noisy=noisy/norm(noisy);   
            epsilon=0.5; eita=rand(1)*10;
            for j=1:100
                g0=gradf+epsilon*noisy; g0=g0/norm(g0);
                w1=w0+eita*g0; w1=w1/norm(w1);
                if(TL1fun(x,w1,a)>=TL1fun(x,w0,a))
                    break;
                end
                epsilon=epsilon/2;
                eita=eita/2;
            end
            fprintf('%d\t%10.8f\n',i,TL1fun(x,w1,a));
            % compute fvalue and iter
            fvalue_Jaffe(i+1)=TL1fun(x,w1,a);  
            iter_Jaffe(i+1)=i;
        else
            g=gradf-(gradf'*w0)*w0;
            g0=g/norm(g);
            while 1
                w1=w0*cos(theta0)+g0*sin(theta0);
                if(TL1fun(x,w1,a)>=TL1fun(x,w0,a))
                    break;
                end
                theta0=theta0/2;
            end
            fprintf('%d\t%10.8f\n',i,TL1fun(x,w1,a));
            % compute fvalue and iter
            fvalue_Jaffe(i+1)=TL1fun(x,w1,a); 
            iter_Jaffe(i+1)=i;
            % update theta1
            theta1=min(theta0*2,pi/2);
            if(TL1fun(x,w1,a)-TL1fun(x,w0,a)<tol)
                break;
            end
            theta0=theta1;
            w0=w1;
        end
    end
    w(:,l)=w1;
    x=x-w(:,l)*w(:,l)'*x;
end 
% ========Jaffe================
% load data
% load('E:\MatLab2016a\work\TL1\Jaffe\Jaffe_32x32'); fea=double(fea)/255;
load('E:\MatLab2016a\work\TL1\Jaffe\Jaffe_blacknoise8_32x32');
% load('E:\MatLab2016a\work\TL1\Jaffe\Jaffe_blacknoise12_32x32');

% set parameter
x=fea';  
num=1;
a=100;  
fvalue_Jaffe8=[];      % store the objection of f
iter_Jaffe8=[];           % store the number of iteration 
%%% 
[m,n]=size(x);  
w=zeros(m,num); 
maxIter=1000;
tol=1e-7;
% compute num PCs
for l=1:num
    w0=initialization1(x,a);
    fprintf('---------the %d PC---------\n',l);
    fprintf('%d\t%10.8f\n',0,TL1fun(x,w0,a));
    % compute fvalue and iter
    fvalue_Jaffe8(1)=TL1fun(x,w0,a);   iter_Jaffe8(1)=0;
    theta0=rand(1)*pi/2;
    for i=1:maxIter
        % compute gradient
        gradf=zeros(m,1);
        for k=1:n
            gradf=gradf+a*(a+1)*sign(x(:,k)'*w0)*x(:,k)/(a+abs(x(:,k)'*w0))^2;
        end
        if (abs(abs(w0'*gradf/(norm(w0)*norm(gradf)))-1)<1e-64&&l<m)
            disp('Hello')
            while 1 
                noisy=rand(m,1); 
                if(noisy'*gradf>0)
                    break;
                end
            end
            noisy=noisy/norm(noisy);  
            epsilon=0.5; eita=rand(1)*10;
            for j=1:100
                g0=gradf+epsilon*noisy; g0=g0/norm(g0);
                w1=w0+eita*g0; w1=w1/norm(w1);
                if(TL1fun(x,w1,a)>=TL1fun(x,w0,a))
                    break;
                end
                epsilon=epsilon/2;
                eita=eita/2;
            end
            fprintf('%d\t%10.8f\n',i,TL1fun(x,w1,a));
            % compute fvalue and iter
            fvalue_Jaffe8(i+1)=TL1fun(x,w1,a);  
            iter_Jaffe8(i+1)=i;
        else
            g=gradf-(gradf'*w0)*w0;
            g0=g/norm(g);
            while 1
                w1=w0*cos(theta0)+g0*sin(theta0);
                if(TL1fun(x,w1,a)>=TL1fun(x,w0,a))
                    break;
                end
                theta0=theta0/2;
            end
            fprintf('%d\t%10.8f\n',i,TL1fun(x,w1,a));
            % compute fvalue and iter
            fvalue_Jaffe8(i+1)=TL1fun(x,w1,a); 
            iter_Jaffe8(i+1)=i;
            % update theta1
            theta1=min(theta0*2,pi/2);
            if(TL1fun(x,w1,a)-TL1fun(x,w0,a)<tol)
                break;
            end
            theta0=theta1;
            w0=w1;
        end
    end
    w(:,l)=w1;
    x=x-w(:,l)*w(:,l)'*x;
end 
% ========Jaffe================
% load data
% load('E:\MatLab2016a\work\TL1\Jaffe\Jaffe_32x32'); fea=double(fea)/255;
% load('E:\MatLab2016a\work\TL1\Jaffe\Jaffe_blacknoise8_32x32');
load('E:\MatLab2016a\work\TL1\Jaffe\Jaffe_blacknoise12_32x32');

% set parameter
x=fea';  
num=1;
a=100;  
fvalue_Jaffe12=[];      % store the objection of f
iter_Jaffe12=[];           % store the number of iteration 
%%% 
[m,n]=size(x);   
w=zeros(m,num);  
maxIter=1000;
tol=1e-7;
% compute num PCs
for l=1:num
    w0=initialization1(x,a);
    fprintf('---------the %d PC---------\n',l);
    fprintf('%d\t%10.8f\n',0,TL1fun(x,w0,a));
    % compute fvalue and iter
    fvalue_Jaffe12(1)=TL1fun(x,w0,a);   iter_Jaffe12(1)=0;
    theta0=rand(1)*pi/2;
    for i=1:maxIter
        % compute gradient
        gradf=zeros(m,1);
        for k=1:n
            gradf=gradf+a*(a+1)*sign(x(:,k)'*w0)*x(:,k)/(a+abs(x(:,k)'*w0))^2;
        end
        if (abs(abs(w0'*gradf/(norm(w0)*norm(gradf)))-1)<1e-64&&l<m)
            disp('Hello')
            while 1   
                noisy=rand(m,1); 
                if(noisy'*gradf>0)
                    break;
                end
            end
            noisy=noisy/norm(noisy);  
            epsilon=0.5; eita=rand(1)*10;
            for j=1:100
                g0=gradf+epsilon*noisy; g0=g0/norm(g0);
                w1=w0+eita*g0; w1=w1/norm(w1);
                if(TL1fun(x,w1,a)>=TL1fun(x,w0,a))
                    break;
                end
                epsilon=epsilon/2;
                eita=eita/2;
            end
            fprintf('%d\t%10.8f\n',i,TL1fun(x,w1,a));
            % compute fvalue and iter
            fvalue_Jaffe12(i+1)=TL1fun(x,w1,a);  
            iter_Jaffe12(i+1)=i;
        else
            g=gradf-(gradf'*w0)*w0;
            g0=g/norm(g);
            while 1
                w1=w0*cos(theta0)+g0*sin(theta0);
                if(TL1fun(x,w1,a)>=TL1fun(x,w0,a))
                    break;
                end
                theta0=theta0/2;
            end
            fprintf('%d\t%10.8f\n',i,TL1fun(x,w1,a));
            % compute fvalue and iter
            fvalue_Jaffe12(i+1)=TL1fun(x,w1,a); 
            iter_Jaffe12(i+1)=i;
            % update theta1
            theta1=min(theta0*2,pi/2);
            if(TL1fun(x,w1,a)-TL1fun(x,w0,a)<tol)
                break;
            end
            theta0=theta1;
            w0=w1;
        end
    end
    w(:,l)=w1;
    x=x-w(:,l)*w(:,l)'*x;
end

%% figure
figure(21)
plot(iter_toy,fvalue_toy,'r-*','linewidth',2); hold on
plot(iter_toyoutlier,fvalue_toyoutlier,'b-^','linewidth',2); hold on
xlabel('No. of iteration'); ylabel('Value of the function');
set(gcf,'color','white'); %´°¿Ú±³¾°°×É«
backColor = [0.9843, 1.0000,0.9490];
set(gca, 'color', backColor); %´°¿Ú±³¾°°×É«
set(gca,'looseInset',[0 0 0 0]);
set(gca,'ticklength',[0 0]);
set(gca,'FontSize',12);
% grid on;
ax = gca;
ax.GridColor = [0.7529    0.7529    0.7529];
ax.LineWidth = 1;
legend({'without outliers','with outliers'},'Fontname', 'Times New Roman','FontSize',12,'location','southeast');

figure(22)
plot(iter_Yale,fvalue_Yale,'r-*','linewidth',2); hold on
plot(iter_Yale8,fvalue_Yale8,'b-^','linewidth',2); hold on
plot(iter_Yale12,fvalue_Yale12,'k-v','linewidth',2); hold on
xlabel('No. of iteration'); ylabel('Value of the function');
set(gcf,'color','white'); %´°¿Ú±³¾°°×É«
backColor = [0.9843, 1.0000,0.9490];
set(gca, 'color', backColor); %´°¿Ú±³¾°°×É«
set(gca,'looseInset',[0 0 0 0]);
set(gca,'ticklength',[0 0]);
set(gca,'FontSize',12);
% grid on;
ax = gca;
ax.GridColor = [0.7529    0.7529    0.7529];
ax.LineWidth = 1;
legend({'orignal data','with 8 \times 8 block noise','with 12 \times 12 block noise'},'Fontname', 'Times New Roman','FontSize',12,'location','southeast');

figure(23)
plot(iter_Jaffe,fvalue_Jaffe,'r-*','linewidth',2); hold on
plot(iter_Jaffe8,fvalue_Jaffe8,'b-^','linewidth',2); hold on
plot(iter_Jaffe12,fvalue_Jaffe12,'k-v','linewidth',2); hold on
xlabel('No. of iteration'); ylabel('Value of the function');
set(gcf,'color','white'); %´°¿Ú±³¾°°×É«
backColor = [0.9843, 1.0000,0.9490];
set(gca, 'color', backColor); %´°¿Ú±³¾°°×É«
set(gca,'looseInset',[0 0 0 0]);
set(gca,'ticklength',[0 0]);
set(gca,'FontSize',12);
% grid on;
ax = gca;
ax.GridColor = [0.7529    0.7529    0.7529];
ax.LineWidth = 1;
legend({'orignal data','with 8 \times 8 block noise','with 12 \times 12 block noise'},'Fontname', 'Times New Roman','FontSize',12,'location','southeast');


