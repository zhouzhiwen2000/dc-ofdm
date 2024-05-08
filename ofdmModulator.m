%% DC OFDM Tx
% Transmitter compliant with the IEEE 802.15.13 standard
clc; clear; close all;

%% Parameters
M = 16;             % QAM Modulation order.
N = 256;            % Number of subcarriers.
nullIdx = (1:11)';  % Carriers that are unused [1;nfft] == [-nfft/2*fsc; (nfft/2-1)*fsc] 
cpLen = 16;         % Cyclic prefix length.
nSym = 1;           % Number of OFDM symbols to transmit.
fsc = 195.3125e3;   % Subcarrier spacing [Hz].
p = 4;              % Oversampling factor.

%% Intermediate variables
numDataCarriers = N - length(nullIdx);  % Amount of subcarriers with actual data
fSym = N*fsc;                           % OFDM symbol period (doesn't include CP) [seg]
fs = fSym*p;                            % Sampling frequency [Hz]

ts = -cpLen*p/fs:1/fs:(p*N-1)/fs;       % Sampling time vector

dataIn = [randi([0, M-1], numDataCarriers, nSym)];  % Random data input

%% Actual OFDM transmitter
qamSignal = qammod(dataIn, M, UnitAveragePower=false, PlotConstellation=false);
y = ofdmmod(qamSignal, N, cpLen, nullIdx, OversamplingFactor=p);
n = (-cpLen*p:1:N*p-1)';
s = real(y).*cos(pi*n/p) - imag(y).*sin(pi*n/p);

%% Plotting
figure(NumberTitle="off", Name="Figure");
subplot(2,1,1);
plot(ts(1:cpLen*p)/1e-9, s(1:cpLen*p));
hold on;
plot(ts(cpLen*p+1:end)/1e-9, s(cpLen*p+1:end));
hold on;
title("Transmitted signal");
legend("Cyclic Prefix", "Signal");
xlabel("Time [nseg]");
ylabel("s(t)")
grid on;

subplot(2,1,2);
[psd, fVector] = pwelch(s, rectwin(length(s)), [], 32768, fs, "centered");
plot(fVector/1e6, 10*log10(psd));
title("PSD of the transmitted singal")
xlabel("Freq. [MHz]");
ylabel("PSD [dB/Hz]");
grid on;

