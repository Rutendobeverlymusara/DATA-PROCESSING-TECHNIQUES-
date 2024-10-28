%% Plotting graphs in Matlab
clear all
close all


%% Show two plots on different y-axes
%% 250 data processed
x1Vals = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
y1Vals = [33, 15, 11, 10, 9, 9, 9, 11, 15, 16, 17, 18];
figure(1)
yyaxis left
plot(x1Vals, y1Vals, '-bd')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')


%% 9,000 data processed
x2Vals = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
y2Vals = [1633, 717, 638, 548, 535, 614, 526, 509, 597, 540, 524, 504];
figure(1)
yyaxis right
plot(x2Vals, y2Vals, '-rx')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')

legend('250 Data', '9,000 Data')


%% Show two plots on same y-axis
%% Mean processing time
y1MeanVals = y1Vals / 250;
y2MeanVals = y2Vals / 9000;

figure(2)
plot(x1Vals, y1MeanVals, '-bd')
hold on
plot(x2Vals, y2MeanVals, '-rx')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Mean Processing time vs number of processors')
legend('250 Data', '9,000 Data')