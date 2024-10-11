%% Theory Oversampling
% In this file we go through the concepts of upsampling a signal
clc; clear; close all;

%% Parameters
f_sinc = 1;                             % Frequency of the sinc signal

f_phy = 10;                             % Symbol frequency
tSymbol = -2:1/f_phy:2-1/f_phy;         % Symbol time vector
N = 1024;                               % FFT samples
L = 4;                                  % Upsampling factor

f_DAC = f_phy*L;                        % Sampling frequency
ts = -2:1/f_DAC:2-1/f_DAC;              % Sampling time vector

%% Signal representation
% The signal is represented with a certain amount of samples "tSymbol"
x = sinc(tSymbol*f_sinc);
[psd, f] = pwelch(x, rectwin(length(x)), [], N, f_phy, "centered");

%%%%%%%%%%

figure(WindowState="maximized");

stem(tSymbol, x, LineWidth=2, Marker="o", MarkerFaceColor="auto");

xlabel('Tiempo $[\mu s]$', FontSize=18 ,Interpreter="latex");
ylabel('$x[n] = \textrm{sinc}(n)$', FontSize=18, Interpreter="latex");
title("Se\~{n}al de entrada", Interpreter="latex");

fontsize(gca, 18, "points");
set(gca,'TickLabelInterpreter','latex');

