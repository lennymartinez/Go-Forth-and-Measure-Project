clear all; close all;

%% Longitudinal plots
H_loc_long = [-0.744897959 -0.43877551 -0.204081633  0.204081633 0.43877551 0.744897959];
B_loc_long = [-0.721153846 -0.451923077 -0.221153846  0.221153846 0.451923077 0.721153846];
P_loc_long = [-0.705882353 -0.431372549 -0.215686275 0 0.215686275 0.431372549 0.705882353];

H_long = [722.56342 1246.2 189.807  116.91854 418.354375 341.1672];
B_long = [208.8576 64.13573333 89.4023 59.9414333 141.895975 109.4698];
P_long = [1130.81215 277.2495333 192.93748 369.69376 432.93328 340.10132 359.5595];
% plot(H_loc_long,H_long,'o')
% hold on;
% plot(P_loc_long,P_long,'o')
% plot(B_loc_long,B_long,'o')
% legend('Head', 'Prince','Babolat')
% xlabel('Distance from Center')
% ylabel('Max Gain')

%% Latitudinal plots
B_loc_lat = [-0.549019608 -0.261437908 0.261437908 0.549019608];
H_loc_lat = [-0.55033557 -0.268456376 0.268456376 0.55033557];
P_loc_lat = [-0.503936 -0.251968 0.251968 0.503936];

B_lat = [273.06764 226.46178 271.09724 280.97276];
P_lat = [131.4269667 337.6766 338.95344 196.04824];
H_lat = [347.66772 360.279852 317.17492 219.48526];

% figure();
% plot(H_loc_lat,H_lat,'o')
% hold on;
% plot(P_loc_lat,P_lat,'o')
% plot(B_loc_lat,B_lat,'o')
% legend('Head', 'Prince','Babolat')
% xlabel('Distance from Center')
% ylabel('Max Gain')

%% Parabola Babolat
syms n;
% %longitude
%        k1 =       179.1;%  (-145.5, 503.7)
%        k2 =      -27.84;%  (-153.2, 97.52)
%        k3 =       66.12;%  (-39, 171.2)
% 
% f(n) = k1*n^2 + k2*n + k3;
% t = linspace(-0.55,0.55);
% figure(22)
% plot(t,f(t));
% hold on
% plot(B_loc_long,B_long,'o')       
% xlabel('Distance from Center')
% ylabel('Max Gain')

%% Parabola Head
% %longitude
% k1 =449.9;%  (-2125, 3025)
%        k2 =      -419.6;%  (-1501, 661.9)
%        k3 =       387.5;%  (-488, 1263)
% 
% f(n) = k1*n^2 + k2*n + k3;
% t = linspace(-0.75,0.75);
% figure(22)
% plot(t,f(t));
% hold on
% plot(H_loc_long,H_long,'o')       
% xlabel('Distance from Center')
% ylabel('Max Gain')


%% Parabola Prince
longitude
       k1 =       900.7;  %(-373, 2174)
       k2 =      -318.5;  %(-860.7, 223.7)
       k3 =       255.3;  %(-108.2, 618.7)

f(n) = k1*n^2 + k2*n + k3;
t = linspace(-0.71,0.71);
figure(22)
plot(t,f(t));
hold on
plot(H_loc_long,H_long,'o')       
xlabel('Distance from Center')
ylabel('Max Gain')

%% Math for radii calculation
t = linspace(-0.8,0.8);
B(n) = 179.1*n^2-27.84*n+66.12;
H(n) = 449.9*n^2-419.6*n+387.5;
P(n) = 900.7*n^2-318.5*n+255.3;
plot(t,P(t))






