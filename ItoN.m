function n = ItoN(i,j,k)

	global dx L W Ilen Jlen Klen Vbound


	n = i + (j-1) * Ilen + (k-1) * Ilen * Jlen;

