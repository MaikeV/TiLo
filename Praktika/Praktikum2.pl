%Aufgabe 1 a)
linList(nil).
linList(list(X, Xs)) :- list(Xs).

%Aufgabe 1 b)
member(nil, Xs).
member(X, list(X, Ys)).
member(X, list(Y, Ys)) :- X \= Y, linList(Ys), member(X, Ys).

app(nil,Xs,Xs).
app(list(X,X1s),Ys,list(X,X2s)) :- app(X1s,Ys,X2s).

prefix(X, Y) :- app(X, Q, Y).

infix(Xs, Ys) :- prefix(Xs, Ys).
infix(Xs, list(X, Ys)) :- infix(Xs, Ys).
