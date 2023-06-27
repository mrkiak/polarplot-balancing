function g = colormod(i)
    global gcolor;
    if mod(i, length(gcolor)) == 0
        g = length(gcolor);
    else
        g = i;
    end
end