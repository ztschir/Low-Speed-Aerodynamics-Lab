function flowAttachment()
Re1 = getVtrueAndReManoLab1(0.48);
Re2 = getVtrueAndReManoLab1(0.84);
Re3 = getVtrueAndReManoLab1(1.38);

AoADeattach = [17.2,18.3,19.5];
AoAReattach = [13.9,15.3,16.0];

Re = [Re1, Re2, Re3];

figure('Name', 'Flow Separation');
plot(Re, AoADeattach,'-o', Re, AoAReattach, '-s');
legend('Flow Separation', 'Flow Reattachment', 'Location', 'SouthEast');
xlabel('Reynolds number');
ylabel('Angle of Attack (deg)');
title('Flow Separation and Reattachment');

