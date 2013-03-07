function [linearFitPoly] = hotWireCalibration()
[sample stagnationPressure, staticPressure, Voltage] = ...
    textread('Calibration.txt', '%d %f %f %f');
gagePressure = stagnationPressure - staticPressure;
densityOfAir = 1.225; %kg/m^3

for i = 1:size(sample)
    trueVelocity(i) = calculatedVelocity(gagePressure(i), densityOfAir);
    %[Re(i) trueVelocity(i)] = getVtrueAndReGageLab1(gagePressureInPSF(i));
end
Voltage
trueVelocity*3.2808399
figure('Name', 'Hot Wire Calibration');
linearFitPoly = polyfit(Voltage,trueVelocity', 1);
linearFitVal = polyval(linearFitPoly, Voltage);
%plot(trueVelocity,Voltage,'o', linearFitVal, Voltage);
plot(trueVelocity,Voltage,'o');
legend('Measured Data', 'Linear Fit', 'Location', 'SouthEast');
xlabel('Velocity (m/s)');
ylabel('Voltage (V)');
title('Hot Wire Calibration');