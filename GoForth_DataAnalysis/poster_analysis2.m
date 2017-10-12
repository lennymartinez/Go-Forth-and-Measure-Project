% close all; clear all; 
% 
% %%Import Data
% [fn, pn] = uigetfile('B_d1_2.csv');
% filename = fn;
% 
% %read the data
% data = csvread(filename, 1, 0);
% L = length(data);
% 
% B_location = data(:,1);
% B_avg = data(:,2);
% B_2SD = data(:,3);
% 
% H_location = data(:,4);
% H_avg = data(:,5);
% H_2SD = data(:,6);
% 
% P_location = data(:,7);
% P_avg = data(:,8);
% P_2SD = data(:,9);

%% Fit Things
t = linspace(-1,1);
syms x; 
f1(x) = 296.7*x^2 + 3.791*x + 43.04; %Babolat
f2(x) = 756.1*x^2 - 188.9*x + 141; %Head
f3(x) = 854.5*x^2 - 205.2*x + 211.9; %Prince

%% Error Bars
B_low = B_avg - B_2SD;
B_high = B_avg + B_2SD;
H_low = H_avg - H_2SD;
H_high = H_avg + H_2SD;
P_low = P_avg - P_2SD;
P_high = P_avg + P_2SD;

%% Minima & 10% cutoffs

%Minima
[B_min] = min(f1(t));
B_i = -0.0101;
[H_min] = min(f2(t));
H_i = 0.1313;
[P_min] = min(f3(t));
P_i = 0.1111;

%10 cutoff magnitude (y val)
B10 = B_min*1.10;
H10 = H_min*1.10;
P10 = P_min*1.10;

%10 percent intercept (x val)
Bx_low = -0.12694;
Bx_high = 0.11417;
Hx_low =  -0.0059751;
Hx_high = 0.25581;
Px_low = -0.033046;
Px_high = 0.27319;

Bx = [Bx_low Bx_high];
Hx = [Hx_low Hx_high];
Px = [Px_low Px_high];

kB = linspace(Bx_low,Bx_high);
kH = linspace(Hx_low,Hx_high);
kP = linspace(Px_low,Px_high);

%% Start Plotting Shit
% syms j
% f4(x,j) = j+0*x;
% e = [0; 0; 0; 0; 0; 0;];
% 
% figure(1)
% errorbarxy(B_location, B_avg,e, B_low, e, B_high)
% hold on;
% plot(B_location,B_avg,'o');
% plot(t, f1(t));
% plot(B_i,B_min,'x');
% plot(Bx,[B10 B10],'d');
% plot(kB,f4(kB,B10));
% xlabel('Distance from center')
% ylabel('Gain (m/s^2 /N)');
% 
% figure(2)
% errorbarxy(H_location, H_avg,e, H_low, e, H_high)
% hold on;
% plot(H_location,H_avg,'o');
% plot(t, f2(t));
% plot(H_i,H_min,'x');
% plot(Hx,[H10 H10],'d');
% plot(kH,f4(kH,H10));
% xlabel('Distance from center')
% ylabel('Gain (m/s^2 /N)');
% 
% figure(3)
% errorbarxy(P_location, P_avg,e, P_low, e, P_high)
% hold on;
% plot(P_location,P_avg,'o');
% plot(t, f3(t));
% plot(P_i,P_min,'x');
% plot(Px,[P10 P10],'d');
% plot(kP,f4(kP,P10));
% xlabel('Distance from center')
% ylabel('Gain (m/s^2 /N)');

%% SIZE matters

% P_length = 12.75;
% B_length = 13;
% H_length = 12.75;

DB = abs(Bx_low - Bx_high);
DH = abs(Hx_high- Hx_low);
DP = abs(Px_high- Px_low);

%%Finding Uncertainty in the damn final results

f6(x) = 221*x^2 -30*x + 22; %Babolat
f7(x) = 539*x^2 - 291*x + 62; %Head
f8(x) = 426*x^2 - 372*x + 91; %Prince

f9(x) = 371*x^2 + 36*x + 64; %Babolat
f10(x) = 973*x^2 - 85*x + 220; %Head
f11(x) = 1282*x^2 - 38*x + 331; %Prince

A10 = min(f11(t))*1.10
x1 = -0.14587;
x2 = 0.17551;
diff = abs(x1 - x2)
