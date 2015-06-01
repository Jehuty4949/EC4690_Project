% EW Jamming Tasks
% Assume each jamming technique is 5 seconds long

ewJammingTask1 = TaskSpace.JammingTask( ...
    NamedConst.EW_JAMMING_CYCLE_TIME,NamedConst.HIGH_PRIORITY,...
    randi([1 NamedConst.EW_JAMMING_CYCLE_TIME]), ...
    5 * NamedConst.EW_JAMMING_FREQUENCY);

ewJammingTask2 = TaskSpace.JammingTask( ...
    NamedConst.EW_JAMMING_CYCLE_TIME,NamedConst.HIGH_PRIORITY,...
    randi([1 NamedConst.EW_JAMMING_CYCLE_TIME]), ...
    5 * NamedConst.EW_JAMMING_FREQUENCY);

ewJammingTask3 = TaskSpace.JammingTask( ...
    NamedConst.EW_JAMMING_CYCLE_TIME,NamedConst.HIGH_PRIORITY,...
    randi([1 NamedConst.EW_JAMMING_CYCLE_TIME]), ...
    5 * NamedConst.EW_JAMMING_FREQUENCY);