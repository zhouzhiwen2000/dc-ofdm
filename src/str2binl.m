function [bin] = str2binl(str)
%STR2BINL Convert a string to a binary list. The "string" is, in fact a
% character array, defined with single quoutes '', (not double quotes).
arguments(Input)
    str (1,:) char
end
arguments(Output)
    bin (:,1) logical
end
    str = str(:);
    bin = logical(dec2bin(str, 8) - '0')';
    bin = bin(:);
end

