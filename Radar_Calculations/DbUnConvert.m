function [ output ] = DbUnConvert( input )
    % convert input back from dB

    output = 10 .^ (input / 10);
end

