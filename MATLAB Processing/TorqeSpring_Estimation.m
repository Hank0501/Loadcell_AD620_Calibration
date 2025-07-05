close all;
clear;
clc;

filename1 = '../StudioData/rawData0705_1.txt';
filename2 = '../StudioData_TorqueSpring/TorqueSpring/0610/0610_Flexion2.txt';
filename3 = '../StudioData_TorqueSpring/TorqueSpring/0610/0610_Flexion3.txt';
filename4 = '../StudioData_TorqueSpring/TorqueSpring/0610/0610_Flexion4.txt';
filename5 = '../StudioData_TorqueSpring/TorqueSpring/0610/0610_Flexion5.txt';

filename6 = '../StudioData_TorqueSpring/TorqueSpring/0610/0610_Extension1.txt';
filename7 = '../StudioData_TorqueSpring/TorqueSpring/0610/0610_Extension2.txt';
filename8 = '../StudioData_TorqueSpring/TorqueSpring/0610/0610_Extension3.txt';
filename9 = '../StudioData_TorqueSpring/TorqueSpring/0610/0610_Extension4.txt';
filename10 = '../StudioData_TorqueSpring/TorqueSpring/0610/0610_Extension5.txt';

T1 = readtable(filename1, 'VariableNamingRule', 'preserve');
T2 = readtable(filename2, 'VariableNamingRule', 'preserve');
T3 = readtable(filename3, 'VariableNamingRule', 'preserve');
T4 = readtable(filename4, 'VariableNamingRule', 'preserve');
T5 = readtable(filename5, 'VariableNamingRule', 'preserve');
T6 = readtable(filename6, 'VariableNamingRule', 'preserve');
T7 = readtable(filename7, 'VariableNamingRule', 'preserve');
T8 = readtable(filename8, 'VariableNamingRule', 'preserve');
T9 = readtable(filename9, 'VariableNamingRule', 'preserve');
T10 = readtable(filename10, 'VariableNamingRule', 'preserve');

time1 = T1.Var2;
curCurrent1 = T1.curCurrent;
goalCurrent1 = T1.goalCurrent;
currentRecordFlag_PIP1 = T1.currentRecordFlag_PIP;
currentRecordFlag_DIP1 = T1.currentRecordFlag_DIP;
angleRecordFlag_PIP1 = T1.angleRecordFlag_PIP;
angleRecordFlag_DIP1 = T1.angleRecordFlag_DIP;
comp_AngAS5048A_PIP1 = T1.comp_AngAS5048A_PIP;
comp_AngAS5048A_DIP1 = T1.comp_AngAS5048A_DIP;
curF_Velocity_PIP1 = T1.curF_Velocity_PIP;
curF_Velocity_DIP1 = T1.curF_Velocity_DIP;

% 數字 2
curCurrent2 = T2.curCurrent;
goalCurrent2 = T2.goalCurrent;
currentRecordFlag_PIP2 = T2.currentRecordFlag_PIP;
currentRecordFlag_DIP2 = T2.currentRecordFlag_DIP;
angleRecordFlag_PIP2 = T2.angleRecordFlag_PIP;
angleRecordFlag_DIP2 = T2.angleRecordFlag_DIP;
comp_AngAS5048A_PIP2 = T2.comp_AngAS5048A_PIP;
comp_AngAS5048A_DIP2 = T2.comp_AngAS5048A_DIP;
curF_Velocity_PIP2 = T2.curF_Velocity_PIP;
curF_Velocity_DIP2 = T2.curF_Velocity_DIP;

% 數字 3
curCurrent3 = T3.curCurrent;
goalCurrent3 = T3.goalCurrent;
currentRecordFlag_PIP3 = T3.currentRecordFlag_PIP;
currentRecordFlag_DIP3 = T3.currentRecordFlag_DIP;
angleRecordFlag_PIP3 = T3.angleRecordFlag_PIP;
angleRecordFlag_DIP3 = T3.angleRecordFlag_DIP;
comp_AngAS5048A_PIP3 = T3.comp_AngAS5048A_PIP;
comp_AngAS5048A_DIP3 = T3.comp_AngAS5048A_DIP;
curF_Velocity_PIP3 = T3.curF_Velocity_PIP;
curF_Velocity_DIP3 = T3.curF_Velocity_DIP;

