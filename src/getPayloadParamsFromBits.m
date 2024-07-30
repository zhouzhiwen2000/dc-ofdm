function [pBitsOut, payloadLenInFecBlocks, payloadLenInBits, ...
    payloadLenInWords, payloadExtraWords] = getPayloadParamsFromBits(pBitsIn)
%GETPAYLOADPARAMSFROMBITS Given the amount of bits to transmit, this
% functions returns all necessary parameters to make the transmission and
% reception.
% Besides, zeros are appended to the input bits, until the amount of bits
% is a multiple of the fecBlockSize.
arguments(Input)
    pBitsIn (:,1) logical
end
arguments(Output)
    pBitsOut (:, 1) logical
    payloadLenInFecBlocks double
    payloadLenInBits double
    payloadLenInWords double
    payloadExtraWords double
end
    constants;

    payloadLenInFecBlocks = ceil(length(pBitsIn)/payloadBitsPerBlock0);
    payloadLenInBits = payloadLenInFecBlocks*payloadBitsPerBlock0;
    payloadLenInWords = payloadLenInBits/axiWidth;
    payloadExtraBits = payloadLenInBits - length(pBitsIn);
    payloadExtraWords = ceil(payloadExtraBits/8);

    pBitsOut = [pBitsIn; false(payloadExtraBits, 1)];
end

