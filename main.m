close all; clear; clc; setpath;
% Name of cvs-file in data folder
%path = 'TupolangLower2_after.csv';
path = 'TupolangLower2_after_cutted.xls';
%path ='Test_GeneralCase.csv';
%path = 'VotkinsUpperHR10.csv';
T = imxls(path);
% Plot vibration on the polar plane. 
% polarvibration(T, [OPTION limit])
polarvibration(T, 'limit');

% There are three cases to calculate target weight: 
% 'cad'  — copy-paste of mathCAD code and it is bad choice; 
% 'ref'  — via reference to first run;
% 'all'  — via reference everything with everything.
% T = polarweight(T, [OPTION limit], type)
T = polarweight(T, 'limit', 'all');
overwritetable(T, 'results\results.xls');