% 數字 4
curCurrent4 = T4.curCurrent;
goalCurrent4 = T4.goalCurrent;
currentRecordFlag_PIP4 = T4.currentRecordFlag_PIP;
currentRecordFlag_DIP4 = T4.currentRecordFlag_DIP;
angleRecordFlag_PIP4 = T4.angleRecordFlag_PIP;
angleRecordFlag_DIP4 = T4.angleRecordFlag_DIP;
comp_AngAS5048A_PIP4 = T4.comp_AngAS5048A_PIP;
comp_AngAS5048A_DIP4 = T4.comp_AngAS5048A_DIP;
curF_Velocity_PIP4 = T4.curF_Velocity_PIP;
curF_Velocity_DIP4 = T4.curF_Velocity_DIP;

% 數字 5
curCurrent5 = T5.curCurrent;
goalCurrent5 = T5.goalCurrent;
currentRecordFlag_PIP5 = T5.currentRecordFlag_PIP;
currentRecordFlag_DIP5 = T5.currentRecordFlag_DIP;
angleRecordFlag_PIP5 = T5.angleRecordFlag_PIP;
angleRecordFlag_DIP5 = T5.angleRecordFlag_DIP;
comp_AngAS5048A_PIP5 = T5.comp_AngAS5048A_PIP;
comp_AngAS5048A_DIP5 = T5.comp_AngAS5048A_DIP;
curF_Velocity_PIP5 = T5.curF_Velocity_PIP;
curF_Velocity_DIP5 = T5.curF_Velocity_DIP;

% 數字 6
curCurrent6 = T6.curCurrent;
goalCurrent6 = T6.goalCurrent;
currentRecordFlag_PIP6 = T6.currentRecordFlag_PIP;
currentRecordFlag_DIP6 = T6.currentRecordFlag_DIP;
angleRecordFlag_PIP6 = T6.angleRecordFlag_PIP;
angleRecordFlag_DIP6 = T6.angleRecordFlag_DIP;
comp_AngAS5048A_PIP6 = T6.comp_AngAS5048A_PIP;
comp_AngAS5048A_DIP6 = T6.comp_AngAS5048A_DIP;
curF_Velocity_PIP6 = T6.curF_Velocity_PIP;
curF_Velocity_DIP6 = T6.curF_Velocity_DIP;

% 數字 7
curCurrent7 = T7.curCurrent;
goalCurrent7 = T7.goalCurrent;
currentRecordFlag_PIP7 = T7.currentRecordFlag_PIP;
currentRecordFlag_DIP7 = T7.currentRecordFlag_DIP;
angleRecordFlag_PIP7 = T7.angleRecordFlag_PIP;
angleRecordFlag_DIP7 = T7.angleRecordFlag_DIP;
comp_AngAS5048A_PIP7 = T7.comp_AngAS5048A_PIP;
comp_AngAS5048A_DIP7 = T7.comp_AngAS5048A_DIP;
curF_Velocity_PIP7 = T7.curF_Velocity_PIP;
curF_Velocity_DIP7 = T7.curF_Velocity_DIP;

% 數字 8
curCurrent8 = T8.curCurrent;
goalCurrent8 = T8.goalCurrent;
currentRecordFlag_PIP8 = T8.currentRecordFlag_PIP;
currentRecordFlag_DIP8 = T8.currentRecordFlag_DIP;
angleRecordFlag_PIP8 = T8.angleRecordFlag_PIP;
angleRecordFlag_DIP8 = T8.angleRecordFlag_DIP;
comp_AngAS5048A_PIP8 = T8.comp_AngAS5048A_PIP;
comp_AngAS5048A_DIP8 = T8.comp_AngAS5048A_DIP;
curF_Velocity_PIP8 = T8.curF_Velocity_PIP;
curF_Velocity_DIP8 = T8.curF_Velocity_DIP;

% 數字 9
curCurrent9 = T9.curCurrent;
goalCurrent9 = T9.goalCurrent;
currentRecordFlag_PIP9 = T9.currentRecordFlag_PIP;
currentRecordFlag_DIP9 = T9.currentRecordFlag_DIP;
angleRecordFlag_PIP9 = T9.angleRecordFlag_PIP;
angleRecordFlag_DIP9 = T9.angleRecordFlag_DIP;
comp_AngAS5048A_PIP9 = T9.comp_AngAS5048A_PIP;
comp_AngAS5048A_DIP9 = T9.comp_AngAS5048A_DIP;
curF_Velocity_PIP9 = T9.curF_Velocity_PIP;
curF_Velocity_DIP9 = T9.curF_Velocity_DIP;

