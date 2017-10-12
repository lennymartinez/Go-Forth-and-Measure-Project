close all; clear all;

%% Racket 1 = Babolat
%Get filenames
filename1 = 'CSV/Center/Babolat_Center1.csv';
filename2 = 'CSV/Center/Head_center1.csv';
filename3 = 'CSV/Center/Babolat_Center3.csv';
filename4 = 'CSV/Center/Babolat_Center4.csv';
filename5 = 'CSV/Center/Babolat_Center5.csv';

%temp matrices of data. Col_1 = time, Col_2 = topACC, Col_3=rightACC,
%Col_4=leftACC, Col_5=botACC, Col_6=Potential
temp1 = csvread(filename1,1,0);
temp2 = csvread(filename2,1,0);
temp3 = csvread(filename3,1,0);
temp4 = csvread(filename4,1,0);
temp5 = csvread(filename5,1,0);

%% Tune acc data from sample 1

N1 = length(temp1);
time1 = temp1(:,1);
force1 = temp1(:,6);
force1 = (force1 - mean(force1(1:200)));
% acc_top1 = (temp1(:,2) - mean(temp1(:,2)));
% acc_right1 = (temp1(:,3) - mean(temp1(:,3)));
% acc_left1 = (temp1(:,4) - mean(temp1(:,4)));
acc_bot1 = (temp1(:,5) - mean(temp1(:,5))); % this is the only one that matters in this case. maybe in all cases. 
                                          % Because it was always non-zero
dt = time1(2)-time1(1);
Fs1 = 1/dt;

%integrate acceleration
integral_force1 = trapz(force1(87:215));

%normalize acc vectors
% acc_top1 = acc_top1/integral_force1;
% acc_right1 = acc_right1/integral_force1;
% acc_left1 = acc_left1/integral_force1;
acc_bot1 = acc_bot1/integral_force1;

%plotting acceleration of bottom accelerometer vs. time.
figure();
plot(time1,acc_bot1,'r','LineWidth',2); hold on;

%% Tune acc data from sample 2

N2 = length(temp1);
time2 = temp2(:,1);
force2 = temp2(:,6);
force2 = (force2 - mean(force2(1:200)));
% acc_top1 = (temp1(:,2) - mean(temp1(:,2)));
% acc_right1 = (temp1(:,3) - mean(temp1(:,3)));
% acc_left1 = (temp1(:,4) - mean(temp1(:,4)));
acc_bot2 = (temp2(:,5) - mean(temp2(:,5))); % this is the only one that matters in this case. maybe in all cases. 
                                          % Because it was always non-zero
dt = time2(2)-time2(1);
Fs1 = 1/dt;

%integrate acceleration
integral_force2 = trapz(force2(87:215));


%normalize acc vectors
% acc_top1 = acc_top1/integral_force1;
% acc_right1 = acc_right1/integral_force1;
% acc_left1 = acc_left1/integral_force1;
acc_bot2 = acc_bot2/integral_force2;

%plotting acceleration of bottom accelerometer vs. time.
% % figure();
plot(time2,acc_bot2,'g:','LineWidth',2);
legend('Babolat Racket', 'Head Racket');
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');
% %% Tune acc data from sample 2
% 
% N2 = length(temp1);
% time3 = temp3(:,1);
% force3 = temp3(:,6);
% force3 = (force3 - mean(force3(1:200)));
% % acc_top1 = (temp1(:,2) - mean(temp1(:,2)));
% % acc_right1 = (temp1(:,3) - mean(temp1(:,3)));
% % acc_left1 = (temp1(:,4) - mean(temp1(:,4)));
% acc_bot3 = (temp3(:,5) - mean(temp3(:,5))); % this is the only one that matters in this case. maybe in all cases. 
%                                           % Because it was always non-zero
% dt = time3(2)-time3(1);
% Fs1 = 1/dt;
% 
% %integrate acceleration
% df3 = diff(force3);
% di3 = find (abs(df3)>1);
% integral_force3 = trapz(force3(di3(1):di3(end)));
% 
% %normalize acc vectors
% % acc_top1 = acc_top1/integral_force1;
% % acc_right1 = acc_right1/integral_force1;
% % acc_left1 = acc_left1/integral_force1;
% acc_bot3 = acc_bot3/integral_force3;
% 
% %plotting acceleration of bottom accelerometer vs. time.
% % % figure();
% %  plot(time3,acc_bot3,'co','LineWidth',2);
% 
%  %% Tune acc data from sample 2
% 
% N2 = length(temp1);
% time4 = temp4(:,1);
% force4 = temp4(:,6);
% force4 = (force4 - mean(force4(1:200)));
% % acc_top1 = (temp1(:,2) - mean(temp1(:,2)));
% % acc_right1 = (temp1(:,3) - mean(temp1(:,3)));
% % acc_left1 = (temp1(:,4) - mean(temp1(:,4)));
% acc_bot4 = (temp4(:,5) - mean(temp4(:,5))); % this is the only one that matters in this case. maybe in all cases. 
%                                           % Because it was always non-zero
% dt = time4(2)-time4(1);
% Fs1 = 1/dt;
% 
% %integrate acceleration
% df4 = diff(force4);
% di4 = find (abs(df4)>1);
% integral_force4 = trapz(force4(di4(1):di4(end)));
% 
% %normalize acc vectors
% % acc_top1 = acc_top1/integral_force1;
% % acc_right1 = acc_right1/integral_force1;
% % acc_left1 = acc_left1/integral_force1;
% acc_bot4 = acc_bot4/integral_force2;
% 
% %plotting acceleration of bottom accelerometer vs. time.
% % figure();
% %  plot(time4,acc_bot4,'ys','LineWidth',2);
% 
%  %% Tune acc data from sample 2
% 
% N2 = length(temp1);
% time5 = temp5(:,1);
% force5 = temp5(:,6);
% force5 = (force5 - mean(force5(1:200)));
% % acc_top1 = (temp1(:,2) - mean(temp1(:,2)));
% % acc_right1 = (temp1(:,3) - mean(temp1(:,3)));
% % acc_left1 = (temp1(:,4) - mean(temp1(:,4)));
% acc_bot5 = (temp5(:,5) - mean(temp5(:,5))); % this is the only one that matters in this case. maybe in all cases. 
%                                           % Because it was always non-zero
% dt = time5(2)-time5(1);
% Fs1 = 1/dt;
% 
% %integrate acceleration
% df5 = diff(force5);
% di5 = find (abs(df5)>1);
% integral_force5 = trapz(force5(di5(1):di5(end)));
% 
% %normalize acc vectors
% % acc_top1 = acc_top1/integral_force1;
% % acc_right1 = acc_right1/integral_force1;
% % acc_left1 = acc_left1/integral_force1;
% acc_bot5 = acc_bot5/integral_force5;
% 
% %plotting acceleration of bottom accelerometer vs. time.
% % figure();
% %  plot(time5,acc_bot5,'k+','LineWidth',2);

