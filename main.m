close all; clear; clc; 
setpath;
T = imdata('TupolangLower2_after.csv');
%T = imdata('Test_GeneralCase.csv');

% 'auto' and 'ref'
T = polarvibration(T, 'ref');
speclimit(T.PhaseAmplitude)
T = sortrows(T,'Mode');

polarweight(T)
speclimit(T.PhaseWeight)