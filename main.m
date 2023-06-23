close all; clear; clc; setpath;
% Name of cvs-file in data folder
T = imdata('TupolangLower2_after_cutted.csv');
%T = imdata('Test_GeneralCase.csv');
%T = imdata('VotkinsUpperHR10.csv');

% Plot vibration on the polar plane. 
% polarvibration(T, limit)
polarvibration(T, 'limit');

% There are three cases to calculate target weight: 
% 'cad'  — copy-paste of mathCAD code and it is bad choice; 
% 'ref'  — via reference to first run;
% 'all'  — via reference everything with everything.
% T = polarweight(T, limit, type)
T = polarweight(T, 'limit', 'ref');
