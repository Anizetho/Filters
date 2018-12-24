clear;
clc;

fc = 9500;               % fréquence de coupure
fs = 20000;             % fréquence d'échantillonnage 
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
orderFIR = 100;
FIR1 = fir1(orderFIR,fcNorm, type, hamming(orderFIR+1));
freqz(FIR1,1,100);
hold on;
% FIR2 = fir1(orderFIR,fcNorm, type, rectwin(orderFIR+1));
% freqz(FIR2,1,100);
% hold on;




% Filtre numérique (IIR)
% [b2,a2] = cheby1(order,3,fcNorm);
% [h2,w2] = freqz(b2,a2);
% freqz(b2,a2);
% hold on;



lines = findall(gcf, 'type', 'line');
set(lines(1),'color', 'blue');
set(lines(2),'color', 'green');
%set(lines(3),'color', 'magenta');
legend([lines(1) lines(2)], 'FIR', 'Butterworth')

%legend([lines(1) lines(2) lines(3)], 'Cheby', 'FIR', 'Butterworth')

fcNormVert = fcNorm*ones(5);
fcNormVertPoints = [20 ; -20 ; -60 ; -80 ; -100];
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
%plot(xd,horizontaldB10, 'r:','HandleVisibility', 'off')
%hold on;
texte1 = ["Fréquence normalisée (pi*rad/s) : ", fcNorm];
texte2 = ["Fréquence filtre analogique : ", fs];
disp(texte1);
disp(texte2);