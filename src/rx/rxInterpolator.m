function dataOut = rxInterpolator(dataIn)
%INTERPOLATOR Interpolate signal.
    constants;
    
    dataIn = [dataIn; zeros(rxInterpolatorDelay, 1)];
    dataOut = rxInterpolatorFilter(dataIn);
    
    % Remove delay from FIR filter
    dataOut(1:rxInterpolatorDelay) = [];
    dataOut(end-rxInterpolatorDelay*(rxL-1)+1:end) = [];
end

