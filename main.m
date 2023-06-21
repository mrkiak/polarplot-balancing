close all; clear; clc; setpath;
% Name of cvs-file in data folder
T = imdata('TupolangLower2_after_cutted.csv');

% There are two cases to calculate target weight: 
% 'auto' — calculation target weight via MathCAD code with nil first run 
% 'ref'  — calculation target weight via reference to first run
T = polarvibration(T, 'speclim', 'ref');

% There are two cases to plot target weight: 
% 'ref'  — calculation target weight via reference to first run
% 'all'  — calculation target weight via reference everything / everything
polarweight(T, 'speclim', 'ref')
