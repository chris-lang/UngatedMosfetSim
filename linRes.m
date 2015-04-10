function f = linRes(Vguess)

global dx L W Ilen Jlen Klen Vbound

Nd = 2.5 * 10^15;               %%% silicon pilar doping
un = 1400;                       %% in cm^2/(V s)
q = 1.6 * 10 ^-19;              %% electron charge in Columbs

Rdel = 1/(q*Nd*un*dx);

f = zeros(1,Ilen*Jlen*Klen); 

for i = 1:Ilen
	for j = 1:Jlen
		for k = 1:Klen

			NodeInflux = 0;

			

			if i ~= 1
				NodeInflux += (Vguess(ItoN(i-1,j,k))-Vguess(ItoN(i,j,k)))/Rdel;
			end

			if i ~= Ilen
				NodeInflux += (Vguess(ItoN(i+1,j,k))-Vguess(ItoN(i,j,k)))/Rdel;
			end

			if j ~= 1
				NodeInflux += (Vguess(ItoN(i,j-1,k))-Vguess(ItoN(i,j,k)))/Rdel;
			end

			if j ~= Jlen
				NodeInflux += (Vguess(ItoN(i,j+1,k))-Vguess(ItoN(i,j,k)))/Rdel;
			end

			if k ~= 1
				NodeInflux += (Vguess(ItoN(i,j,k-1))-Vguess(ItoN(i,j,k)))/Rdel;
			else
				NodeInflux += (Vbound(1)-Vguess(ItoN(i,j,k)))/Rdel;
			end

			if k ~= Klen
				NodeInflux += (Vguess(ItoN(i,j,k+1))-Vguess(ItoN(i,j,k)))/Rdel;
			else
				NodeInflux += (Vbound(2)-Vguess(ItoN(i,j,k)))/Rdel;
			end

			f(ItoN(i,j,k)) = abs(NodeInflux);
		end
	end
end



