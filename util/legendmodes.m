function modes = legendmodes(modes)
    modes = regexprep(string(modes),'[0-9+-/%.]','');
end