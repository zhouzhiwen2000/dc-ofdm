function [pBitsOut, payloadLenInFecBlocks, payloadLenInBits, ...
    payloadLenInWords, payloadExtraWords] = getPayloadParamsFromBits(CONST, pBitsIn)
%GETPAYLOADPARAMSFROMBITS Given the amount of bits to transmit, this
% functions returns all necessary parameters to make the transmission and
% reception.
% Besides, zeros are appended to the input bits, until the amount of bits
% is a multiple of the fecBlockSize.
arguments(Input)
    CONST
    pBitsIn (:,1) logical
end
arguments(Output)
    pBitsOut (:, 1) logical
    payloadLenInFecBlocks double
    payloadLenInBits double
    payloadLenInWords double
    payloadExtraWords double
end
    % Get how many fec blocks need to be transmitted
    payloadLenInFecBlocks = ceil(length(pBitsIn)/CONST.payloadBitsPerBlock0);

    % Adapt the message to fit in that amount of fec blocks.
    payloadLenInBits = payloadLenInFecBlocks*CONST.payloadBitsPerBlock0;
    payloadLenInWords = payloadLenInBits/CONST.axiWidth;

    % Get the amount of added bits and words
    payloadExtraBits = payloadLenInBits - length(pBitsIn);
    payloadExtraWords = ceil(payloadExtraBits/CONST.axiWidth);

    % Append the extra bits to the signal.
    pBitsOut = [pBitsIn; false(payloadExtraBits, 1)];
end

