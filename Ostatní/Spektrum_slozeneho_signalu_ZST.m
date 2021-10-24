frekvency = [0.7 1.48] ;
leveldBm = [-4.66 -2.84];

level = 10.^(leveldBm./10);
bar(frekvency,level,0.01,'k');
ylabel('Power [w]');
title('Frekvency [kHz]');
axis([0,1.8,0,0.7])
grid on;
hold;