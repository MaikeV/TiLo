%Aufgabe 1 a)
linList(nil).
linList(list(X, Xs)) :- linList(Xs).

%Aufgabe 1 b)
member1(X,list(X,Ys)).
member1(X,list(Y,Ys)):- member1(X,Ys).

app(nil,Xs,Xs).
app(list(X,X1s),Ys,list(X,X2s)) :- app(X1s,Ys,X2s).

prefix(X, Y) :- app(X, Q, Y).

infix(Xs, Ys) :- prefix(Xs, Ys).
infix(Xs, list(X, Ys)) :- infix(Xs, Ys).


%Aufgabe 2
baum(e).
baum(n(X, Lb, Rb)) :- baum(Lb), baum(Rb).

construct(X, Lb, Rb, n(X, Lb, Rb)) :- baum(Lb), baum(Rb).

nat(o).
nat(s(X)):- nat(X).

add(X, o, X).
add(X, s(Y), s(R)) :- add(X, Y, R), nat(X), nat(Y), nat(R).

knotenanz(e, o).
knotenanz(n(X, e, e), s(o)).
knotenanz(Xb, N) :- construct(X, Lb, Rb, Xb), knotenanz(Lb, L), knotenanz(Rb, R), add(L, R, N1), add(N1, s(o), N), nat(N), baum(Xb).
