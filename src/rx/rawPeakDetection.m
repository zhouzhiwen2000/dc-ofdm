function [peaks] = rawPeakDetection(dataIn, k, threshold)
%PEAKDETECTION Detect a local peak directly from the "dataIn" signal.
%   Detects a local peak within a "2*K" sample window. Value is considered
%   a peak only if "s(i) > threshold"
arguments(Input)
    dataIn (:,1) double
    k double
    threshold double
end
arguments(Output)
    peaks (:,1) double
end
    peaks = [];
    numPeaks = 0;
    for i=1:1:length(dataIn)
        if dataIn(i) > threshold
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

