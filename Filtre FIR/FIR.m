%%%%%%%%%%%%%%%%%%%%%%%% FIR %%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear ;
clc ;

order = 45;
cutoffnormalized = [0.4 0.6]; 
type = "bandpass";

a = fir1(order,cutoffnormalized, type, bartlett(order+1)); % Lowpass

b = fir1(order,cutoffnormalized, type, blackman(order+1)); % Lowpass

c = fir1(order,cutoffnormalized, type, chebwin(order+1)); % Lowpass

d = fir1(order,cutoffnormalized, type, gausswin(order+1)); % Lowpass

e = fir1(order,cutoffnormalized, type, hamming(order+1)); % Lowpass

f = fir1(order,cutoffnormalized, type, hann(order+1)); % Lowpass

g = fir1(order,cutoffnormalized, type, rectwin(order+1)); % Lowpass

h = fir1(order,cutoffnormalized, type, tukeywin(order+1)); % Lowpass

i = fir1(order,cutoffnormalized, type, triang(order+1)); % Lowpass


%hfvt = fvtool(g,1,i,1);
%legend(hfvt,'Rectangular','Triangular')

hfvt = fvtool(a,1,b,1,c,1,d,1,e,1,f,1,g,1,h,1,i,1);
legend(hfvt,'Bartlett','Blackman','Chebyshev','Gaussian','Hamming','Hanning','Rectangular','Tapered cosine','Triangular')



