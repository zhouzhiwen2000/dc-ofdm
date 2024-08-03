%% UNUSED
function [peaks, s] = peakDetection(dataIn, k, threshold)
%PEAKDETECTION Detect a local peak.
%   Detects a local peak within a "2*K" sample window. Value is considered
%   a peak only if "s(i) > threshold"
arguments(Input)
    dataIn (:,1) double
    k double
    threshold double
end
arguments(Output)
    peaks (:,1) double
    s (:, 1) double
end
    s = zeros(length(dataIn), 1);
    for i=1+k:1:length(dataIn)-k
        s(i) = ( min(dataIn(i-k:i-1)) + min(dataIn(i+1:i+k)) ) /2;
        %s(i) = dataIn(i) - (sum(dataIn(i-k:i-1)) + sum(dataIn(i+1:i+k)))/(2*k);
    end
    peaks = [];
    numPeaks = 0;
    for i=1:1:length(s)
        if s(i) > threshold
            peaks(numPeaks + 1) = i;
            numPeaks = numPeaks + 1;
        end
    end
    
    i = 1;
    while i < numPeaks
        if (peaks(i+1) - peaks(i) <= k)
            if (dataIn(peaks(i)) > dataIn(peaks(i+1)))
                peaks(i+1) = [];
            else
                peaks(i) = [];
            end
            numPeaks = numPeaks - 1;
        else
            i = i + 1;
        end
    end
end

