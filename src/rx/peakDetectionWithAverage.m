function [peaks, s] = peakDetectionWithAverage(dataIn, k, h)
%PEAKDETECTION Detect a local peak, using mean and standard deviation of
% as parameters
% Detects a local peak within a "2*K" sample window. Value is considered
% a peak only if "s1(i) - mean > h*std"
arguments(Input)
    dataIn (:,1) double
    k double
    h double    % Value between [1, 3], higher values means more strict peaks
end
arguments(Output)
    peaks (:,1) double
    s (:, 1) double
end
    % You can choose a method of peak detection here, uncomment the line
    % inside the for loop
    s = zeros(length(dataIn), 1);
    for i=1+k:1:length(dataIn)-k
        s(i) = ( min(dataIn(i-k:i-1)) + min(dataIn(i+1:i+k)) ) /2;
        %s(i) = dataIn(i) - (sum(dataIn(i-k:i-1)) + sum(dataIn(i+1:i+k)))/(2*k);
    end
    
    % Calculate mean an standard deviation
    meanVar = mean(s);
    stdVar = std(s);

    numPeaks = 0;
    for i=1:1:length(s)
        if((s(i) - meanVar) > h*stdVar)
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
