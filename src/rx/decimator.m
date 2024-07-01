function [dataOut] = decimator(dataIn)
%DECIMATOR Inverse operation to interpolation.
% TODO edge values. Maybe add windowing at the transmitter?
    constants;

    dataIn = [dataIn; zeros(decimatorDelay+1, 1)];
    dataOut = decimatorFilter(dataIn);
    
    % Remove delay from FIR filter
    dataOut(1:decimatorDelay/2) = [];
    dataOut(end) = [];
end

