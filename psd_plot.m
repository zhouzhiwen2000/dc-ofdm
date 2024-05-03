%% PSD Plot
% This file has different ways to calculate the PSD and the discrete power
% spectrum of a signal.
clc; clear; close all;

Fs = 1000;                              % Sampling frequency
t = 0:1/Fs:0.5-1/Fs;                    % Time vector

% Cosine signal
N = length(t);                          % Amount of samples for the FFT
x = cos(2*pi*100*t) + randn(size(t));   % Temporal signal

% Rectangular pulse signal
%N = 800;
%x = zeros(1, length(t));
%x(1:1:floor(length(x)/10)) = ones(1, floor(length(x)/10));

%% Time Representation
figure();
plot(t, x);
grid on;
title("Signal in the time domain");
xlabel("time [seg]");
ylabel("x(t) [V]");

%% FFT for Power Spectrum
figure();
subplot(5,1,1);
psd = fft(x, N);
psd = psd(1:N/2+1);
psd = (1/length(x))^2 * abs(psd).^2;
psd(2:end-1) = 2*psd(2:end-1);
freq = 0:Fs/N:Fs/2;
plot(freq,10*log10(psd));
grid on; 
title('Power Spectrum Using FFT');
xlabel('Frequency [Hz]');
ylabel('Power [dB]');

%% FFT for PSD
subplot(5,1,2);
psd = fft(x, N);
psd = psd(1:N/2+1);
psd = (1/(length(x)*Fs)) * abs(psd).^2;
psd(2:end-1) = 2*psd(2:end-1);
freq = 0:Fs/N:Fs/2;
plot(freq,10*log10(psd));
grid on; 
title('PSD Using FFT');
xlabel('Frequency [Hz]');
ylabel('PSD [dB/Hz]');

%% Periodogram
subplot(5,1,3);
[pxx, f] = periodogram(x,rectwin(length(x)), N,Fs);
plot(f, 10*log10(pxx))
grid on; 
title('Periodogram PSD Estimate');
xlabel('Frequency [Hz]');
ylabel('PSD [dB/Hz]');

%% Pwelch Power
subplot(5,1,4);
[pxx,f] = pwelch(x,rectwin(length(x)),[],N,Fs, "power");
plot(f,10*log10(pxx));
grid on; 
title('Pwelch Power Spectrum');
xlabel('Frequency [Hz]');
ylabel('Power [dB]');

%% Pwelch PSD
subplot(5,1,5);
[pxx,f] = pwelch(x,rectwin(length(x)),0,N,Fs, "psd");
plot(f,10*log10(pxx));
grid on; 
title('Pwelch PSD Estimate');
xlabel('Frequency (Hz)');
ylabel('PSD [dB/Hz]');