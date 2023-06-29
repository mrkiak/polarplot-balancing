function overwritetable(T, filename)
    if exist(filename, 'file') == 2
      delete(filename);
    end
    writetable(T, filename);
    D = sumsen(T);
    [filepath, ~, ~] = fileparts(filename);
    save(fullfile(filepath, 'summary.mat'), 'D');
end