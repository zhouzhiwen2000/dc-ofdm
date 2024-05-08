%% Theory OFDM
% In this file we understand the frequency components and subcarrier
% associaton of the OFDM signal, going through the Hermitian Symmetry and
% the upshifted signal.
clc; clear; close all;

%% Parameters
N = 16;                                 % Number of subcarriers
fsc = 100/N;                            % Sub-carrier frequency spacing
fSymbol = fsc*N;                        % Symbol frequency
L = 4;                                  % Oversampling factor
nfft = 8192;                            % FFT symbols for plotting the PSD

tSymbol = 0:1/fSymbol:(N-1)/fSymbol;    % Symbol time vector
fs = fSymbol*L;                         % Sampling frequency
ts = 0:1/fs:(N*L-1)/fs;                 % Sampling time vector

%% Hermitian simmetry and real signal
% Frequency components of a real signal with Hermitian symmetry:
% c_n = c_-n*
symbols = [...
    0, 7+7i, 6+6i, 5+5i, 4+4i, 3+3i, 2+2i, 1+1i, ...
    0, ...
    1-1i, 2-2i, 3-3i, 4-4i, 5-5i, 6-6i, 7-7i]';

% Temporal signal should be real, and ready to be transmitted directly
ofdmSignal = ofdmmod(symbols, N, 0);

assert(isreal(ofdmSignal), "OFDM Signal with Hemitian Symmetry should be real");

% Upsample signal to match sampling frequency
ofdmSignalUp = resample(ofdmSignal, L, 1);

[psd, fVector] = pwelch(ofdmSignal, rectwin(length(ofdmSignal)), [], nfft, fs, "centered");
[psdUp, fVectorUp] = pwelch(ofdmSignalUp, rectwin(length(ofdmSignalUp)), [], nfft, fs, "centered");

figure(NumberTitle="off", Name="Hermitian Simmetry OFDM signal");
subplot(2,2,1);
stairs(tSymbol/1e-3, ofdmSignal);
title("s(t) with Hermitian Symmetry");
xlabel("Time [mseg]");
xlim([ts(1) ts(end)]/1e-3);
ylabel("s(t)");
grid on;

subplot(2,2,2);
plot(fVector, psd);
title("Baseband OFDM PSD");
xlabel("Freq. [Hz]");
ylabel("PSD [W/Hz]");
grid on;

subplot(2,2,3);
plot(ts/1e-3, ofdmSignalUp);
title("s_{n/p}(t) upsampled")
xlabel("Time [mseg]");
xlim([ts(1) ts(end)]/1e-3)
ylabel("s_{n/p}(t)");
grid on;

subplot(2,2,4);
plot(fVectorUp, psdUp);
title("Baseband OFDM PSD Upsampled");
xlabel("Freq. [Hz]");
ylabel("PSD [W/Hz]");
grid on;

%% Complex OFDM signal with frequency upshift
% Frequency components of a complex signal (not complex conjugates)
symbols = [...
    8+8i, 8+8i, 8+8i, 8+8i, 8+8i, 8+8i, 8+8i, 8+8i, ...
    0, ...
    4+4i, 0, 4+4i, 0, 4+4i, 0, 4+4i]';

% Temporal signal should be complex, can't be transmitted directly
ofdmSignal = ofdmmod(symbols, N, 0);

assert(~isreal(ofdmSignal), "OFDM Signal should not be real");

% Upsample signal to match sampling frequency
ofdmSignalUp = resample(ofdmSignal, L, 1);

% Apply frequency upshift
n = (0:1:length(ofdmSignalUp)-1)';
ofdmSignalMov = real(ofdmSignalUp).*cos(pi*n/L) - imag(ofdmSignalUp).*sin(pi*n/L);

[psd, fVector] = pwelch(ofdmSignal, rectwin(length(ofdmSignal)), [], nfft, fs, "centered");
[psdUp, fVectorUp] = pwelch(ofdmSignalUp, rectwin(length(ofdmSignalUp)), [], nfft, fs, "centered");
[psdMov, fVectorMov] = pwelch(ofdmSignalMov, rectwin(length(ofdmSignalMov)), [], nfft, fs, "centered");

figure(NumberTitle="off", Name="Complex OFDM signal");
subplot(3,3,1);
stairs(tSymbol/1e-3, real(ofdmSignal));
title("Real s_{baseband}(t)")
xlabel("Time [mseg]");
xlim([ts(1) ts(end)]/1e-3);
ylabel("Real s_{baseband}(t)")
grid on;

subplot(3,3,2)
stairs(tSymbol/1e-3, imag(ofdmSignal));
title("Complex s_{baseband}(t)")
xlabel("Time [mseg]");
xlim([ts(1) ts(end)]/1e-3);
ylabel("Complex s_{baseband}(t)")
grid on;

subplot(3,3,3);
plot(fVector, psd);
title("Baseband OFDM PSD");
xlabel("Freq. [Hz]");
ylabel("PSD [W/Hz]");
grid on;

subplot(3,3,4);
plot(ts/1e-3, real(ofdmSignalUp));
title("Real s_{baseband}(t) upsampled")
xlabel("Time [mseg]");
xlim([ts(1) ts(end)]/1e-3)
ylabel("s_{n/p}(t)");
grid on;

subplot(3,3,5);
plot(ts/1e-3, imag(ofdmSignalUp));
title("Complex s_{baseband}(t) upsampled")
xlabel("Time [mseg]");
xlim([ts(1) ts(end)]/1e-3)
ylabel("s_{n/p}(t)");
grid on;

subplot(3,3,6);
plot(fVectorUp, psdUp);
title("Baseband OFDM PSD Upsampled");
xlabel("Freq. [Hz]");
ylabel("PSD [W/Hz]");
grid on;

subplot(3,3,[7, 8]);
plot(ts/1e-3, ofdmSignalMov);
title("Real\{s_{n/p}(t)*e^{i*2\pi*f_{US}}\}")
xlabel("Time [mseg]");
xlim([ts(1) ts(end)]/1e-3)
ylabel("s_{n/p}(t)");
grid on;

subplot(3,3,9);
plot(fVectorMov, psdMov);
title("Baseband OFDM PSD Upsampled");
xlabel("Freq. [Hz]");
ylabel("PSD [W/Hz]");
grid on;
