function payloadOFDMSymbols = toneMapping(CONST, payload, bitsPerSubcarrier)
%TONEMAPPING Given the payload and the modulation order, this function
%separates the payload in OFDM symbols, and fills the last OFDM symbol with
%the LFSR pattern.

arguments(Input)
    CONST
    payload(:,1) logical
    bitsPerSubcarrier double
end
arguments(Output)
    payloadOFDMSymbols (:,:) logical
end
    bitsPerOFDMSymbol = CONST.numDataCarriers * bitsPerSubcarrier;
    totalOFDMSymbols = ceil(length(payload)/bitsPerOFDMSymbol);

    bitsEmpty = bitsPerOFDMSymbol *  totalOFDMSymbols - length(payload);

    % Fill payload with extra zeros (ignore LFSR for now)
    % TODO replace "false" with LFSR output
    payload = [payload; false(bitsEmpty, 1)];

    payloadOFDMSymbols = reshape(payload, bitsPerOFDMSymbol, totalOFDMSymbols);
end

