function [ output ] = MonteCarlo( probability_threshold )
    % give 1 or 0 output based on a random number generated uniformly
    % between 0 and 1

    X = rand;
    
    if X <= probability_threshold
        output = 1;
    else
        output = 0;
end