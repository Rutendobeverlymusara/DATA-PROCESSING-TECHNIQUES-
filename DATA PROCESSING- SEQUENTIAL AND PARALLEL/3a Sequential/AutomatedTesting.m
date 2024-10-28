 %% Automated Testing
      DataSize = [250,5000,9000]; %defining the loop variable
      
      for idx = 1:size(DataSize, 1)
          LoopParameter = DataSize(idx);
          %process
          %
          [tSeq] = SequentialProcessingAutomated(LoopParameter);
          Results(idx, :) = [DataSize(idx), RunTime];
          dbstop if error
      end