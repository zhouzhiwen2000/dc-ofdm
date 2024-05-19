function blkStruct = slblocks
% This function specifies that the library 'mylib'
% should appear in the Library Browser with the 
% name 'My Library'

    Browser.Library = 'HDL_ieee_8021513';
    % 'mylib' is the name of the library

    Browser.Name = 'HDL IEEE 8021513';
    % 'My Library' is the library name that appears
    % in the Library Browser

    blkStruct.Browser = Browser;