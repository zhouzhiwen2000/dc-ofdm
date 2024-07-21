function [peaks] = peakDetection(dataIn, k, threshold)
%PEAKDETECTION Detect a local peak.
%   Detects a local peak within a "2*K" sample window. Value is considered
%   a peak only if "s1(i) > threshold"
arguments(Input)
    dataIn (:,1) double
    k double
    threshold double
end
arguments(Output)
    peaks (:,1) double
end
    s1 = zeros(length(dataIn), 1);
    %s2 = zeros(length(dataIn), 1);
    for i=1+k:1:length(dataIn)-k
        s1(i) = ( min(dataIn(i-k:i-1)) + min(dataIn(i+1:i+k)) ) /2;
        %s2(i) = dataIn(i) - (sum(dataIn(i-k:i-1)) + sum(dataIn(i+1:i+k)))/(2*k);
    end

    indexes = find(s1 > threshold);

    newIndexes = 1;
    newIndexesLen = 1;
    for i=1:1:length(indexes)-1
        if (indexes(i+1) - indexes(i) <= k)
            if (dataIn(indexes(i)) > dataIn(newIndexes(newIndexesLen)))
                newIndexes(newIndexesLen) = indexes(i);
            end
        else
            newIndexesLen = newIndexesLen + 1;
            newIndexes(newIndexesLen) = indexes(i);
        end
    end
    peaks = newIndexes;
end

