
global dx L W Ilen Jlen Klen Vbound

dx = 10^-7 * 100;		% element size in cM
L = 10 * 10^-6 * 100; 	% channel length (10 uM) in cM
W = 100 * 10 ^-9 * 100;	% channel width/depth (100 nM) in cM

Ilen = int64(W/dx);
Jlen = int64(W/dx);
Klen = int64(L/dx);

Vbound = [0, 10];


Vguess = zeros(1,Ilen*Jlen*Klen);

[x0,x,nf] = newtonNdNoJacob(@linRes,Vguess);

plot(x0)

pause
