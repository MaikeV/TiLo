% Autor:
% Datum: 08.04.2019


%Aufgabe 5 - Stammbaum:

vater(terach, abraham).
vater(terach, nachor).
vater(terach, haran).
vater(abraham, isaak).
vater(haran, lot).
vater(haran, milcah).
vater(haran, yiscah).

mutter(sahra, isaak).

maennlich(terach).
maennlich(abraham).
maennlich(nachor).
maennlich(haran).
maennlich(isaak).
maennlich(lot).

weiblich(sarah).
weiblich(milcah).
weiblich(yiscah).

bruder(X, Y) :- vater(V, X), vater(V, Y), mutter(M, X), mutter(M, Y), maennlich(X).
schwester(X, Y) :- vater(V, X), vater(V, Y), mutter(M, X), mutter(M, Y), weiblich(X).

halbbruder(X, Y) :- vater(V, X), vater(V, Y), maennlich(X).
halbbruder(X, Y) :- mutter(M, X), mutter(M, Y), maennlich(X).

halbschwester(X, Y) :- vater(V, X), vater(V, Y), weiblich(X).
halbschwester(X, Y) :- mutter(M, X), mutter(M, Y), weiblich(X).

grossvater(X, Y) :- vater(X, H), vater(H, Y), maennlich(X).
grossvater(X, Y) :- vater(X, H), mutter(H, Y), maennlich(X).

grossmutter(X, Y) :- mutter(X, H), mutter(H, Y), weiblich(X).
grossmutter(X, Y) :- mutter(X, H), vater(H, Y), weiblich(X).




%Aufgabe 6 - plus: X + Y = R:

%a)
natSymb(o).
natSymb(s(X)):- natSymb(X).

plus(X, o, X).
plus(X, s(Y), s(R)) :- plus(X, Y, R), natSymb(X), natSymb(Y), natSymb(R).

%e)
mult(X, o, o).
mult(X, s(o), X).
mult(X, s(Y), R) :- plus(R1, X, R), mult(X, Y, R1), natSymb(X), natSymb(Y), natSymb(R).




%Aufgabe 8:

%a)
eqZero(X) :- plus(X, o, o), natSymb(X).

%b)
neqZero(X) :- plus(X, o, X), natSymb(X).

%c)
less(o, X).
less(s(X), s(s(Y))) :- less(X, Y), natSymb(X), natSymb(Y).

%d)
square(X, Y) :- mult(X, X, Y), natSymb(X), natSymb(Y).



%Aufgabe 9:

%a)
conn(a, b).
conn(a, c).
conn(a, d).
conn(a, e).

conn(b, c).
conn(b, d).
conn(b, e).

conn(c, d).

conn(e, c).
conn(e, d).

%b)
pass(X, X).
pass(X, Y) :- conn(X, U), pass(U, Y).

%c)
connLen(a, b, s(o)).
connLen(X, X, o).
connLen(X, Y, L) :- conn(X, Y1), conn(Y1, Y), natSymb(L).

% ja, a - b - e - c


