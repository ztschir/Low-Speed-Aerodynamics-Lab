function [linearFitPoly] = hotWireCalibration()
[sample stagnationPressure, staticPressure, Voltage] = ...
    textread('Calibration.txt', '%d %f %f %f');
gagePressure = stagnationPressure - staticPressure;

gagePressureInPSF = 0.02088545632547*gagePressure; %convertion to lb/ft^2

for i = 1:size(sample)
    [Re(i) trueVelocity(i)] = getVtrueAndReGageLab1(gagePressureInPSF(i));
end

linearFit = polyfit(trueVelocity', Voltage, 2);
linearFitVal = polyval(linearFit, trueVelocity);

figure('Name', 'Hot Wire Calibration');
plot(trueVelocity,Voltage,'o', trueVelocity, linearFitVal);
xlabel('Velocity (ft/s)');
ylabel('Voltage (V)');
title('Hot Wire Calibration');