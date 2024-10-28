function [Results] = ParallelLogAutomated()

%% Opening text 
LogFileName = "TestLogP.txt";
if exist (LogFileName, 'file')
    delete(LogFileName)
end

%% Automated Testing 
DataOptions = [250, 5000, 9000];
WorkerSize = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]; %different cores being used
Results = [];
for idx1 = 1: size(DataOptions,1)
    DataParameter = DataOptions(idx1);
    for idx2 = 1: size(WorkerSize, 1)
        WorkerParameter = WorkerSize(idx2);
        [TotalTime] = ParallelProcessingAutomated(DataParameter, WorkerParameter);
        Results = [Results; WorkerParameter, DataParameter, TotalTime];
        fprintf(LogID , 'Test Results %i, %i, %i\n', DataParameter, WorkerParameter, TotalTime);
    end        
end 
fclose(LogID);

%% Plotting the graph 
FirstRunTime = Results(Results(:,2)==250, :);
SecondRunTime = Results(Results(:,2)==5000, :);
ThirdRunTime = Results(Results(:,2)==9000, :);
Plot_Graphs(WorkerSize, FirstRunTime(:,3), WorkerSize, SecondRunTime(:,3), WorkerSize, ThirdRunTime(:,3));

%% Calculating estimated number of workers 
% 5000 data
line_equation2 = polyfit(WorkerSize, SecondRunTime(:,3), 1);
gradient2 = line_equation2(:,1);
y_intercept2 = line_equation2(:,2);
TotalTime2Process2 = (7200/25) * (5000/277804);
EstimatedProcessor_No2 = (TotalTime2Process2 - y_intercept2) / gradient2;
recommeded_processors_no2 = round(EstimatedProcessor_No2);
fprintf("Recommended number of processors: " + recommeded_processors_no2);

% 9000 data 
line_equation3 = polyfit(WorkerSize, ThirdRunTime(:,3), 1);
gradient3 = line_equation3(:,1);
y_intercept3 = line_equation3(:,2);
TotalTime2Process3 = (7200/25) * (9000/277804);
EstimatedProcessor_No3 = (TotalTime2Process3 - y_intercept3) / gradient3;
recommeded_processors_no3 = round(EstimatedProcessor_No3);
fprintf("Recommended number of processors: " + recommeded_processors_no3);
end