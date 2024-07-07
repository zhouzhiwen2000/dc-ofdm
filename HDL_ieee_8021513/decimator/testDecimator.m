%% Test Decimator
clc; clear; close all;
addpath("../../src");
addpath("../../src/rx")
addpath("../../inc");
constants;

%% Inputs
nSym = 5;
fc = 1e6;                      % Carrier frequency for sinusoidal function
t = (0:1/fs:nSym/fc-1/fs)'; 

input{1} = cos(2*pi*fc*t);
input{2} = sin(2*pi*fc*t);

dataIn = [
    input{1};
    zeros(100, 1);
    input{2};
];

validIn = [
    true(size(input{1}));
    false(100, 1);
    true(size(input{2}));
];

maxError = 1e-3;    % Maximum error between out and expectedOut

%% Simulation Time
latency = 200/fs;         % Algorithm latency. Delay between input and output
stopTime = (length(validIn)-1)/fs + latency;

%% Run the simulation
model_name = "HDLDecimator";

load_system(model_name);
simOut = sim(model_name);

dataOut = get(simOut, "dataOut");
startOut = get(simOut, "startOut");
endOut = get(simOut, "endOut");
validOut = get(simOut, "validOut");

%% Compare with MATLAB reference algorithm
startIdx = find(startOut == true);
endIdx = find(endOut == true);

assert(isequal(length(startIdx), length(endIdx)), ...
    "Length of start and end should be the same.");

for i=1:length(startIdx)
    out = dataOut(startIdx(i):endIdx(i));
    expectedOut = decimator(input{i});
    assert(iskindaequal(expectedOut, out, maxError));
    assert(sum(validOut(startIdx(i):endIdx(i)) == 0) == 0);
end

%% Plotting
n_in = (0:1:length(input{2})-1)';
n_out = (0:2:length(input{2})-1)';
figure();
subplot(3,1,1);
plot(n_in, input{2}, n_out, out, n_out, expectedOut);
title("Signals");
legend("Input", "Out", "ExpectedOut");
xlabel("n [samples]");
ylabel("Amplitude");
xlim([min(n_in), max(n_in)]);
grid on;

subplot(3,1,2);
plot(n_out, abs(out-expectedOut));
xlabel("n [samples]");
ylabel("Error between Matlab and Simulink");
title("|out - expectedOut|");
xlim([min(n_out), max(n_out)]);
grid on;

subplot(3,1,3);
plot(n_out, abs(input{2}(1:2:end) - out));
xlabel("n [samples]");
ylabel("Error between Input and Output");
title("|out - input|");
xlim([min(n_out), max(n_out)]);
grid on;

disp("Test successfull!");
