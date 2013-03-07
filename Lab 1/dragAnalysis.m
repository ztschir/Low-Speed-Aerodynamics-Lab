function dragAnalysis()

chordLength = 21.7; %centimeters
densityOfAir = 1.225; %kg/m^3
viscosityOfAir = 1.78e-5; %kg/m*s
dX = 1.67; %cm
measuredStaticPressure = 99214.2183576; %Pa
measuredStagPressure = 99263.27216; %Pa
freeStreamVelocity = ...
    calculatedVelocity(measuredStagPressure-measuredStaticPressure, densityOfAir);
Re = ReynoldsNumber(freeStreamVelocity, chordLength*.01, densityOfAir, viscosityOfAir);
[portNumber pressureReadings distanceFromFront] = ...
    textread('PressureDistribution.txt', '%d %f %f');

len = length(portNumber')/2;
for i = 1:len
    topPres(i) = pressureReadings(i);
    topDist(i) = distanceFromFront(i);
    bottomPres(i) = pressureReadings(i + len);
    bottomDist(i) = distanceFromFront(i + len);
end

for i = 1:len
    coeffPresTop(i) = (topPres(i) - measuredStaticPressure)/...
        ((1/2)*densityOfAir*freeStreamVelocity^2);
    coeffPresBottom(i) = (bottomPres(i) - measuredStaticPressure)/...
        ((1/2)*densityOfAir*freeStreamVelocity^2);
end

figure('Name', 'Pressure coefficient distribution 11 degree Angle of Attack')
plot(topDist/chordLength, coeffPresTop,'-o', bottomDist/chordLength, coeffPresBottom,'-s');
set(gca,'YDir','reverse');
ylabel('Pressure Coefficient (Cp)');
xlabel('Normalized position on airfoil (x/c)');
title('Pressure coefficient distribution at an 11 degree Angle of Attack');
legend('Upper Surface', 'Lower Surface', 'Location', 'SouthEast');

estCoeffOfLift = ((cosd(11) * dX)/chordLength) * sum(coeffPresBottom - coeffPresTop)