
asciiExp([pAbre(_), asciiExp(_), pCierra(_)]).
%asciiExp([asciiExp(_), opSum(_), asciiExp(_)]).
%asciiExp([asciiExp(_), opMul(_), asciiExp(_)]).
%asciiExp([asciiExp(_), opDivision(_), asciiExp(_)]).
%asciiExp([asciiExp(_), opResta(_), asciiExp(_)]).

%https://stackoverflow.com/questions/32931732/convert-compound-to-atom-in-prolog


%suma
asciiExp(Ascii):-
	[H|T] = Ascii,
	asciiExp(H),
	[H2, T2] = T,
	opSum(H2),
	asciiExp(T2).

%multiplicacion
asciiExp(Ascii):-
	[H|T] = Ascii,
	asciiExp(H),
	[H2, T2] = T,
	opMul(H2),
	asciiExp(T2).

%resta
asciiExp(Ascii):-
	[H|T] = Ascii,
	asciiExp(H),
	[H2, T2] = T,
	opResta(H2),
	asciiExp(T2).

%division
asciiExp(Ascii):-
	[H|T] = Ascii,
	asciiExp(H),
	[H2, T2] = T,
	opDivision(H2),
	asciiExp(T2).

%opElevacion
asciiExp(Ascii):-
	[H|T] = Ascii,
	asciiExp(H),
	[H2, T2] = T,
	opElevacion(H2),
	asciiExp(T2).

asciiExp(Ascii):-
	numero(Ascii).

expresion(X):-
	name(X, Ascii),
	asciiExp(Ascii).

digito(Ascii) :-
	Ascii >= 48,
	Ascii =< 57.

digito(X):-
	X = [].

numero(Ascii):-
	\+ is_list(Ascii),
	digito(Ascii).

%evaluacion recursiva
numero(Ascii):-
	[H|T] = Ascii,
	digito(H),
	numero(T).

numero(X):-
	X = [].



pAbre(Ascii):-
	Ascii = 40.
pCierra(Ascii):-
	Ascii = 41.

opMul(Ascii):-
	Ascii = 42.
opSum(Ascii):-
	Ascii = 43.
opResta(Ascii):-
	Ascii = 45.
opDivision(Ascii):-
	Ascii = 47.

opElevacion(Ascii):-
	Ascii = 94.

%https://gist.github.com/tokkenno/8038482


%multiplicación y división de funciones polinomiales, 

derivada(X, X, 1).

derivada(X, _, Yields):-
	integer(X),
	Yields = 0.

derivada(F + G, Var, Yields):-
	derivada(F, Var, Df),
	derivada(G, Var, Dg),
	Yields =  Df + Dg.

derivada(F - G, Var, Yields):-
	derivada(F, Var, Df),
	derivada(G, Var, Dg),
	Yields =  Df + Dg.

derivada(ln(F), Var, Yields):-
	derivada(F, Var, Df),
	Yields = 1/F*Df.

derivada(cos(F), Var, Yields):-
	derivada(F, Var, Df),
	Yields = -sen(F)*Df.

derivada(sen(F), Var, Yields):-
	derivada(F, Var, Df),
	Yields = cos(F)*Df.

derivada(sin(F), Var, Yields):-
	derivada(F, Var, Df),
	Yields = cos(F)*Df.

derivada(arctan(F), Var, Yields):-
	derivada(F, Var, Df),
	Yields = 1/(F^2+1)*Df.

derivada(tan(F), Var, Yields):-
	derivada(F, Var, Df),
	Yields = sec2(F)*Df.

derivada(exp(F), Var, Yields):-
	derivada(F, Var, Df),
	Yields = exp(F)*Df.

derivada(F ^ Y, Var, Yields) :-
	derivada(F, Var, Df),
	Ym1 is Y-1,
	Yields = Y*F ^ Ym1 * Df.

derivada(F*G, Var, Yields):-
	derivada(F, Var, Df),
	derivada(G, Var, Dg),
	Yields = Df * G + Dg * F.

derivada(F/G, Var, Yields):-
	derivada(F, Var, Df),
	derivada(G, Var, Dg),
	Yields = (G*Df - F*Dg)/(G)^2.
