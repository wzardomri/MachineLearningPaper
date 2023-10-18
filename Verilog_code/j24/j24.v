module j24(input A, B, C, D, E, F, G, H, I, J, K, L, M, N, O , P, output Z);
  
	wire G1 = A&B;
	wire G2 = C&D;
	wire G3 = G1|G3;
	
	wire G4 = E^F;
	wire G5 = G^H;
	wire G6 = G4&G5;
	
	wire G7 = ~(I&J);
	wire G8 = ~(K&L);
	wire G9 = ~(G7|G8);
	
	wire G10 = ~(M^N);
	wire G11 = ~(O^P);
	wire G12 = ~(G10&G11);
	
	wire G13 = G3 ^ G6 ^ G9 ^ G12;
	
	assign Z = G13;

	
endmodule
