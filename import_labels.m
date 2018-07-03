%% Import data from text file.
% Script for importing data from the following text file:
%
%    C:\Users\ticcinel\Dropbox\FribourgPC\MATLAB\fNIRS\trigtest.txt
%
% To extend the code to different selected data or a different text file,
% generate a function instead of a script.

% Auto-generated by MATLAB on 2018/05/01 13:14:10

%% Initialize variables.
filename = ['C:\Users\ticcinel\Dropbox\FribourgPC\MATLAB\fNIRS\' file_name] ;
delimiter = '\t';
startRow = 39;
endRow = 88;

%% Format for each line of text:
%   column2: text (%s)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%*s%s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
textscan(fileID, '%[^\n\r]', startRow-1, 'WhiteSpace', '', 'ReturnOnError', false);
dataArray = textscan(fileID, formatSpec, endRow-startRow+1, 'Delimiter', delimiter, 'TextType', 'string', 'ReturnOnError', false, 'EndOfLine', '\r\n');

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Create output variable
data.labels = [dataArray{1:end-1}];
for i=1:48
    if i~=35
data.labels{i}=data.labels{i}(1:15);
    end
end
%% Clear temporary variables
clearvars filename delimiter startRow endRow formatSpec fileID dataArray ans;