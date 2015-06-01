classdef RadarTrackingTask < TaskSpace.Task
    %{
        This is an Radar Tracking specialization of Task Class
    %}
    
    properties (SetAccess = private, GetAccess = public)
        confirmLock;
        lostLock;
        confirmationHits;
        numberConfirmationTries;
    end
    
    properties (SetAccess = public, GetAccess = public)
    end
    
    properties (Constant)
        MAX_NUMBER_OF_CONFIRM_TRIES = 5;
        NUMBER_OF_HITS_TO_CONFIRM = 3;
        HIT_PROBABILITY = 0.8;
    end
    
    methods
        % Ctor
        function object = RadarTrackingTask(cycleTime,priority,startTime)
            object@TaskSpace.Task(cycleTime,priority,startTime);
            object.lostLock = NamedConst.FALSE;
            object.confirmLock = NamedConst.FALSE;
            object.numberConfirmationTries = 0;
            object.confirmationHits = 0;
        end
        
        % Function to execute the task
        function object = ExecuteTask(object,currentCycleTime)
            %disp('This is radar tracking Task');   % for debugging
            
            % if delay by too much, will lost lock of target
            if (currentCycleTime - object.startTime) > object.cycleTime
                object.lostLock = NamedConst.TRUE;
            else
                % if not confirm lock, try to lock
                if object.confirmLock == NamedConst.FALSE
                    if MonteCarlo(object.HIT_PROBABILITY)
                        object.confirmationHits = object.confirmationHits + 1;
                        if object.confirmationHits >= object.NUMBER_OF_HITS_TO_CONFIRM
                            object.confirmLock = NamedConst.TRUE;
                        end
                    end
                    object.numberConfirmationTries = ...
                        object.numberConfirmationTries + 1;
                    
                    if (object.numberConfirmationTries == object.MAX_NUMBER_OF_CONFIRM_TRIES) ...
                            && object.confirmLock == (NamedConst.FALSE)
                        object.lostLock = NamedConst.TRUE;
                    end
                end
            end
            
            % execute the base class ExecuteTask
            object = ExecuteTask@TaskSpace.Task(object,currentCycleTime);
            
        end
        
        % Function to check if task needs to be executed
        function output = ToBeExecuted(object,currentCycleTime)
            if object.lostLock == NamedConst.TRUE
                output = NamedConst.FALSE;
            else
                output = ToBeExecuted@TaskSpace.Task(object,currentCycleTime);
            end
        end
    end
    
end

