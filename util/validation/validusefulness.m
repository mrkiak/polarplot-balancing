function T = validusefulness(T)
    nil = ~(T.use == 0 | T.use == 1);
    if sum(nil) > 0 
        fprintf(2, ['There are wrong values of "use" coloumn.\n', ...
        '0 and 1 is permitted. Please correct data.\nWhile we add', ... 
        ' "0" to all wrong rows \n']);
    end
    T.use(~(T.use == 0 | T.use == 1)) = 0;
end