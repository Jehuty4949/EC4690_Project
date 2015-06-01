classdef JammingTask < TaskSpace.Task
    %{
        This is an Jamming specialization of Task Class
    %}
    
    properties (SetAccess = private, GetAccess = public)
        numberJammingCyclesExecuted;
    end
    
    properties (SetAccess = public, GetAccess = public)
    end
    
    properties (Constant)
        
    end
    
    methods
        % Ctor
        function object = JammingTask(cycleTime,priority,startTime,numberJammingCyclesRequired)
            object@TaskSpace.Task(cycleTime,priority,startTime);
            object.idealNumberOfOccurrences = numberJammingCyclesRequired;
            object.numberJammingCyclesExecuted = 0;
        end
        
        % Function to execute the task
        function object = ExecuteTask(object,currentCycleTime)
            %disp('This is jamming Task');   % for debugging
            object.numberJammingCyclesExecuted = ...
                object.numberJammingCyclesExecuted + 1;
            object = ExecuteTask@TaskSpace.Task(object,currentCycleTime);
        end
        
        
        % Function to check if task needs to be executed
        function output = ToBeExecuted(object,currentCycleTime)
            % jamming task stops once technique has finished executing
            if object.numberJammingCyclesExecuted == ...
                    object.idealNumberOfOccurrences
                output = NamedConst.FALSE;
            else
                output = ToBeExecuted@TaskSpace.Task(object,currentCycleTime);
            end
        end
    end
    
end

