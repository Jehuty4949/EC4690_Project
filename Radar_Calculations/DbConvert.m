function [ output ] = DbConvert( input )
    % convert input to dB based on 10 * log10

    output = 10 * log10(input);
end