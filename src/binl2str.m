function [str] = binl2str(bin)
%BINL2STR Convert a binary list to a string. The "string" is, in fact a
% character array, defined with single quoutes '', (not double quotes).
arguments(Input)
    bin (:,1) logical
end
arguments(Output)
    str (1,:) char
end
    str = reshape(bin, 8, []);
    str = uint8(str) + '0';
    str = char(str');
    str = bin2dec(str);
    str = char(str)';
end