% 數字 10
curCurrent10 = T10.curCurrent;
goalCurrent10 = T10.goalCurrent;
currentRecordFlag_PIP10 = T10.currentRecordFlag_PIP;
currentRecordFlag_DIP10 = T10.currentRecordFlag_DIP;
angleRecordFlag_PIP10 = T10.angleRecordFlag_PIP;
angleRecordFlag_DIP10 = T10.angleRecordFlag_DIP;
comp_AngAS5048A_PIP10 = T10.comp_AngAS5048A_PIP;
comp_AngAS5048A_DIP10 = T10.comp_AngAS5048A_DIP;
curF_Velocity_PIP10 = T10.curF_Velocity_PIP;
curF_Velocity_DIP10 = T10.curF_Velocity_DIP;

% ---------------------------------------------------------%

% 找出連續區段
d_curFlag_PIP = diff(currentRecordFlag_PIP1);
startIdx_curFlag_PIP = find(d_curFlag_PIP == 1); % 區段開始
endIdx_curFlag_PIP = find(d_curFlag_PIP == -1) - 1; % 區段結束

d_curFlag_DIP = diff(currentRecordFlag_DIP1);
startIdx_curFlag_DIP = find(d_curFlag_DIP == 1); % 區段開始
endIdx_curFlag_DIP = find(d_curFlag_DIP == -1) - 1; % 區段結束

d_angFlag_PIP = diff(angleRecordFlag_PIP1);
startIdx_angFlag_PIP = find(d_angFlag_PIP == 1); % 區段開始
endIdx_angFlag_PIP = find(d_angFlag_PIP == -1) - 1; % 區段結束

d_angFlag_DIP = diff(angleRecordFlag_DIP1);
startIdx_angFlag_DIP = find(d_angFlag_DIP == 1); % 區段開始
endIdx_angFlag_DIP = find(d_angFlag_DIP == -1) - 1; % 區段結束

% 結果初始化
avg_current_PIP = zeros(size(startIdx_curFlag_PIP));
avg_current_DIP = zeros(size(startIdx_curFlag_DIP));
avg_angle_PIP = zeros(size(startIdx_angFlag_PIP));
avg_angle_DIP = zeros(size(startIdx_angFlag_DIP));

% 處理每一段區間 PIP Cur
for i = 1:size(startIdx_curFlag_PIP)
    segmentCur = curCurrent1(startIdx_curFlag_PIP(i):endIdx_curFlag_PIP(i));
    avg_current_PIP(i) = mean(segmentCur);
end

% 處理每一段區間 DIP Cur
for i = 1:size(startIdx_curFlag_DIP)
    segmentCur = curCurrent1(startIdx_curFlag_DIP(i):endIdx_curFlag_DIP(i));
    avg_current_DIP(i) = mean(segmentCur);
end

% 處理每一段區間 PIP Ang
for i = 1:size(startIdx_angFlag_PIP)
    segmentAng = comp_AngAS5048A_PIP1(startIdx_angFlag_PIP(i):endIdx_angFlag_PIP(i));
    avg_angle_PIP(i) = mean(segmentAng);
end

% 處理每一段區間 DIP Ang
for i = 1:size(startIdx_angFlag_DIP)
    segmentAng = comp_AngAS5048A_DIP1(startIdx_angFlag_DIP(i):endIdx_angFlag_DIP(i));
    avg_angle_DIP(i) = mean(segmentAng);
end

% ---------------------------------------------------------%

% % 找出連續區段
% d = diff(recordFlag2);
% start_idx = find(d == 1); % 區段開始
% end_idx = find(d == -1) - 1; % 區段結束

% % 結果初始化
% avg_current2 = zeros(size(start_idx));
% avg_velocity2 = zeros(size(start_idx));

% % 處理每一段區間
% for i = 1:size(start_idx)
%     segmentCur = curCurrent2(start_idx(i):end_idx(i));
%     segmentVel = curVelocity2(start_idx(i):end_idx(i));
%     avg_current2(i) = mean(segmentCur);
%     avg_velocity2(i) = mean(segmentVel);
% end

% ---------------------------------------------------------%
% % 找出連續區段
% d = diff(recordFlag3);
% start_idx = find(d == 1); % 區段開始
% end_idx = find(d == -1) - 1; % 區段結束

% % 結果初始化
% avg_current3 = zeros(size(start_idx));
% avg_velocity3 = zeros(size(start_idx));

% % 處理每一段區間
% for i = 1:size(start_idx)
%     segmentCur = curCurrent3(start_idx(i):end_idx(i));
%     segmentVel = curVelocity3(start_idx(i):end_idx(i));
%     avg_current3(i) = mean(segmentCur);
%     avg_velocity3(i) = mean(segmentVel);
% end

