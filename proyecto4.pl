
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
	atom(X),
	name(X, Ascii),
	numero(Ascii),
	Yields = 0.

derivada(X + Y, Var, Yields):-
	derivada(X, Var, D1),
	derivada(Y, Var, D2),
	Yields =  D1 + D2.

derivada(X - Y, Var, Yields):-
	derivada(X, Var, D1),
	derivada(Y, Var, D2),
	Yields =  D1 + D2.

derivada(ln(X), Var, Yields):-
	derivada(X, Var, D1),
	Yields = 1/X*D1.

derivada(cos(X), Var, Yields):-
	derivada(X, Var, D1),
	Yields = -sen(X)*D1.

derivada(sen(X), Var, Yields):-
	derivada(X, Var, D1),
	Yields = cos(X)*D1.

derivada(sin(X), Var, Yields):-
	derivada(X, Var, D1),
	Yields = cos(X)*D1.

derivada(arctan(X), Var, Yields):-
	derivada(X, Var, D1),
	Yields = 1/(X^2+1)*D1.

derivada(tan(X), Var, Yields):-
	derivada(X, Var, D1),
	Yields = sec2(X)*D1.

derivada(exp(X), Var, Yields):-
	derivada(X, Var, D1),
	Yields = exp(X)*D1.

%derivada(X ^ Y, Var, Yields) :-
%derivada(X*Y, Var, Yields):-
%derivada(X/Y, Var, Yields):-
