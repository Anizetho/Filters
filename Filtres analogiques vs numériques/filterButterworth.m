clear;
clc;

fc = 4000;               % fréquence de coupure
fs = 100000;             % fréquence d'échantillonnage 
order = 2;               % Order filter
fcNorm = fc/(fs/2);      % fréquence de coupure normalisée
fcNorm10 = 10*fcNorm;
type = "low";

% Filtre analogique (base)
figure(1)
title("Filtre analogique")
[b,a] = butter(order,fcNorm);
[h,w] = freqz(b,a);
freqz(b,a);
hold on;


% Filtre numérique (FIR)
orderFIR = 20;
FIR1 = fir1(orderFIR,fcNorm, type, hamming(orderFIR+1));
freqz(FIR1,1,100);
hold on;



% Filtre numérique (IIR)
orderIIR = 10;
ripple = 3;
[b2,a2] = cheby1(orderIIR,ripple,fcNorm);
[h2,w2] = freqz(b2,a2);
freqz(b2,a2);
hold on;




lines = findall(gcf, 'type', 'line');
set(lines(1),'color', 'magenta');
set(lines(2),'color', 'green');
set(lines(3),'color', 'blue');
%legend([lines(1) ], 'Butterworth')
legend([lines(1) lines(2) lines(3)], 'IIR', 'Butterworth', 'FIR')

fcNormVert = fcNorm*ones(5);
fcNormVertPoints = [20 ; -20 ; -60 ; -80 ; -200];
fcNormVert10 = fcNorm10*ones(5);
plot(fcNormVert,fcNormVertPoints,'r:','HandleVisibility', 'off')
hold on;
plot(fcNormVert10,fcNormVertPoints, 'r:', 'HandleVisibility', 'off')
hold on;
horizontal3dB = -3*ones(1,6);
xd = linspace(0,1,6);
A = find(w>0.8*pi);
B = mag2db(abs(h(A(1))));
horizontaldB10 = B*ones(1,6);
plot(xd,horizontal3dB, 'r:', 'HandleVisibility', 'off')
hold on;
plot(xd,horizontaldB10, 'r:','HandleVisibility', 'off')
hold on;
texte1 = ["Fréquence normalisée (pi*rad/s) : ", fcNorm];
texte2 = ["Fréquence filtre analogique : ", fs];
disp(texte1);
disp(texte2);