%% Test IEEE 802.15.13 full receiver
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
addpath("../../src/rx");
constants;

%% Inputs
parametersFile = "sampleParametersFile";
delayIn = 5000;
SNR = 60;
%msgIn = 'This is a test of the RX for the UTN VLC Project!';
msgIn = randomStr(100);

pBits = str2binl(msgIn);
pBits = binl2tx(pBits);    % Input to the Tx should be LSB first.
[OFDMSignal, payloadExtraWords] = fullTx(parametersFile, pBits);
OFDMRx = channelSimulation(OFDMSignal, delayIn, SNR);
dataIn = OFDMRx;

%% Simulation Time
latency = 10000000/fs;         % Algorithm latency. Delay between input and output
stopTime = (length(dataIn)-1)/fs + latency;
payloadLenInFecBlocks = ceil(length(pBits)/payloadBitsPerBlock0);    % Used to end the simulation

%% Run the simulation
model_name = "HDLRx";

load_system(model_name);
simOut = sim(model_name);

dataOut = get(simOut, "dataOut");
startOut = get(simOut, "startOut");
endOut = get(simOut, "endOut");
validOut = get(simOut, "validOut");

headerEndOut = get(simOut, "headerEndOut");
endOutIdx = find(headerEndOut==1);
endOutIdx = endOutIdx(1);

reg0Out = get(simOut, "reg0Out");
reg0Out = reg0Out(endOutIdx);

reg1Out = get(simOut, "reg1Out");
reg1Out = reg1Out(endOutIdx);

reg2Out = get(simOut, "reg2Out");
reg2Out = reg2Out(endOutIdx);

reg3Out = get(simOut, "reg3Out");
reg3Out = reg3Out(endOutIdx);

%% Compare header
[reg0, reg1, reg2, reg3] = param2regs(parametersFile, pBits);
assert(isequal(reg0Out, reg0));
assert(isequal(reg1Out, reg1));
assert(isequal(reg2Out, reg2));
assert(isequal(reg3Out, reg3));
disp("Header was read correctly!");

%% Compare payload
startIdx = find(startOut == true);
endIdx = find(endOut == true);

assert(isequal(length(startIdx), length(endIdx)), ...
    "Length of start and end should be the same.");

assert(~isempty(startIdx), "No start signal");
assert(isequal(length(startIdx), payloadLenInFecBlocks), "Wrong number of payload bits read");

msgOut = '';
for i=1:length(startIdx)
    out = dataOut(startIdx(i):endIdx(i));
    if (i == length(startIdx))
        out = out(1:end-payloadExtraWords);
    end
    msgOut = strcat(msgOut, char(out)');
    assert(sum(validOut(startIdx(i):endIdx(i)) == 0) == 0);
end

assert(isequal(msgOut, msgIn), "Sent and received message should be the same!");

disp("Test successfull!");
