

asciiExp([pAbre(_), asciiExp(_), pCierra(_)]).
%asciiExp([asciiExp(_), opSum(_), asciiExp(_)]).
%asciiExp([asciiExp(_), opMul(_), asciiExp(_)]).
%asciiExp([asciiExp(_), opDivision(_), asciiExp(_)]).
%asciiExp([asciiExp(_), opResta(_), asciiExp(_)]).

%https://stackoverflow.com/questions/32931732/convert-compound-to-atom-in-prolog


asciiExp(Ascii):-
	numero(Ascii).

%suma
asciiExp(Ascii):-
	[H|T] = Ascii,
	numero(H),
	[H2, T2] = T,
	opSum(H2);
	opMul(H2);
	opResta(H2);
	opDivision(H2);
	opElevacion(H2);
	asciiExp(T2).

%asciiExp(Ascii):-
%	[H|T] = Ascii,
%	numero(H),
%	[H2, T2] = T,
%	opMul(H2),
%	asciiExp(T2).
%
%asciiExp(Ascii):-
%	[H|T] = Ascii,
%	numero(H),
%	[H2, T2] = T,
%	opResta(H2),
%	asciiExp(T2).

expresion(X):-
	name(X, Ascii),
	asciiExp(Ascii).

digito(Ascii) :-
	Ascii >= 48,
	Ascii =< 57.

numero(Ascii):-
	\+ is_list(Ascii),
	digito(Ascii).

%evaluacion recursiva
numero(Ascii):-
	[H|T] = Ascii,
	digito(H),
	numero(T).

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


