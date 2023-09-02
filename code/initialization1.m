function init_point=initialization1(x,a)

% function£ºfind the maximal obiective function value xi

[m,n]=size(x);
obj=zeros(n,1);

for i=1:n
    w=x(:,i)/norm(x(:,i));
    for j=1:n
        obj(i)=obj(i)+(a+1)*abs(x(:,j)'*w)/(a+abs(x(:,j)'*w));
    end
end

[~,index]=max(obj);
init_point=x(:,index)/norm(x(:,index));

end
