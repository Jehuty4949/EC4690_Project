%% dedicated script to tabulating results and displaying in useful format

idealNumberOfOccurrences = zeros(numberOfTasks,1);
actualNumberOfOccurrences = zeros(numberOfTasks,1);
averageDelay = zeros(numberOfTasks,1);

for taskIndex = 1:numberOfTasks
    idealNumberOfOccurrences(taskIndex) = ...
        taskArray{taskIndex}.idealNumberOfOccurrences;
    actualNumberOfOccurrences(taskIndex) = ...
        taskArray{taskIndex}.numberOfOccurrences;
    averageDelay(taskIndex) = ...
        taskArray{taskIndex}.GetAverageDelay * ...
        NamedConst.CYCLE_PERIOD_IN_SECONDS;
end

numberLostLock = 0;

for taskIndex = 5:(4 + numberOfRadarTracks)
    numberLostLock = numberLostLock + taskArray{taskIndex}.lostLock;
end

% keep the below code for later...
%{
figure;
comparisonOccurrences = ...
    [actualNumberOfOccurrences, idealNumberOfOccurrences];
bar(comparisonOccurrences);
legend('actual', 'ideal');

figure;
bar(averageDelay(1:(numberOfTasks - 1)));
%}
