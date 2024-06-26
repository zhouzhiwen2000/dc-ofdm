%% Test Interpolator
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
constants;

%% Inputs
input{1} = rand(N*oversamplingFactor, 1) + 1i*rand(N*oversamplingFactor, 1);
input{2} = rand(N*oversamplingFactor, 1) + 1i*rand(N*oversamplingFactor, 1);

dataIn = [
    input{1};
    input{2};
];

resetIn = [
    true;
    false(length(input{1})-1, 1);
    true
];

validIn = true(length(dataIn), 1);
maxError = 1e-3;    % Maximum error between out and expectedOut

%% Simulation Time
latency = 200/fs;         % Algorithm latency. Delay between input and output
stopTime = (length(validIn)-1)/fs + latency;

%% Run the simulation
model_name = "HDLFreqUpshift";

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

dataOut = dataOut(startIdx:endIdx);
out{1} = dataOut(1:length(input{1}));
out{2} = dataOut(length(input{1})+1:end);

for i=1:length(startIdx)
    n = (0:1:length(input{i})-1)';
    expectedOut = real(input{i}).*cos(pi*n/oversamplingFactor) - imag(input{i}).*sin(pi*n/oversamplingFactor);
    
    assert(iskindaequal(expectedOut, out{i}, maxError), "Upshifter output is not the same");
    assert(sum(validOut(startIdx(i):endIdx(i)) == 0) == 0);
end

%% Plotting
figure();
subplot(2,1,1);
plot(n, out{1}, n, expectedOut);
legend("Out", "ExpectedOut");
xlabel("n [samples]");
ylabel("Signals");
title("Upshifter output");
xlim([min(n), max(n)]);
grid on;

subplot(2,1,2);
plot(n, abs(out{1}-expectedOut));
xlabel("n [samples]");
ylabel("Error");
title("|out - expectedOut|");
xlim([min(n), max(n)]);
grid on;

disp("Test successfull!");
