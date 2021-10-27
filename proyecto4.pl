% Proyecto 4 de la clase de Lógica Matemática 
% Este programa debe calcular la derivada sumas, restas, multiplicaciones, divisiones
% , funciones polinomiales, coseno, seno, tangente, arctan, exponentes y logaritmo natural


% Derivada de una constante
derivada(U,	0):- 
	number(U).	

	
% Derivada de x^n

derivada(U^N, X, N*X^V):- 
	N > 0,
	V is N-1.

