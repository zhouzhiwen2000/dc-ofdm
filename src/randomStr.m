function randString = randomStr(sLength)
%RANDOMSTR Generate a random string of length "len"
    s = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

    %find number of random characters to choose from
    numRands = length(s); 
    
    %generate random string
    randString = s( ceil(rand(1,sLength)*numRands) );
end

