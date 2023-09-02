function f=TL1fun(x,w,a)

% function£ºcompute the objective function value TL1 at w 

[~,n]=size(x);
[~,num]=size(w);
f=0;
for i=1:num
    for j=1:n
        f=f+(a+1)*abs(x(:,j)'*w(:,i))/(a+abs(x(:,j)'*w(:,i)));
    end
end

end
