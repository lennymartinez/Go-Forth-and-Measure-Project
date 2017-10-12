clear all;
close all;
% Read in file
[fn, pn] = uigetfile('*.csv');
filename = strcat(pn, fn);
temp = csvread(filename, 1, 0);
% Set basic parameters such as number of samples,
% time, force and acceleration
N = length(temp); % number of samples
time = temp(:,1);
% assumes force is in the 2nd column of your data file. 
% if not, fix the column reference below
% subtract the average force before the impulse (if you do not have 200
% points before the force peak, change the number in line 16
force = temp(:,6);
force = (force - mean(force(1:200)));
% this program reads in only one acceleration column, assumed to be Col 3
% add additional acceleration vectors as needed
acc_data = (temp(:,3) - mean(temp(:,3)));
% find the sample rate
dt = time(2)-time(1);
Fs = 1/dt
% define the frequency vector from the sample rate and the number of points
f = Fs*(0:(N/2))/N;
% Find system parameters from data
% You will need to tell MATLAB how many poles and zeros 
% We have assumed 2 poles and no zeroes (line 29)
resp_data = iddata(acc_data, force, dt);
sys = tfest(resp_data, 2, 0);
[num, den] = tfdata(sys);
% Creating the State Space Response from model
% dend and numd contain the coefficients of the numerator and denominator of
% the transfer function with the assumed number of poles and zeros
dend = cell2mat(den);
numd = cell2mat(num);
% If your system has two poles and no zeroes, you may uncomment the
% following code to find the static gain, alpha, the natural frequency, wn,
% and the damping, zeta
% wn = sqrt(dend(3)) % ONLY for 2 poles & no zeroes!
% zeta = dend(2)/(2*wn) % ONLY for 2 poles & no zeroes!
% alpha = numd(3)/wn^2  % ONLY for 2 poles & no zeroes!
[A,B,C,D]= tf2ss(numd, dend);
sysi = ss(A, B, C, D); % This is only true for the impulse not a step
[mag, phase, wout] = bode(sysi, 2*pi*f);
% Now find the integral of the force impulse
% First, take the derivative of the force and find all values for which the
% absolute value of the derivative (slope of force vs time) is greater than
% 1. You will use this to find the integration limits for the force impulse
df = diff(force);
di = find (abs(df)>1);
% Second, integrate the force over the region where it is changing (i.e. over
% the peak). It is a good idea for you to check the peak definition by 
% uncommenting the two lines below
%figure
%plot(time(di(1):di(end)),force(di(1):di(end))); 
integral_force = trapz(force(di(1):di(end)));
% Divide the acceleration data by the integrated force impulse to create 
% the UNIT implulse response, and then take the Fourier transform to find
% the measured acceleration frequency response. 
dft_IR2 = fft(acc_data/integral_force);
dft_IR = abs(dft_IR2(1:((floor(N/2))+1)));
phase_IR = unwrap(angle(dft_IR2(1:((floor(N/2))+1))));
% Plot the data with the model Transfer Function
figure;
loglog(f, dft_IR, wout/(2*pi), squeeze(mag));
ylabel('Magnitude');
xlabel('Frequency (Hz)');
grid on;
legend('Impulse Response Data', 'Model');