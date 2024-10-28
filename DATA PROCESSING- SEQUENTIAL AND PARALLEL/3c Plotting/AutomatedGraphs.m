function Graphs(x1Vals, y1Vals, x2Vals, y2Vals, x3Vals, y3Vals, y1MeanVals, y2MeanVals, y3MeanVals)
%% Plotting graphs in Matlab
clear all
close all


%% Show three plots on different y-axes
%% 250 data processed
x1Vals = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
y1Vals = [23.14, 16.15, 13.93, 12.86, 12.67, 10.70, 12.23, 14.68, 14.09, 14.54, 15.75, 16.38];
figure(1)
yyaxis left
plot(x1Vals, y1Vals, '-bd')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')

%% 5,000 data processed
x2Vals = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
y2Vals = [931.38, 461.66, 371.38, 273.24, 329.83, 283.29, 274.28, 253.79, 279.28, 395.16, 310.09, 356.06];
figure(1)
yyaxis right
plot(x2Vals, y2Vals, '-rx')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')

%% 9,000 data processed
x3Vals = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
y3Vals = [1534.17, 1304.06, 1452.17, 596.68, 541.14, 530.51, 535.59, 459.52, 513.54, 505.62, 506.37, 526.07];
figure(1)
yyaxis left
hold on
plot(x3Vals, y3Vals, '-go')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')

legend('250 Data','5,000 Data', '9,000 Data')


%% Show two plots on same y-axis
%% Mean processing time
y1MeanVals = y1Vals / 250;
y2MeanVals = y2Vals / 5000;
y3MeanVals = y3Vals / 9000;

figure(2)
plot(x1Vals, y1MeanVals, '-bd')
hold on
plot(x2Vals, y2MeanVals, '-rx')
hold on
plot(x3Vals, y3MeanVals, '-go')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Mean Processing time vs number of processors')
legend('250 Data', '5,000 Data','9,000 Data')