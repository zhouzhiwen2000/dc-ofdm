function [headerRep] = headerRepetitionEncoder(CONST, header)
%HEADERREPETITIONENCODER Repeat header bits to fill the maximum possible
% amount of bits in an OFDM symbol.
% Args:
%   - header = Header bits to be copied.
% Output:
%   - headerRep = Header with repetition.
arguments(Input)
    CONST
    header (336,1) logical
end
arguments(Output)
    headerRep (:,1) logical
end
    % Amount of times that the header should be repeated.
    M = ceil(CONST.headerBitsPerOFDMSymbol/CONST.headerBitsPerFec);
    headerRep = false(M*CONST.headerBitsPerFec, 1);

    for i=1:1:M
        headerRep((i-1)*CONST.headerBitsPerFec + 1:i*CONST.headerBitsPerFec) = ...
            circshift(header, -2*(i-1), 1);
    end

    headerRep = headerRep(1:CONST.headerBitsPerOFDMSymbol);
end