xline(1/f_sinc, LineWidth=2, LineStyle="-.", Label='$\frac{1}{fs}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='right', FontSize=24, Interpreter='latex');

xline(-1/f_sinc, LineWidth=2, LineStyle="-.", Label='$-\frac{1}{fs}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='left', FontSize=24, Interpreter='latex');

grid on;

exportgraphics(gcf, 'upsampler/upsampler_a.pdf', ContentType='vector')

%%%%%%%%%%%%
figure(WindowState="maximized");

plot(f, 10*log10(psd), LineWidth=2);

xlabel('Frecuencia $[MHz]$', FontSize=18, Interpreter="latex");
ylabel("PSD\{$x[n]$\} $[\frac{W}{MHz}]$", FontSize=18, Interpreter="latex");
title("PSD de la se\~{n}al de entrada", Interpreter="latex");

fontsize(gca, 18, "points");
set(gca,'TickLabelInterpreter','latex');

xline(f_sinc/2, LineWidth=2, LineStyle="-.", Label='$\frac{f_s}{2}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='right', FontSize=24, Interpreter='latex');

xline(-f_sinc/2, LineWidth=2, LineStyle="-.", Label='$-\frac{f_s}{2}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='left', FontSize=24, Interpreter='latex');

xline(max(f), LineWidth=2, LineStyle="-.", Label='$\frac{f_{PHY}}{2}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='left', FontSize=24, Interpreter='latex');

xline(min(f), LineWidth=2, LineStyle="-.", Label='$-\frac{f_{PHY}}{2}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='right', FontSize=24, Interpreter='latex');

xlim([-max(f), max(f)]);
grid on;

exportgraphics(gcf, 'upsampler/upsampler_b.pdf', ContentType='vector')

%% Signal upsampled with zeros
% The signal is constructed with "L-1" zeros between samples
% According to the properties of the DFT:
% x[n/L] -> X(L*Omega)
% Which means that the frequency spectrum is going to be compressed by a
% factor of "L", and we should see "L/2" extra repetitions of the spectrum.
xUp = upsample(x, L);
[psd, f] = pwelch(xUp, rectwin(length(xUp)), [], N, f_DAC, "centered");

%%%%%%%%%%%%%%%%%
figure(WindowState="maximized");

stem(ts, xUp, LineWidth=2, Marker="o", MarkerFaceColor="auto");
xlabel("Tiempo $[\mu s]$", FontSize=18, Interpreter="latex");
ylabel('$x[n/L]$', FontSize=18, Interpreter="latex");
title('Se\~{n}al sobremuestreada con $L = 4$', Interpreter="latex");

fontsize(gca, 18, "points");
set(gca,'TickLabelInterpreter','latex');

xline(1/f_sinc, LineWidth=2, LineStyle="-.", Label='$\frac{1}{f_s}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='right', FontSize=24, Interpreter='latex');

xline(-1/f_sinc, LineWidth=2, LineStyle="-.", Label='$-\frac{1}{f_s}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='left', FontSize=24, Interpreter='latex');

grid on;

exportgraphics(gcf, 'upsampler/upsampler_c.pdf', ContentType='vector');

%%%%%%%%%%%%%%%
figure(WindowState="maximized");

plot(f, 10*log10(psd), LineWidth=2);
xlabel('Frecuencia $[MHz]$', FontSize=18, Interpreter="latex");
ylabel('PSD\{$x[n/L]$\}  $[\frac{W}{MHz}]$', FontSize=18, Interpreter="latex");
title("PSD de la se\~{n}al sobremuestreada", Interpreter="latex");

fontsize(gca, 18, "points");
set(gca,'TickLabelInterpreter','latex');

xline(f_sinc/2, LineWidth=2, LineStyle="-.", Label='$\frac{f_s}{2}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='right', FontSize=24, Interpreter='latex');

xline(-f_sinc/2, LineWidth=2, LineStyle="-.", Label='$-\frac{f_s}{2}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='left', FontSize=24, Interpreter='latex');


xline(f_phy/2, LineWidth=2, LineStyle="-.", Label='$\frac{f_{PHY}}{2}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='right', FontSize=24, Interpreter='latex');

xline(-f_phy/2, LineWidth=2, LineStyle="-.", Label='$-\frac{f_{PHY}}{2}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='left', FontSize=24, Interpreter='latex');

xline(max(f), LineWidth=1, LineStyle="-.", Label='$\frac{f_{DAC}}{2}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='left', FontSize=24, Interpreter='latex');

xline(min(f), LineWidth=1, LineStyle="-.", Label='$-\frac{f_{DAC}}{2}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='right', FontSize=24, Interpreter='latex');

xlim([-max(f), max(f)])
grid on;

exportgraphics(gcf, 'upsampler/upsampler_d.pdf', ContentType='vector')

%% Signal interpolated
% When applied a FIR lowpass filter, only the compressed spectrum remains.
xIn = resample(x, L, 1);
[psd, f] = pwelch(xIn, rectwin(length(xIn)), [], N, f_DAC, "centered");

%%%%%%%%%%%%%%%%%%%%%%%%
figure(WindowState="maximized");
stem(ts, xIn, LineWidth=2, Marker="o", MarkerFaceColor="auto");
xlabel('Tiempo $[\mu s]$', FontSize=18, Interpreter="latex");
ylabel("$y[n]$", FontSize=18, Interpreter="latex");
title("Se\~{n}al interpolada", Interpreter="latex");

fontsize(gca, 18, "points");
set(gca,'TickLabelInterpreter','latex');

xline(1/f_sinc, LineWidth=2, LineStyle="-.", Label='$\frac{1}{f_s}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='right', FontSize=24, Interpreter='latex');

xline(-1/f_sinc, LineWidth=2, LineStyle="-.", Label='$-\frac{1}{f_s}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='left', FontSize=24, Interpreter='latex');

grid on;

exportgraphics(gcf, 'upsampler/upsampler_e.pdf', ContentType='vector')

%%%%%%%%%%%%%%%%%%%%%%%%
figure(WindowState="maximized");

plot(f, 10*log10(psd), LineWidth=2);
xlabel('Frecuencia $[MHz]$', FontSize=18, Interpreter="latex");
ylabel('PSD\{$y[n]$\}  $[\frac{W}{MHz}]$', FontSize=18, Interpreter="latex");
title("PSD de la se\~{n}al interpolada", Interpreter="latex");

fontsize(gca, 18, "points");
set(gca,'TickLabelInterpreter','latex');

xline(f_sinc/2, LineWidth=2, LineStyle="-.", Label='$\frac{f_s}{2}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='right', FontSize=24, Interpreter='latex');

xline(-f_sinc/2, LineWidth=2, LineStyle="-.", Label='$-\frac{f_s}{2}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='left', FontSize=24, Interpreter='latex');

xline(f_phy/2, LineWidth=2, LineStyle="-.", Label='$\frac{f_{PHY}}{2}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='right', FontSize=24, Interpreter='latex');

xline(-f_phy/2, LineWidth=2, LineStyle="-.", Label='$-\frac{f_{PHY}}{2}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='left', FontSize=24, Interpreter='latex');

xline(max(f), LineWidth=1, LineStyle="-.", Label='$\frac{f_{DAC}}{2}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='left', FontSize=24, Interpreter='latex');

xline(min(f), LineWidth=1, LineStyle="-.", Label='$-\frac{f_{DAC}}{2}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='right', FontSize=24, Interpreter='latex');

xlim([-max(f), max(f)])
grid on;

exportgraphics(gcf, 'upsampler/upsampler_f.pdf', ContentType='vector')

close all;

