    %% Automated Testing 

DataOptions = [250,5000,9000]; %testing for the different sizes of data
WorkerSize = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]; %different cores being used
Results = [];
for idx1 = 1: size(DataOptions,1)
    DataParameter = DataOptions(idx1);
    for idx2 = 1: size(WorkerSize, 1)
        WorkerParameter = WorkerSize(idx2);
        [TotalTime] = ParallelProcessingAutomated(DataParameter, WorkerParameter);
        Results = [Results; WorkerParameter, DataParameter, TotalTime];
    end        
end 