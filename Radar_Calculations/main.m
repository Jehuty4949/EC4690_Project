%% clear the workspace and whiteboard
clear
close all
clc

%==========================
% Created by Low Cheng Hong
% EC4690/4680 Project
% LPI Radar Calculations
%==========================

% constants
lightSpeed = 3e8;   % m/s
sensitivityRadar = -98; % dBm

% Input parameters
transmitPower = 6800;            % transmit power in mWatts
transmitPowerDb = DbConvert(transmitPower);  % dBm

carrierFrequency = 8e9;            % Carrier Frequency in Hz
wavelength_m = lightSpeed / carrierFrequency;  % wave length in m
wavelength_m_power_2_db = DbConvert(wavelength_m ^ 2);

Part_A;
