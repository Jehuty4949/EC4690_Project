classdef NamedConst
    % Defines constants used in Scheduler Simulation
    
    properties (Constant)
        % Boolean Constants
        TRUE    = 1;
        FALSE   = 0;
        
        % Cycle related constants
        NUMBER_SIMULATION_LOOP = 2;
        CYCLE_FREQUENCY = 40;   % cycle period of 1/40 = 25 ms
        MAXIMUM_NUMBER_OF_CYCLES_PER_SIMULATION_LOOP = ...
            10 * NamedConst.CYCLE_FREQUENCY;
        CYCLE_PERIOD_IN_SECONDS = 1 / NamedConst.CYCLE_FREQUENCY;
        
        % Idle Task Constants
        IDLE_CYCLE_TIME = 1;
        
        % Radar Scanning Task Constants
        RADAR_SCAN_FREQUENCY = 20;
        RADAR_SCAN_CYCLE_TIME = ...
            round(NamedConst.CYCLE_FREQUENCY / NamedConst.RADAR_SCAN_FREQUENCY);
        
        % Radar Tracking Task Constants
        RADAR_TRACK_FREQUENCY = 4;
        RADAR_TRACK_CYCLE_TIME = ...
            round(NamedConst.CYCLE_FREQUENCY / NamedConst.RADAR_TRACK_FREQUENCY);
        
        % LPI Comms Tasks Constants
        COMMS_FREQUENCY = 2;
        COMMS_CYCLE_TIME = ...
            round(NamedConst.CYCLE_FREQUENCY / NamedConst.COMMS_FREQUENCY);
        
        % EW Sensing Constants
        EW_SENSING_FREQUENCY = 2;
        EW_SENSING_CYCLE_TIME = ...
            round(NamedConst.CYCLE_FREQUENCY / NamedConst.EW_SENSING_FREQUENCY);
        
        % EW Jamming Constants
        EW_JAMMING_FREQUENCY = 15;
        EW_JAMMING_CYCLE_TIME = ...
            round(NamedConst.CYCLE_FREQUENCY / NamedConst.EW_JAMMING_FREQUENCY);
        
        % PRIORITY Constants
        NO_PRIORITY = 0;
        LOWEST_PRIORITY = 1;
        LOW_PRIORITY = 2;
        MEDIUM_PRIORITY = 3;
        HIGH_PRIORITY = 4;
        HIGHEST_PRIORITY = 5;
        
    end
    
end