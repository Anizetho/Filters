A = bartlett(100) ; 
B = blackman(100);
C = chebwin(100);
D = gausswin(100);
E = hamming(100);
F = hann(100);
G = rectwin(100);
H = tukeywin(100);
I = triang(100);


All = [A, B, C, D, E, F, G, H, I];
plot(All)
legend('Bartlett','Blackman','Chebyshev','Gaussian','Hamming','Hanning','Rectangular','Tapered cosine','Triangular')