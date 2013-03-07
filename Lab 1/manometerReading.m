function [gagePres] = manometerReading(height, gravity, densityOfManometerLiquid)

gagePres = height*gravity*densityOfManometerLiquid;
