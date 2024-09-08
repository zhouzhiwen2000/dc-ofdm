function [dataOut] = rxDecimator(dataIn)
%RXDECIMATOR Inverse operation to interpolation.
% TODO edge values. Maybe add windowing at the transmitter?
    constants;

    dataIn = [dataIn; zeros(rxDecimatorDelay+1, 1)];
    dataOut = rxDecimatorFilter(dataIn);
    
    % Remove delay from FIR filter
    dataOut(1:rxDecimatorDelay/2) = [];
    dataOut(end) = [];
end

