clear all; clc;
[p40 p50 p60 p70r1 p70r2 p80] = ...
    textread('PressureDistribution.csv', '%f %f %f %f %f %f','delimiter', ',');

freeStreamPres = [99219.37853 99219.70053 99218.87136 99219.3745 ...
    99219.48318 99218.43665]'; %Pa
radiusOfSphereAir = .216/2;
n = 0:10:350

coeffPres40 = (p40-freeStreamPres(1))/(p40(1) - freeStreamPres(1))
coeffPres50 = (p50-freeStreamPres(2))/(p50(1) - freeStreamPres(2))
coeffPres60 = (p60-freeStreamPres(3))/(p60(1) - freeStreamPres(3))
coeffPres70r1 = (p70r1-freeStreamPres(4))/(p70r1(1) - freeStreamPres(4))
coeffPres70r2 = (p70r2-freeStreamPres(5))/(p70r2(1) - freeStreamPres(5))
coeffPres80 = (p80-freeStreamPres(6))/(p80(1) - freeStreamPres(6))

theoryCoeffPres = 1-2.25*(sind(n).^2);

plot(n, coeffPres40, 'o', n, coeffPres80,'.', n, theoryCoeffPres);
xlabel('Position on Sphere (Deg)');
ylabel('Coefficient of Pressure');