function dataOut = interpolator(dataIn)
%INTERPOLATOR Interpolate signal.
    constants;

    dataIn = [dataIn; zeros((interpolatorDelay+1)/2, 1)];
    dataOut = interpolatorFilter(dataIn);
    
    % Remove delay from FIR filter
    dataOut(1:interpolatorDelay) = [];
    dataOut(end) = [];
end

