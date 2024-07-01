function [err, psduSizeRx, messageDurationRx, blockSizeRx, ...
    fecRateRx, repetitionNumberRx, fecConcatenationFactorRx, ...
    scramblerInitializationRx, batIdRx, cyclicPrefixIdRx, ...
    explicitMimoPilotSymbolCombSpacingRx, explicitMimoPilotSymbolNumberRx] = ...
    headerSeparate(header)
%HEADERSEPARATE Summary of this function goes here
%   Detailed explanation goes here
arguments(Input)
    header (168, 1) logical
end
arguments(Output)
    err logical
    psduSizeRx (1, 24) logical
    messageDurationRx (1, 16) logical
    blockSizeRx (1, 2) logical
    fecRateRx (1, 3) logical
    repetitionNumberRx (1, 3) logical
    fecConcatenationFactorRx (1, 3) logical
    scramblerInitializationRx (1, 4) logical
    batIdRx (1,5) logical
    cyclicPrefixIdRx (1, 3) logical
    explicitMimoPilotSymbolCombSpacingRx (1, 3) logical
    explicitMimoPilotSymbolNumberRx (1, 3) logical
end
    constants;
    % Check CRC
    [header, err] = crcDecode(headerCRCPoly, header);

    % Extract values
    psduSizeRx = flip(header(9:32));
    messageDurationRx = flip(header(33:48));
    blockSizeRx = flip(header(49:50));
    fecRateRx = flip(header(51:53));
    repetitionNumberRx = flip(header(54:56));
    fecConcatenationFactorRx = flip(header(57:59));
    scramblerInitializationRx = flip(header(60:63));
    batIdRx = flip(header(65:69));
    cyclicPrefixIdRx = flip(header(73:75));
    explicitMimoPilotSymbolCombSpacingRx = flip(header(76:78));
    explicitMimoPilotSymbolNumberRx = flip(header(107:109));
end

