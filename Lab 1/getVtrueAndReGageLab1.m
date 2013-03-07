function [Re Vtrue] = getVtrueAndReGageLab1(gagePressure)

densityOfAir = 0.002377; %slugs/ft^3
chordLength = 0.699; %ft
viscosity = 3.719e-7; %lb*s/ft^2

Vtrue = calculatedVelocity(gagePressure,densityOfAir); %ft/s
Re = reynoldsNumber(Vtrue,chordLength,densityOfAir,viscosity); %unitless