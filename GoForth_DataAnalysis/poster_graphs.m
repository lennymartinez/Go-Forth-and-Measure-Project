close all; clear all;

[fn, pn] = uigetfile('B_d1_2.csv');
filename = fn;

%read the data
data = csvread(filename, 1, 0);

L = length(data);

B_location = data(:,1);
B_gain = data(:,2);
H_location = data(:,3);
H_gain = data(:,4);
P_location = data(:,5);
P_gain = data(:,6);


syms x;

%% Babolat Fit
f1(x)= 296.2*x^2 + 4.503*x + 63.61;
%p1 = 244.2  (171, 317.3)
%p2 = 4.503  (-24.38, 33.39)
%p3 = 63.61  (41.43, 85.79)

%% Head Fit
f2(x)= 437*x^2 + -369.9*x + 361.5;
%p1 = 437  (-103.4, 977.5)
%p2 = -369.9  (-596.1, -143.7)
%p3 = 361.5  (163.3, 559.8)

%% Prince Fit
f3(x)= 1043*x^2 + -300.2*x + 225.4;
%p1 = 1043  (454.9, 1631)
%p2 = -300.2  (-532.9, -67.51)
%p3 = 225.4  (57.8, 393)

%% Basic Plots

b = linspace(-0.72,0.72);
h = linspace(-0.74,0.74);
p = linspace(-0.70,0.70);

figure(1)
plot(B_location,B_gain,'o');
xlabel('Distance from center')
ylabel('Maximum Gain')
hold on;
plot(b,f1(b));
% 
% figure(2)
% % plot(H_location,H_gain,'o')
% % xlabel('Distance from center')
% % ylabel('Maximum Gain')
% hold on;
% plot(h,f2(h));
% 
% figure(3)
% % plot(P_location,P_gain,'o');
% % xlabel('Distance from center')
% % ylabel('Maximum Gain')
% % hold on;
% plot(p,f3(p));

%% Minimum and Cutoffs
bmin = min(f1(b));
yb = bmin*1.10;

hmin = min(f2(h));
yh = hmin*1.10;

pmin = min(f3(p));
yp = pmin*1.10;

plot([-0.3076 0.2948], [yb yb]);
