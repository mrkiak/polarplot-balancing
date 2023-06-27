function sum = sumweight(T,n)
    el = T(n,:);
    sum = el.ComplexWeight;
    ref = el.Reference;
    while ref ~= -1
        el = T(ref,:);
        sum = sum + el.ComplexWeight;
        ref = el.Reference;
    end
end