function sum = sumweight(T,n)
    el = T(n,:);
    sum = el.zWeight;
    ref = el.ref;
    while ref ~= -1
        el = T(ref,:);
        sum = sum + el.zWeight;
        ref = el.ref;
    end
end