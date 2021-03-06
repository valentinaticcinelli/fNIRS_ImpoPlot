%% Import data from text file.
% Script for importing data from the following text file:
%
%    C:\Users\ticcinel\Dropbox\FribourgPC\MATLAB\fNIRS\trigtest.txt
%
% To extend the code to different selected data or a different text file,
% generate a function instead of a script.

% Auto-generated by MATLAB on 2018/05/01 13:03:03

%% Initialize variables.
filename = ['C:\Users\ticcinel\Dropbox\FribourgPC\MATLAB\fNIRS\' file_name] ;
delimiter = '\t';
endRow = 88;

%% Format for each line of text:
%   column1: text (%s)
%	column2: text (%s)
%   column3: text (%s)
%	column4: text (%s)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%s%s%s%s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, endRow, 'Delimiter', delimiter, 'TextType', 'string', 'ReturnOnError', false, 'EndOfLine', '\r\n');

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Create output variable
data.info = [dataArray{1:end-1}];
data.Fs=str2double(data.info{4,2});
data.time=[0:1/data.Fs:size(data.values,1)/data.Fs-1/data.Fs];
%% Clear temporary variables
clearvars filename delimiter endRow formatSpec fileID dataArray ans;