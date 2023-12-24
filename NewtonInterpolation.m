function  result = NewtonInterpolation(xa,ya,x)
da= DivideDifference(xa,ya);
result =NewtonForm(xa,da,x);
end

