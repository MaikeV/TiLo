%Aufgabe 1 a)
linList(nil).
linList(list(_, Xs)) :- linList(Xs).

%Aufgabe 1 b)
member1(X,list(X,_)).
member1(X,list(_,Ys)):- member1(X,Ys).

app(nil,Xs,Xs).
app(list(X,X1s),Ys,list(X,X2s)) :- app(X1s,Ys,X2s).

prefix(X, Y) :- append(X, _, Y).

infix(Xs, Ys) :- prefix(Xs, Ys).
infix(Xs, list(_, Ys)) :- infix(Xs, Ys).


%Aufgabe 2
baum(e).
baum(n(_, Lb, Rb)) :- baum(Lb), baum(Rb).

construct(X, Lb, Rb, n(X, Lb, Rb)) :- baum(Lb), baum(Rb).

nat(o).
nat(s(X)):- nat(X).

add(X, o, X).
add(X, s(Y), s(R)) :- add(X, Y, R), nat(X), nat(Y), nat(R).

knotenanz(e, o).
knotenanz(n(_, e, e), s(o)).
knotenanz(Xb, N) :- construct(_, Lb, Rb, Xb), knotenanz(Lb, L), knotenanz(Rb, R), add(L, R, N1), add(N1, s(o), N), nat(N), baum(Xb).


%Zusatzaufgabe Ys ist umgekehrtes Xs
rev(nil,nil).
rev(list(X,Xs),Ys) :- app(Rs,list(X,nil),Ys), rev(Xs,Rs), linList(Xs),linList(Ys).


%Praktikum 3
%Aufgabe 1
praefix([],_).
praefix([X|Xs],[X|Ys]) :- praefix(Xs,Ys).

postfixPR(Xs, Ys) :- reverse(Ys, Yrs), reverse(Xs, Xrs), prefix(Xrs, Yrs).

postfixA(Xs, Ys) :- append(_, Xs, Ys).

%Aufgabe 2
membertree(X, n(X, Lb, Rb)).
membertree(X, n(Y, Lb, Rb)) :- membertree(X, Lb), baum(Lb); membertree(X, Rb), baum(Rb).


%Aufgabe 3
praeorder(e, []).
praeorder(n(X, Lb, Rb), [X|Ys]) :- praeorder(Lb, Ls), praeorder(Rb, Rs), append(Ls, Rs, Ys).
%Query: praeorder(n(d, n(b, n(a, e, e), n(c, e, e)), n(f, n(u, e, e), n(g, e, e))), Zs).

postorder(e, []).
postorder(n(X, Lb, Rb), Ys) :- postorder(Lb, Ls), postorder(Rb, Rs), append(Ls, Rs, Ws), append(Ws, [X], Ys).
%Query: postorder(n(d, n(b, n(a, e, e), n(c, e, e)), n(f, n(u, e, e), n(g, e, e))), Zs).

roots([], []).
roots([e|Xbs], Ys) :- roots(Xbs, Ys). %was wenn baum leer
roots([n(X, _, _)| Xbs], [X|Ys]) :- roots(Xbs, Ys).
%Query: roots([n(b, n(a, e, e), n(c, e, e)), n(l, n(k, e, e), n(m, e, e))], Zs).
