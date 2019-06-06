linList(nil).
linList(list(X, Xs)) :- linList(Xs).

member1(X,list(X,Ys)).
member1(X,list(Y,Ys)):- member1(X,Ys).

app(nil,Xs,Xs).
app(list(X,X1s),Ys,list(X,X2s)) :- app(X1s,Ys,X2s).

prefix(X, Y) :- app(X, Q, Y).

infix(Xs, Ys) :- prefix(Xs, Ys).
infix(Xs, list(X, Ys)) :- infix(Xs, Ys).

%Aufgabe 31 a
rmlast([X],[]).
rmlast([X|Xs],[X|Ys]):- rmlast(Xs,Ys).

%Aufgabe 45 e
rS([tick|Is]) :- rI(Is).
rI([tack]).
rI([tack|As]) :- rA(As).
rA([tick]).
rA([tick|Is]) :- rI(Is).

%Aufgabe 49 a
rS1(W) :- rS(W).

%Aufgabe 49 b
s_uhr([tick|Xs]) :- a_uhr(Xs).


%Uebung 8

%Aufgabe 62
gagbS([]).
gagbS([As|Bs]) :- append([a], As, A1s), append([b], Bs, B1s), gagbA(A1s), gagbB(B1s).

gagbA([a]).
gagbA([As|a]) :- gagbA(As).

gagbB([b]).
gagbB([b|Bs]) :- gagbB(Bs).


%Uebung 9

%Aufgabe 16
baum(e).
baum(n(_, Lb, Rb)) :- baum(Lb), baum(Rb).

construct(X, Lb, Rb, n(X, Lb, Rb)) :- baum(Lb), baum(Rb).

mirror(n(X, e, e), n(X, e, e)).
mirror(n(X, Lb, Rb), Kb) :- mirror(Lb, Xb), mirror(Rb, Yb), construct(X, Xb, Yb, Kb).
