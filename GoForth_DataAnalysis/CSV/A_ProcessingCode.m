clear all;

% Select your CSV data file
[fn, pn] = uigetfile('B_d1_2.csv');
filename = fn;

%read the data
data = csvread(filename, 1, 0);

L = length(data);   % Define L as the total number of points

% We are assuming that you have time in the first column, 
% input in the 2nd column, and output in the 3rd column
% if not, change the code below as necessary
time = data(:, 1);
data_in = data(:, 3);
data_out = data(:, 2);

dt = time(2)-time(1);

% determine the sample rate - check that this is correct for your data!

fs = 1/dt;

% It is good practice to plot your data to make sure it was 
% read into Matlab correctly. We have done so for you below

figure;
time2 = [0; 0; 0; 0; 0;0;0;0;0;0;0;0;0;0;0; time];
data_out2 = [0;0;0;0;0;0;0;0;0;0;0;0;0;0;0; data_out];
data_in2 = [0;0;0;0;0;0;0;0;0;0;0;0;0;0;0; data_in];

subplot(2, 1, 2);
plot(time2, data_out2, 'g');
xlabel('Time (s)');
ylabel('Output');
a = axis;

subplot(2, 1, 1);
plot(time2, data_in2, 'b');
xlabel('Time (s)');
ylabel('Input');
axis(a);


% You can now find the transfer function!

[H, F] = tfestimate(data_in, data_out, [], [], [], fs); 

% tfestimate returns the frequencies as F and the complex values
% of the transfer function as H
% Transfer Function Gain is the magnitude of H
H_mag = abs(H);
[K_max t_max] = max(H_mag);
F_max = F(t_max);

%A = [F_max K_max]
A = K_max;

Frange = linspace(0,max(F),1025);
figure(3)
loglog(Frange,H_mag);
hold on ;
scatter(F_max,K_max);
xlabel('Frequency (Hz)');
ylabel('Gain (m/s^2/N)');

% %% Test
% % tfestimate returns the frequencies as F and the complex values
% % of the transfer function as H
% 
% % Transfer Function Gain is the magnitude of H
% H_mag = abs(H);
% 
% % Transfer Function Phase (in degrees!)
% H_angle = angle(H)*180/(pi);
% 
% fprintf('The estimated transfer function has been computed! \n');
% fprintf('You will need to now add this data to your Bode Plot  \n');
% fprintf('required for the Lab 2 Postlab. The frequency data is \n'); 
% fprintf('contained in the F vector. Please read the comments in \n');
% fprintf('the m-file for more important information. Now hit enter to see \n');
% fprintf('a graph of the coherence, an important measure of \n');
% fprintf('how well the output is predicted by the operation of \n');
% fprintf('the estimated transfer function on the input.\n \n');
% 
% pause;
% 
% % Now compute the coherence, which varies from 0 to 1
% % and is a measure of how well the output is predicted 
% % by operation of the estimated transfer function on the input
% 
% [Cxy, F] = mscohere(data_in, data_out, [], [], [], fs);
% 
% % we have plotted this for you below so that you can discuss the 
% % meaning as you answer the Lab 2 Postlab questions. Print the graph
% % and attach to the back of your Answer Booklet
% 
% figure;
% semilogx(F, Cxy);
% xlabel('Frequency (Hz)');
% ylabel('Squared Coherence');
% title('Coherence');
% 
