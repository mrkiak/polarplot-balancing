function T = validreference(T)
    nil = T.Reference == 0;
    if sum(nil) > 0 
        fprintf(2, ['There is reference with zero value.\n', ...
        'It is not permitted. Add reference. \nWhile we add', ... 
        ' "-1" to all rows with nil\n']);
    end
    T.Reference(T.Reference == 0) = -1;
end