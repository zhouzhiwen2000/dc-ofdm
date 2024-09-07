function dataOut = txInterpolator(dataIn)
%INTERPOLATOR Interpolate signal.
    constants;
    
    dataIn = [dataIn; zeros(txInterpolatorDelay, 1)];
    dataOut = txInterpolatorFilter(dataIn);
    
    % Remove delay from FIR filter
    dataOut(1:txInterpolatorDelay) = [];
    dataOut(end-txInterpolatorDelay*(txL-1)+1:end) = [];
end

