function [ofdmSymbols] = preambleGenerate(nullIdx)
%%PREAMBLEGENERATE Generate the OFDM symbols for the preamble.
% Args:
%   - nullIdx = Subcarriers that are masked.
% Output:
%   - ofdmSybols = OFDM Symbols ready to be fed to the OFDM Modulator.
arguments(Input)
    nullIdx (:,1) double
end
arguments(Output)
    ofdmSymbols (:,:) logical
end
    N = 256;    % Total amount of subcarriers
    dataSubcarriers = N - length(nullIdx);

    ofdmSymbols = false(dataSubcarriers, 14);

    % First ten OFDM symbols are "1 bit" in the indices "4,8,12,...,N-4",
    % counting from index [0, N-1]
    % Example: [0 0 0 0 1 0 0 0 1 0 0 0 1 .... 0 0 0 1 0 0 0]
    firstSymbol = [0, true(1,N/4-1); zeros(3,N/4)]; 
    firstSymbol = firstSymbol(:);

    % Remove values in masked subcarriers
    firstSymbol(nullIdx) = [];

    % Repeat symbol ten times
    ofdmSymbols(:, 1:10) = repmat(firstSymbol, 1, 10);

    % Last four symbols are the previous symbol negated.
    ofdmSymbols(:, 11:14) = repmat(~firstSymbol, 1, 4);
end
