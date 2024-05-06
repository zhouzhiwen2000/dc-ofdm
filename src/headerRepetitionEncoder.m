function [headerRep] = headerRepetitionEncoder(header, bitsOFDMSymbol)
%HEADERREPETITIONENCODER Repeat header bits to fill the maximum possible
% amount of bits in an OFDM symbol.
% Args:
%   - header = Header bits to be copied.
%   - bitsOFDMSymbol = Amount of bits in an OFDM symbol. It should be equal
%   to "Nsc * M", where "Nsc" is the number of active subcarriers, and "M"
%   is the QAM modulation order.
% Output:
%   - headerRep = Header with repetition.
arguments(Input)
    header (336,1) logical
    bitsOFDMSymbol double
end
arguments(Output)
    headerRep (:,1) logical
end
    % Length of the header after FEC encoding.
    Nfec = 336;

    % Amount of times that the header should be repeated.
    M = ceil(bitsOFDMSymbol/Nfec);
    headerRep = false(M*Nfec, 1);

    for i=1:1:M
        headerRep((i-1)*Nfec + 1:i*Nfec) = circshift(header, -2*(i-1), 1);
    end

    headerRep = headerRep(1:bitsOFDMSymbol);
end
