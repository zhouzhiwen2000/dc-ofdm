%% Test Interpolator
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
constants;

%% Inputs  
cpLen = 16;
dataIn = randi([0,255], (N+cpLen)*oversamplingFactor, 1) + ...
    1i*randi([0, 255], (N+cpLen)*oversamplingFactor, 1);
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


n = (-cpLen*oversamplingFactor:1:N*oversamplingFactor-1)';
expectedOut = real(dataIn).*cos(pi*n/oversamplingFactor) - imag(dataIn).*sin(pi*n/oversamplingFactor);


for i=1:length(startIdx)
    out = dataOut(startIdx(i):endIdx(i));
    assert(iskindaequal(expectedOut, out, maxError), "Upshifter output is not the same");
    assert(sum(validOut(startIdx(i):endIdx(i)) == 0) == 0);
end

%% Plotting
figure();
subplot(2,1,1);
plot(n, out, n, expectedOut);
legend("Out", "ExpectedOut");
xlabel("n [samples]");
ylabel("Signals");
title("Upshifter output");
xlim([min(n), max(n)]);
grid on;

subplot(2,1,2);
plot(n, abs(out-expectedOut));
xlabel("n [samples]");
ylabel("Error");
title("|out - expectedOut|");
xlim([min(n), max(n)]);
grid on;

disp("Test successfull!");