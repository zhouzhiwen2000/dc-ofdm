%% Test Interpolator
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
constants;

%% Inputs
fTest = CONST.fPHY*CONST.txL/CONST.txM;
input{1} = rand(50000, 1) + 1i*rand(50000, 1);
input{2} = ones(1000, 1)*(1 + 1i);

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

%% Simulation Time
latency = 2000/fTest;         % Algorithm latency. Delay between input and output
stopTime = (length(validIn)-1)/fTest + latency;

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
    expectedOut = upshifter(CONST, input{i});
    
    assert(iskindaequal(expectedOut, out{i}, 10e-3), "Upshifter output is not the same");
    assert(sum(validOut(startIdx(i):endIdx(i)) == 0) == 0);
end

%% Plotting
n = 1:1:length(input{i});

figure();
subplot(2,1,1);
plot(n, out{i}, n, expectedOut);
legend("Out", "ExpectedOut");
xlabel("n [samples]");
ylabel("Signals");
title("Upshifter output");
xlim([min(n), max(n)]);
grid on;

subplot(2,1,2);
plot(n, abs(out{i}-expectedOut));
xlabel("n [samples]");
ylabel("Error");
title("|out - expectedOut|");
xlim([min(n), max(n)]);
grid on;

disp("Test successfull!");
