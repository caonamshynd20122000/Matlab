function d = DivideDifference(xa,ya)
n= length(xa);
d=ya;
for i=1:n
    for j=1:i-1
        d(i)=(d(j)-d(i))./(xa(j)-xa(i));
    end
end
end

