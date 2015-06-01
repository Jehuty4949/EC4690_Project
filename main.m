%% clear the workspace and whiteboard
clear
close all
clc

%==========================
% Created by Low Cheng Hong
% EC4690/4680 Project
% Overall Simulations
%==========================

numberOfRadarTracks = 4;
numberOfJamming = 1;
totalNumberOfTasks = 5 + numberOfRadarTracks + numberOfJamming;

overallOccurrencePercentage = zeros(totalNumberOfTasks,NamedConst.NUMBER_SIMULATION_LOOP);
overallDelay = zeros(totalNumberOfTasks,NamedConst.NUMBER_SIMULATION_LOOP);
overallNumberLostLock = zeros(1,NamedConst.NUMBER_SIMULATION_LOOP);

tic;
for simulationIndex = 1:NamedConst.NUMBER_SIMULATION_LOOP
   OneSimulationLoop; 
   overallOccurrencePercentage(:,simulationIndex) = ...
       actualNumberOfOccurrences ./ idealNumberOfOccurrences;
   overallDelay(:,simulationIndex) = ...
       averageDelay;
   overallNumberLostLock(1,simulationIndex) = numberLostLock;
end
toc;

averageOverallOccurrencePercentage = mean(overallOccurrencePercentage,2);
averageOverallDelay = mean(overallDelay,2);
averageOverallNumberLostLock = mean(overallNumberLostLock,2);
