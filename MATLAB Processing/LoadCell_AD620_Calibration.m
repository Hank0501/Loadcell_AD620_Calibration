close all;
clear;
clc;

% File Name Assignment
% ---------------------------------------------------------%
filename = {};
filename{end + 1} = '../StudioData/rawData0705_1.txt';
filename{end + 1} = '../StudioData/rawData0705_2.txt';
filename{end + 1} = '../StudioData/rawData0705_3.txt';
filename{end + 1} = '../StudioData/rawData0705_4.txt';
filename{end + 1} = '../StudioData/rawData0705_5.txt';
filename{end + 1} = '../StudioData/rawData0705_6.txt';

dataCount = size(filename, 2);

% Read Table
% ---------------------------------------------------------%
Table = cell(1, dataCount);

for i = 1:dataCount
    Table{i} = readtable(filename{i}, 'VariableNamingRule', 'preserve');
end

% Get Variable in Table
% ---------------------------------------------------------%
time = cell(1, dataCount);
cur_loadcell = cell(1, dataCount);
filtered_cur_loadcell = cell(1, dataCount);
record_flag = cell(1, dataCount);
weight_variable = cell(1, dataCount);

for i = 1:dataCount
    time{i} = Table{i}.Var2;
    cur_loadcell{i} = Table{i}.cur_loadcell;
    filtered_cur_loadcell{i} = Table{i}.filtered_cur_loadcell;
    record_flag{i} = Table{i}.record_flag;
    weight_variable{i} = Table{i}.weight_variable;
end

% Get the segment we need
% ---------------------------------------------------------%
avg_filtered_cur_loadcell = cell(1, dataCount);
avg_weight_variable = cell(1, dataCount);

for i = 1:dataCount

    d_record_flag = diff(record_flag{i});
    startIdx_record_flag = find(d_record_flag == 1);
    endIdx_record_flag = find(d_record_flag == -1) - 1;

    for j = 1:size(startIdx_record_flag)
        segmentLoadcell = filtered_cur_loadcell{i}(startIdx_record_flag(j):endIdx_record_flag(j));
        avg_filtered_cur_loadcell{i}(j) = mean(segmentLoadcell);
    end

    for j = 1:size(startIdx_record_flag)
        segmentWeight = weight_variable{i}(startIdx_record_flag(j):endIdx_record_flag(j));
        avg_weight_variable{i}(j) = mean(segmentWeight);
    end

end

% ---------------------------------------------------------%
% ---------------------------------------------------------%
figure(1);
hold on;

yyaxis left;
plot(time{1}, cur_loadcell{1}, 'Color', 'r', 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '*');
plot(time{1}, filtered_cur_loadcell{1}, 'Color', 'b', 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '*');
ylabel('ADC Value');

yyaxis right;
plot(time{1}, record_flag{1}, 'Color', '#77AC30', 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '*');
plot(time{1}, weight_variable{1} / 1000, 'Color', '#EDB120', 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '*');
ylabel('Weight (kg)');

leg1 = legend({'cur\_loadcell', 'filtered\_cur\_loadcell', 'record\_flag', 'weight\_variable'}, 'Location', 'best');
leg1.FontSize = 18;
hold off;
xlabel('time (ms)');
title('Loadcell Calibraation Experiment');
set(gca, 'FontSize', 25);
grid on;

% ---------------------------------------------------------%
% ---------------------------------------------------------%
f = figure(2);
% f.Position = [0 550 600 400];
hold on;

plot(avg_filtered_cur_loadcell{1}, avg_weight_variable{1} / 1000, 'Color', 'r', 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '*');
plot(avg_filtered_cur_loadcell{2}, avg_weight_variable{2} / 1000, 'Color', 'b', 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '*');
plot(avg_filtered_cur_loadcell{3}, avg_weight_variable{3} / 1000, 'Color', '#77AC30', 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '*');
plot(avg_filtered_cur_loadcell{4}, avg_weight_variable{4} / 1000, 'Color', '#EDB120', 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '*');
plot(avg_filtered_cur_loadcell{5}, avg_weight_variable{5} / 1000, 'Color', '#7E2F8E', 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '*');
plot(avg_filtered_cur_loadcell{6}, avg_weight_variable{6} / 1000, 'Color', '#A2142F', 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '*');
hold off;
xlabel('ADC\_Value');
ylabel('Weight (kg)');
title('Weight-ADC\_Value');
set(gca, 'FontSize', 25);
grid on;

% % ---------------------------------------------------------%
% % ---------------------------------------------------------%
% % ----------------------  Fitting -------------------------%
% % ---------------------------------------------------------%
% % ---------------------------------------------------------%

% Turn gram into kilogram
avgWeight_Newton = cell(1, dataCount);

for i = 1:dataCount
    avgWeight_Newton{i} = avg_weight_variable{i} * 9.81/1000;
end

avgWeight_Newton_All = [];
avgLoadcell_All = [];

for i = 1:dataCount
    avgWeight_Newton_All = cat(2, avgWeight_Newton_All, avgWeight_Newton{i});
    avgLoadcell_All = cat(2, avgLoadcell_All, avg_filtered_cur_loadcell{i});
end

% The result slope is 0.0375, Date : 20250705
coeffs = polyfit(avgLoadcell_All, avgWeight_Newton_All, 1);

fit_Loadcell = linspace(0, 2000, 100);
fit_Newton = polyval(coeffs, fit_Loadcell);

% ---------------------------------------------------------%
% ---------------------------------------------------------%
figure(3);
hold on;

plot(avg_filtered_cur_loadcell{1}, avgWeight_Newton{1}, 'Color', 'r', 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '*');
plot(avg_filtered_cur_loadcell{2}, avgWeight_Newton{2}, 'Color', 'r', 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '*');
plot(avg_filtered_cur_loadcell{3}, avgWeight_Newton{3}, 'Color', 'r', 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '*');
plot(avg_filtered_cur_loadcell{4}, avgWeight_Newton{4}, 'Color', 'r', 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '*');
plot(avg_filtered_cur_loadcell{5}, avgWeight_Newton{5}, 'Color', 'r', 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '*');
plot(avg_filtered_cur_loadcell{6}, avgWeight_Newton{6}, 'Color', 'r', 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '*');
plot(fit_Loadcell, fit_Newton, 'Color', 'b', 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '*');

hold off;
xlabel('ADC\_Value');
ylabel('Force (N)');
title('Force-ADC\_Value');
set(gca, 'FontSize', 25);
grid on;
