function[AllDataMem] = LoadAllData(FileName)
%This is to load all the model data together
FileName = 'C:\Users\ruten\OneDrive\Documents\GitHub\5011CEM2223_musarar\Model\o3_surface_20180701000000.nc';

Contents = ncinfo(FileName); %storage of the file contents

for idx = 1: 8
    AllData(idx,:,:,:) = ncread(FileName, Contents.Variables(idx).Name);
    fprintf('Loading %s\n', Contents.Variables(idx).Name); % display loading information
end

AllDataMem = whos('AllData').bytes/1000000;
fprintf('Memory used for all data: %.3f MB\n', AllDataMem)
[AllDataMem] = LoadAllData(FileName);