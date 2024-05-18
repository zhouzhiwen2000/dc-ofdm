%% QAM Constellations
% TODO: values should be LSB first.
% Odd constellations

function IQ = qamMap(bin)
%QAMMAP Obtain the constellation point for a binary number. 
% These constellations are defined according to the IEEE802.15.13 standard.
% Args:
%   bin = Binary number. Numbers are interpreted as MSB first.
% Output:
%   IQ = Complex constellation point I + iQ.
arguments(Input)
    bin (:,1) int8
end
arguments(Output)
    IQ double
end

    b = length(bin);
    M = 2^b;
    if (b == 1)
        qam1Bit = [0 1];
        qam1Bit = qam1Bit(:);
        IQ = qammod(bin, 2^b, qam1Bit, InputType="bit");

    elseif (b == 2)
        qam2Bits =  [2   3;
                     0   1];
        qam2Bits = qam2Bits(:);
        IQ = qammod(bin, 2^b, qam2Bits, InputType="bit");

    elseif(mod(b,2) == 0)
        % Even constellations
        sgnI = 2*bin(end) -1;
        sgnQ = 2*bin(b/2) -1;
    
        binx = [bin(1:b/2-1); bin(b/2+1:end-1)];
        valI = abs(real(qamMap(binx)) - 2^(b/2-1));
        valQ = abs(imag(qamMap(binx)) - 2^(b/2-1));
    
        IQ = double(sgnI*valI) + 1i*double(sgnQ*valQ);
    else
        % Odd constellations
        B1 = ceil(b/2);
        B2 = floor(b/2);
        MI = 2^B1;
        MQ = 2^B2;

        sgnI = 2*bin(end) -1;
        sgnQ = 2*bin(B1) -1;

        valI = abs(real(qamMap([0; bin]) ));
        valQ = abs(imag(qamMap([bin(1:end-1)] )));

        % TODO remapping odd constellations
        rowValue = ((sqrt(M/2)-1):-2:-(sqrt(M/2)-1));
        columnValue = (-(sqrt(M*2)-1):2:(sqrt(M*2)-1));

        s = (MI-MQ)/4;

        IQ = double(sgnI*valI) + 1i*double(sgnQ*valQ);
    end

end
