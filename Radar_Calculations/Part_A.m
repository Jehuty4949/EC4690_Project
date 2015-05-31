%==========================
% Created by Low Cheng Hong
% EC4690/4680 Quiz 1
% Part A
%==========================

sensitivity = -110:-50; % dBm

transmitAntennaGain = 35;        % antenna gain in dB
receiveAntennaGain = 35;        % antenna gain in dB

L2 = 0.967;       % two way loss
L2_db = DbConvert(L2);  

targetCrossSection = 3.0;    % target cross section in sqm
targetCrossSection_db = DbConvert(targetCrossSection);

% calculate the effective range based on above input parameters
range_m_tgt_3 = RadarRangeEqn( ...
    transmitPowerDb, transmitAntennaGain, ...
    receiveAntennaGain, wavelength_m_power_2_db, ...
    targetCrossSection_db, ...
    sensitivity, L2_db);

targetCrossSection = 5.0;    % target cross section in sqm
targetCrossSection_db = DbConvert(targetCrossSection);

% calculate the effective range based on above input parameters
range_m_tgt_5 = RadarRangeEqn( ...
    transmitPowerDb, transmitAntennaGain, ...
    receiveAntennaGain, wavelength_m_power_2_db, ...
    targetCrossSection_db, ...
    sensitivity, L2_db);

targetCrossSection = 10.0;    % target cross section in sqm
targetCrossSection_db = DbConvert(targetCrossSection);

% calculate the effective range based on above input parameters
range_m_tgt_10 = RadarRangeEqn( ...
    transmitPowerDb, transmitAntennaGain, ...
    receiveAntennaGain, wavelength_m_power_2_db, ...
    targetCrossSection_db, ...
    sensitivity, L2_db);

figure;
hold on;
plot(sensitivity,range_m_tgt_3, ...
    sensitivity,range_m_tgt_5, ...
    sensitivity,range_m_tgt_10);
line([-98 -98], [0 10000], 'Color',[0.1 1 0.1]);
legend('Target of 3 m^2','Target of 5 m^2','Target of 10 m^2', ...
    'Receiver Sensitivity of Radar');
title('Radar Maximum Detection Range (Main Beam) vs Radar Sensitivity');
hold off;


