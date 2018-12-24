%%%%%%%%%%%%%%%%%%%%%%%% FIR %%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear ;
clc ;
order = 1000;
cutoffnormalized = [0.4 0.6]; 
type = "bandpass";

g = fir1(order,cutoffnormalized, type, rectwin(order+1));
freqz(g,1,1000);
%M = freqz(g,1,1000);
%module = abs(M); 
%dB = 20*log(module);

% figure
% x = linspace(0,999,1000);
% y = dB;
% plot(x',y)
% grid on;



%hfvt = fvtool(a,1,b,1,c,1,d,1,e,1,f,1,g,1,h,1,i,1);
%legend(hfvt,'Bartlett','Blackman','Chebyshev','Gaussian','Hamming','Hanning','Rectangular','Tapered cosine','Triangular')



