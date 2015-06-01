classdef Task
    %{
    This is a Generic type of Task Class.
    If not required, can use this class to represent
    a type of Task.
    
    However, it is recommended to derive a subclass
    from this base class. Nevertheless, to give future users
    flexibility for simplicity, the base class has
    been made non-abstract.
    %}
    
    properties (SetAccess = protected, GetAccess = public)
        cycleTime;
        priority;
        startTime;
        delayFromDesiredStartTime;
        numberOfOccurrences;
        idealNumberOfOccurrences;
        accumulatedDelay;
    end
    
    properties (SetAccess = public, GetAccess = public)
    end
    
    properties (Constant)
        
    end
    
    methods
        % Constructor
        function object = Task(cycleTime,priority,startTime)
            object.cycleTime = cycleTime;
            object.priority = priority;
            object.startTime = startTime;
            object.numberOfOccurrences = 0;
            object.accumulatedDelay = 0;
            object.idealNumberOfOccurrences = ...
                ceil((NamedConst.MAXIMUM_NUMBER_OF_CYCLES_PER_SIMULATION_LOOP - ...
                object.startTime) / object.cycleTime);
        end
        
        % Function to execute the task
        function object = ExecuteTask(object,currentCycleTime)
            % disp('This is base Task');    % for debugging
            object.delayFromDesiredStartTime = ...
                currentCycleTime - object.startTime;
            object.numberOfOccurrences = object.numberOfOccurrences + 1;
            object.accumulatedDelay = object.accumulatedDelay + ...
                object.delayFromDesiredStartTime;
        
            % calculate the next desired start time, 
            % whenever the task is executed
            object.startTime = object.startTime + object.cycleTime;
        end
        
        % Function to get the current delay of task
        function delay = GetCurrentDelay(object,currentCycleTime)
            delay = currentCycleTime - object.startTime;
        end
        
        % Function to check if task needs to be executed
        function output = ToBeExecuted(object,currentCycleTime)
            if (currentCycleTime - object.startTime) >= 0
                output = NamedConst.TRUE;
            else
                output = NamedConst.FALSE;
            end
        end
        
        % Function to get the average delay of task
        function averageDelay = GetAverageDelay(object)
            averageDelay = ...
                object.accumulatedDelay / object.numberOfOccurrences;
        end
    end
end
