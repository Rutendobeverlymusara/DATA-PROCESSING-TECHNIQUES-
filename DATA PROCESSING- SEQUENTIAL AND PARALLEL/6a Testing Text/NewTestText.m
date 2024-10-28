%% Replaces one hours worth of data with empty strings
clear all
close all

FileIn = "C:\Users\ruten\OneDrive\Desktop\5011 Big Data Programming\Model\Model\o3_surface_20180701000000.nc";
C = ncinfo(FileIn);
VarNames = {C.Variables.Name};


%% Move to new *.nc file
FileOut = 'TestyTest.nc';
% to open the TestyTest in read only
fid = netcdf.open(FileOut, 'NC_NOWRITE');
if fid ~= -1
    netcdf.close(fid);
    %File is available now so delete it to start afresh
    delete(FileOut);
end
    
nccreate(FileOut, 'lat', 'Dimensions', {'lat', 400}, 'DataType', 'single');
ncwrite(FileOut, 'lat', ncread(FileIn, 'lat'));
nccreate(FileOut, 'lon', 'Dimensions', {'lon', 700}, 'DataType', 'single');
ncwrite(FileOut, 'lon', ncread(FileIn, 'lon'));
nccreate(FileOut, 'hour', 'Dimensions', {'hour', 25}, 'DataType', 'single');
ncwrite(FileOut, 'hour', ncread(FileIn, 'hour'));

Model2Change = (5||6); % Select the model that will be overwritten with errors

fid = netcdf.open(FileOut, 'NC_NOWRITE');
if fid ~= -1 
    netcdf.close(fid);
    delete(FileOut);
end 

for idx = 1:7
    if idx ~= Model2Change 
        Var = ncread(FileIn, VarNames{idx});
        nccreate('TestyTest.nc', VarNames{idx},...
            'Dimensions', { 'lon', 700, 'lat', 400, 'hour', 25},...
            'DataType', 'single');
        ncwrite('TestyTest.nc', VarNames{idx}, Var);
    else
        Var = ncread(FileIn, VarNames{idx});
        nccreate('TestyTest.nc', VarNames{idx},...
            'Dimensions', { 'lon', 700, 'lat', 400, 'hour', 25},...
            'DataType', 'char');
        var = char(Var);
        ncwrite('TestyTest.nc', VarNames{idx}, var);
    end
    
    
end

