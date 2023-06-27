function overwritetable(T, filename)
    if exist(filename, 'file') == 2
      delete(filename);
    end
    writetable(T, filename);
end