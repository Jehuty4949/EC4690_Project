%==========================
% Created by Low Cheng Hong
% EC4690/4680 Project
% Scheduler Simulations
%==========================

%% initialize list of tasks
% Note that the start time of all periodic tasks should be smaller than 
% (NamedConst.CYCLE_FREQUENCY / TASK_FREQUENCY) to ensure that the first
% loop of NamedConst.CYCLE_FREQUENCY will have enough occurrences of the 
% respective periodic task

CreateBaselineTasks;

% Radar Tracking Tasks
% TODO: randomize the start time
radarTrackTask1 = TaskSpace.RadarTrackingTask( ...
    NamedConst.RADAR_TRACK_CYCLE_TIME,NamedConst.MEDIUM_PRIORITY,...
    randi([1 NamedConst.RADAR_TRACK_CYCLE_TIME]));

radarTrackTask2 = TaskSpace.RadarTrackingTask( ...
    NamedConst.RADAR_TRACK_CYCLE_TIME,NamedConst.MEDIUM_PRIORITY,...
    randi([1 NamedConst.RADAR_TRACK_CYCLE_TIME]));

radarTrackTask3 = TaskSpace.RadarTrackingTask( ...
    NamedConst.RADAR_TRACK_CYCLE_TIME,NamedConst.MEDIUM_PRIORITY,...
    randi([1 NamedConst.RADAR_TRACK_CYCLE_TIME]));

radarTrackTask4 = TaskSpace.RadarTrackingTask( ...
    NamedConst.RADAR_TRACK_CYCLE_TIME,NamedConst.MEDIUM_PRIORITY,...
    randi([1 NamedConst.RADAR_TRACK_CYCLE_TIME]));

radarTrackTask5 = TaskSpace.RadarTrackingTask( ...
    NamedConst.RADAR_TRACK_CYCLE_TIME,NamedConst.MEDIUM_PRIORITY,...
    randi([1 NamedConst.RADAR_TRACK_CYCLE_TIME]));

radarTrackTask6 = TaskSpace.RadarTrackingTask( ...
    NamedConst.RADAR_TRACK_CYCLE_TIME,NamedConst.MEDIUM_PRIORITY,...
    randi([1 NamedConst.RADAR_TRACK_CYCLE_TIME]));

%% Create Array of Tasks
taskArray = {radarScanTask; commsTransmitTask; commsReceiveTask; ewSensingTask; ...
    radarTrackTask1; radarTrackTask2; radarTrackTask3; radarTrackTask4; ...
    idleTask};

numberOfTasks = size(taskArray,1);

%% SIMULATION LOOP
currentCycle = 0;
while currentCycle < NamedConst.MAXIMUM_NUMBER_OF_CYCLES_PER_SIMULATION_LOOP
    currentCycle = currentCycle + 1;
    taskIndexAllocated = 0;
    taskToBeExecuted = 0;
    
    % decide on the next task to execute in the current cycle
    for taskIndex = 1:numberOfTasks
        if taskArray{taskIndex}.ToBeExecuted(currentCycle) == NamedConst.TRUE
            if taskIndexAllocated == 0
                AllocateTask;
            elseif taskArray{taskIndex}.priority > taskToBeExecuted.priority
                AllocateTask;
            elseif taskArray{taskIndex}.priority == taskToBeExecuted.priority
                if taskArray{taskIndex}.GetCurrentDelay(currentCycle) ...
                        > taskToBeExecuted.GetCurrentDelay(currentCycle)
                    AllocateTask;
                end
            end
        end
    end
    
    taskArray{taskIndexAllocated} = taskToBeExecuted.ExecuteTask(currentCycle);
end;

%% Tabulate and Show Results
TabulateResults;