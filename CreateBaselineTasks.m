% Radar Tasks
radarScanTask = TaskSpace.RadarScanningTask( ...
    NamedConst.RADAR_SCAN_CYCLE_TIME,NamedConst.LOWEST_PRIORITY,1);

% For Comms transmit and receive Task, arbitrarily set the start time 
% to 2 and 6 respectively
commsTransmitTask = TaskSpace.CommsTransmitTask( ...
    NamedConst.COMMS_CYCLE_TIME,NamedConst.HIGHEST_PRIORITY,2);

commsReceiveTask = TaskSpace.CommsReceiveTask( ...
    NamedConst.COMMS_CYCLE_TIME,NamedConst.HIGHEST_PRIORITY,6);

% For EW Sensing Task, arbitrarily set the start time to 4 respectively
ewSensingTask = TaskSpace.EwSensingTask( ...
    NamedConst.EW_SENSING_CYCLE_TIME,NamedConst.HIGHEST_PRIORITY,4);

% IDLE task is used as a filler for empty cycle slots 
% Not analyzed in this simulation
idleTask = TaskSpace.Task( ...
    NamedConst.IDLE_CYCLE_TIME,NamedConst.NO_PRIORITY,1);