function [calculatedV] = calculatedVelocity(gagePressure, density)

if(gagePressure >= 0)
    calculatedV = sqrt((2*gagePressure)/density);
else
    calculatedV = -1*sqrt((2*abs(gagePressure))/density);
end