% ---------------------------------------------------------%
% % 找出連續區段
% d = diff(recordFlag4);
% start_idx = find(d == 1); % 區段開始
% end_idx = find(d == -1) - 1; % 區段結束

% % 結果初始化
% avg_current4 = zeros(size(start_idx));
% avg_velocity4 = zeros(size(start_idx));

% % 處理每一段區間
% for i = 1:size(start_idx)
%     segmentCur = curCurrent4(start_idx(i):end_idx(i));
%     segmentVel = curVelocity4(start_idx(i):end_idx(i));
%     avg_current4(i) = mean(segmentCur);
%     avg_velocity4(i) = mean(segmentVel);
% end

% ---------------------------------------------------------%
% % 找出連續區段
% d = diff(recordFlag5);
% start_idx = find(d == 1); % 區段開始
% end_idx = find(d == -1) - 1; % 區段結束

% % 結果初始化
% avg_current5 = zeros(size(start_idx));
% avg_velocity5 = zeros(size(start_idx));

% % 處理每一段區間
% for i = 1:size(start_idx)
%     segmentCur = curCurrent5(start_idx(i):end_idx(i));
%     segmentVel = curVelocity5(start_idx(i):end_idx(i));
%     avg_current5(i) = mean(segmentCur);
%     avg_velocity5(i) = mean(segmentVel);
% end

% ---------------------------------------------------------%
% ---------------------------------------------------------%
figure(1);
hold on;

yyaxis left;
plot(time1, curCurrent1, 'Color', 'r', 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '*');
plot(time1, goalCurrent1, 'Color', 'b', 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '*');
plot(time1, comp_AngAS5048A_PIP1, 'Color', '#77AC30', 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '*');
plot(time1, comp_AngAS5048A_DIP1, 'Color', '#EDB120', 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '*');
ylabel('Current (mA) or Angle (deg)');

yyaxis right;
plot(time1, curF_Velocity_PIP1, 'Color', '#7E2F8E', 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '*');
plot(time1, curF_Velocity_DIP1, 'Color', '#A2142F', 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '*');
plot(time1, currentRecordFlag_PIP1, 'Color', '#4DBEEE', 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '*');
plot(time1, currentRecordFlag_DIP1, 'Color', '#D95319', 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '*');
plot(time1, angleRecordFlag_PIP1, 'Color', '#0072BD', 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '*');
plot(time1, angleRecordFlag_DIP1, 'Color', '#FF00FF', 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '*');
ylabel('Velocity (rpm)');

leg1 = legend({'curCurrent', 'goalCurrent', 'comp\_AngAS5048A\_PIP1', 'comp\_AngAS5048A\_DIP1', ...
                   'curF\_Velocity\_PIP1', 'curF\_Velocity\_DIP1', 'curRecordFlag\_PIP1', 'curRecordFlag\_DIP1', 'angRecordFlag\_PIP1', 'angRecordFlag\_DIP1'}, 'Location', 'best');
leg1.FontSize = 18;
hold off;
xlabel('time (ms)');
title('Visco Friction Experiment');
set(gca, 'FontSize', 25);
grid on;

% ---------------------------------------------------------%
% ---------------------------------------------------------%

figure(2);
hold on;

plot(avg_angle_PIP, avg_current_PIP, 'Color', 'r', 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '*');
hold off;
xlabel('Angle (deg)');
ylabel('Current (mA)');
title('PIP Joint');
set(gca, 'FontSize', 25);
grid on;

% ---------------------------------------------------------%
% ---------------------------------------------------------%

figure(3);
hold on;

plot(avg_angle_DIP, avg_current_DIP, 'Color', 'r', 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '*');
hold off;
xlabel('Angle (deg)');
ylabel('Current (mA)');
title('DIP Joint');
set(gca, 'FontSize', 25);
grid on;

% ---------------------------------------------------------%
% ---------------------------------------------------------%

% figure(3);
% hold on;

% plot(avg_velocity1, avg_current1, 'Color', 'r', 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '*');
% plot(avg_velocity2, avg_current2, 'Color', 'b', 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '*');
% plot(avg_velocity3, avg_current3, 'Color', '#77AC30', 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '*');
% plot(avg_velocity4, avg_current4, 'Color', '#EDB120', 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '*');
% plot(avg_velocity5, avg_current5, 'Color', '#7E2F8E', 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '*');
% leg3 = legend({'1st', '2nd', '3rd', '4th', '5th'}, 'Location', 'best');
% leg3.FontSize = 30;
% hold off;
% xlabel('Velocity (rpm)');
% ylabel('Current (mA)');
% title('Visco Friction Experiment');
% set(gca, 'FontSize', 25);
% grid on;
