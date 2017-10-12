clear all;

% Select your CSV data file

% NOTE: this code may not work if the CSV file and this 
% m file are not in the same directory

[fn, pn] = uigetfile('');
filename = fn;

%read the data

data = csvread(filename, 1, 0);

% Define L as the total number of points 
% Double check that it is correct for your file!

L = length(data);

% We are assuming that you have time in the first column, 
% input in the 2nd column, and output in the 3rd column
% if not, change the code below as necessary

time = data(:, 1);
data_in = data(:, 2);
data_out = data(:, 3);

dt = time(2)-time(1);

% determine the sample rate - check that this is correct for your data!

fs = 1/dt;

% It is good practice to plot your data to make sure it was 
% read into Matlab correctly. We have done so for you below

figure;

subplot(2, 1, 2);
plot(time, data_out, 'g');
xlabel('Time (s)');
ylabel('Output');
a = axis;

subplot(2, 1, 1);
plot(time, data_in, 'b');
title('Time Series of Input and Output');
xlabel('Time (s)');
ylabel('Input');
axis(a);

% It would  be a good idea to look at the power spectral density (PSD)
% of both input and output and make sure they look as expected. 
% We have not done so here, but if you use this code for your Go Forth Data, 
% we strongly suggest you insert graphs of the PSD for both input and output here

% You can now find the transfer function! Please use 
% "help tfestimate" to read about what this line of code is doing. 

[H, F] = tfestimate(data_in, data_out, [], [], [], fs); 

% tfestimate returns the frequencies as F and the complex values
% of the transfer function as H

% Transfer Function Gain is the magnitude of H
H_mag = abs(H);

% Transfer Function Phase (in degrees!)
H_angle = angle(H)*180/(pi);

fprintf('The estimated transfer function has been computed! \n');
fprintf('You will need to now add this data to your Bode Plot  \n');
fprintf('required for the Lab 2 Postlab. The frequency data is \n'); 
fprintf('contained in the F vector. Please read the comments in \n');
fprintf('the m-file for more important information. Now hit enter to see \n');
fprintf('a graph of the coherence, an important measure of \n');
fprintf('how well the output is predicted by the operation of \n');
fprintf('the estimated transfer function on the input.\n \n');

pause;

% Now compute the coherence, which varies from 0 to 1
% and is a measure of how well the output is predicted 
% by operation of the estimated transfer function on the input

[Cxy, F] = mscohere(data_in, data_out, [], [], [], fs);

% we have plotted this for you below so that you can discuss the 
% meaning as you answer the Lab 2 Postlab questions. Print the graph
% and attach to the back of your Answer Booklet

figure;
semilogx(F, Cxy);
xlabel('Frequency (Hz)');
ylabel('Squared Coherence');
title('Coherence');
