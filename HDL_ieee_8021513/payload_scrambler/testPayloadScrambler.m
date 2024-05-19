%% Test Payload Scrambler
clc; clear; close all;
addpath("../../src/")

%% Inputs
input1 = true(32,1);
SI1 = true(32,4);

input2 = input1;
SI2 = SI1;

input3 = logical(randi([0 1], 256, 1));
SI3 = logical([1 0 0 0]);
SI3 = repmat(SI3, size(input3));

validIn = [
    true(size(input1));
    false(2,1);
    true(size(input2));
    false(2,1);
    true(size(input3))];

dataBits = [
    input1;
    false(2,1);
    input2;
    false(2, 1);
    input3];

SI = [SI1; false(2,4); SI2; false(2,4); SI3];

%% Simulation time
fs = 1;             % Output sample frequency
latency = 1;        % Algorithm latency. Delay between input and output
stopTime = (length(dataBits)-1)/fs + latency;

%% Run the simulation
model_name = "HDLPayloadScrambler";

load_system(model_name);
simOut = sim(model_name);

dataOut = get(simOut, "dataOut");
validOut = get(simOut, "validOut");

dataOut1 = dataOut(1+latency:length(input1)+latency);
dataOut2 = dataOut(latency+length(input1)+3 : latency+length(input1)+2+length(input2));
dataOut3 = dataOut(latency+length(input1)+length(input2)+5:end);

%% Compare with MATLAB reference algorithm
expectedOut1 = payloadScrambler(SI1(1,:), input1);
expectedOut2 = expectedOut1;
expectedOut3 = payloadScrambler(SI3(1,:), input3);

% Check delay between input and output
assert(isequal(validOut(1+latency:end), validIn));

% First output must be the same
assert(isequal(dataOut1, expectedOut1));

% After a reset, second output should be the same
assert(isequal(dataOut2, expectedOut2));

% Data should match the scrambler
assert(isequal(dataOut3, expectedOut3));

disp("Simulation successful!");
