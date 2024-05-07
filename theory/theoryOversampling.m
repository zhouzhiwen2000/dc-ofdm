%% Theory Oversampling
% In this file we go through the concepts of upsampling a signal
clc; clear; close all;

%% Parameters
fSymbol = 10;                               % Symbol frequency
tSymbol = -10:1/fSymbol:10-1/fSymbol;       % Symbol time vector
N = nextpow2(length(tSymbol))*2048;         % FFT samples
L = 4;                                      % Upsampling factor

fs = fSymbol*L;                             % Sampling frequency
ts = -10:1/fs:10-1/fs;                      % Sampling time vector

%% Signal representation
% The signal is represented with a certain amount of samples "tSymbol"
x = sinc(tSymbol);
[psd, f] = pwelch(x, rectwin(length(x)), [], N, fs, "centered");

figure(NumberTitle="off", Name="Oversampling demostration");
subplot(3,2,1);
stem(tSymbol, x);
xlabel("Time [seg]");
ylabel("x(t)");
title("Input signal");
grid on;

subplot(3,2,2);
plot(f, 10*log10(psd));
xlabel("Freq. [Hz]");
ylabel("PSD [W/Hz]");
title("PSD of the input signal");
grid on;

%% Signal upsampled with zeros
% The signal is constructed with "L-1" zeros between samples
% According to the properties of the DFT:
% x[n/L] -> X(L*Omega)
% Which means that the frequency spectrum is going to be compressed by a
% factor of "L", and we should see "L/2" extra repetitions of the spectrum.
xUp = upsample(x, L);
[psd, f] = pwelch(xUp, rectwin(length(xUp)), [], N, fs, "centered");

subplot(3,2,3);
stem(ts, xUp);
xlabel("Time [seg]");
ylabel(sprintf("x(t) upsampled by L=%d", L));
title("Upsampled signal with L-1 zeros");
grid on;

subplot(3,2,4);
plot(f, 10*log10(psd));
xlabel("Freq. [Hz]");
ylabel("PSD [W/Hz]");
title("PSD of the upsampled signal");
grid on;

%% Signal interpolated
% When applied a FIR lowpass filter, only the compressed spectrum remains.
xIn = resample(x, L, 1);
[psd, f] = pwelch(xIn, rectwin(length(xIn)), [], N, fs, "centered");

subplot(3,2,5)
stem(ts, xIn);
xlabel("Time [seg]");
ylabel("x(t) interpolated");
title("Interpolated signal with a FIR lowpass");
grid on;

subplot(3,2,6);
plot(f, 10*log10(psd));
xlabel("Freq. [Hz]");
ylabel("PSD [W/Hz]");
title("PSD of the interpolated signal");
grid on;
