function f=Lpfun(x,w,p)

% function£ºcompute the objective function value Lp at w 

[~,n]=size(x);
[~,num]=size(w);
f=0;
 for i=1:num
     for j=1:n
         f=f+(abs(x(:,j)'*w(:,i)))^p;
     end
 end

end