function [Results] = AutomatedSequential()
%this is to test the results automatically
%results will be stored in an array
DataOptions = [250, 5000, 9000]; %variable created to store data options
Results =[]; %a ressults array is crated to store total processing times
for idx = 1:length(DataOptions)
    LoopParameter = DataOptions(idx);
    FileName = 'C:\Users\ruten\OneDrive\Documents\GitHub\5011CEM2223_musarar\Model\o3_surface_20180701000000.nc';
    Contents = ncinfo(FileName);
    
    [Lat, Lon, RadLat, RadLon, RadO3] = LoadAllData(FileName);
    
    [tt, NumHour] = LoadModels(FileName, Lat, Lon, RadLat, RadLon, RadO3, LoopParameter);
    
    [tseq] = DisplayTime(FileName);
    
    Results(idx, :) = [DataOptions(idx), tseq];
end

