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
CreateRadarTrackingTasks;
CreateJammingTasks;

%% Create Array of Tasks
switch simulationCase
    case 1
        taskArray = {radarScanTask; commsTransmitTask; commsReceiveTask; ewSensingTask; ...
            idleTask};
    case 2
        taskArray = {radarScanTask; commsTransmitTask; commsReceiveTask; ewSensingTask; ...
            radarTrackTask1;radarTrackTask2;radarTrackTask3;radarTrackTask4; ...
            idleTask};
    case 3
        taskArray = {radarScanTask; commsTransmitTask; commsReceiveTask; ewSensingTask; ...
            radarTrackTask1;radarTrackTask2; ...
            ewJammingTask1;ewJammingTask2; ...
            idleTask};
    case 4
        taskArray = {radarScanTask; commsTransmitTask; commsReceiveTask; ewSensingTask; ...
            radarTrackTask1;radarTrackTask2;radarTrackTask3;radarTrackTask4; ...
            ewJammingTask1; ...
            idleTask};
    case 5
        taskArray = {radarScanTask; commsTransmitTask; commsReceiveTask; ewSensingTask; ...
            radarTrackTask1;remoteRadarTrackTask1; ...
            ewJammingTask1;remoteEwJammingTask1; ...
            idleTask};
end;

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