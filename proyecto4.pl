%todo es una función
%la única función que no se trata como las demás es la identidad
%derivada(h(x), x, dh/dx)



%https://gist.github.com/tokkenno/8038482
derivada(X, X, 1).

derivada(X, _, Dh):-
	integer(X),
	Dh = 0.

derivada(F + G, Var, Dh):-
	derivada(F, Var, Df),
	derivada(G, Var, Dg),
	Dh =  Df + Dg.

derivada(F - G, Var, Dh):-
	derivada(F, Var, Df),
	derivada(G, Var, Dg),
	Dh =  Df + Dg.

derivada(ln(F), Var, Dh):-
	derivada(F, Var, Df),
	Dh = 1/F*Df.

derivada(cos(F), Var, Dh):-
	derivada(F, Var, Df),
	Dh = -sen(F)*Df.

derivada(sen(F), Var, Dh):-
	derivada(F, Var, Df),
	Dh = cos(F)*Df.

derivada(sin(F), Var, Dh):-
	derivada(F, Var, Df),
	Dh = cos(F)*Df.

derivada(arctan(F), Var, Dh):-
	derivada(F, Var, Df),
	Dh = 1/(F^2+1)*Df.

derivada(tan(F), Var, Dh):-
	derivada(F, Var, Df),
	Dh = sec(F)^2*Df.

derivada(exp(F), Var, Dh):-
	derivada(F, Var, Df),
	Dh = exp(F)*Df.

derivada(F ^ Y, Var, Dh) :-
	derivada(F, Var, Df),
	Ym1 is Y-1,
	Dh = Y*F ^ Ym1 * Df.

derivada(F*G, Var, Dh):-
	derivada(F, Var, Df),
	derivada(G, Var, Dg),
	Dh = Df * G + Dg * F.

derivada(F/G, Var, Dh):-
	derivada(F, Var, Df),
	derivada(G, Var, Dg),
	Dh = (G*Df - F*Dg)/(G)^2.
