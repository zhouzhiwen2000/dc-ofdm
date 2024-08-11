%% Tx Rx: Test a communication between receiver and transmitter
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
constants;

%% Input
paramFile = "sampleParametersFile";
delayIn = 1000; % Used for channel simulation in Simulink
% msgIn = ['This is an example message used to test the transmitter. ' ...
%     'It is made large on purpose to test for a large message being ' ...
%     'transmitted'];
msgIn = randomStr(4096);

pBits = str2binl(msgIn);
pBits = getPayloadParamsFromBits(pBits);
pWords = binl2str(pBits);

validIn = true(length(pWords), 1);
newFrame = logical([1; 0]);

[reg0, reg1, reg2, reg3] = param2regs(paramFile, pBits);

% payloadLenInFecBlocks is used to end the simulation, and
% payloadExtraWords is used to remove the additional bytes from the
% messsage.
[~, payloadLenInFecBlocks, ~, ~, payloadExtraWords] = ...
    getPayloadParamsFromBits(pBits);

%% Simulation Time
latency = 1000000/fs;         % Algorithm latency. Delay between input and output
stopTime = (length(validIn)-1)/fs + latency;

%% Run the simulation
model_name = "HDLTxRx";

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
