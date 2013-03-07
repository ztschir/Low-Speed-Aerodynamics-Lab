function [Re Vtrue] = getVtrueAndReManoLab1(manometerReadingInInches)


heightInFeet = manometerReadingInInches/12; %ft

gravity = 32.17; % ft/s^2
densityOfManometerLiquid = 1.936000; %slugs/ft^3  Need density of water for manometer reading.
densityOfAir = 0.002377; %slugs/ft^3
chordLength = 0.699; %ft
viscosity = 3.719e-7; %lb*s/ft^2

gagePressure = manometerReading(heightInFeet,gravity, densityOfManometerLiquid); %gagePres in psf (lb per square foot)
Vtrue = calculatedVelocity(gagePressure,densityOfAir); %ft/s
Re = reynoldsNumber(Vtrue,chordLength,densityOfAir,viscosity); %unitless
