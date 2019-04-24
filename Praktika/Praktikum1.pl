% X is female
female(maike).
female(anne).
female(anni).
female(sabine).
female(inka).
female(lene).
female(brigitte).

% Y is male
male(thomas).
male(gerd).
male(gerdJr).
male(bernd).
male(klaus).
male(berndJr).

% R is parent of T
parent(thomas, maike).
parent(anne, maike).

parent(anni, anne).
parent(gerd, anne).

parent(anni, sabine).
parent(gerd, sabine).

parent(anni, inka).
parent(gerd, inka).

parent(anni, gerdJr).
parent(gerd, gerdJr).

parent(lene, thomas).
parent(bernd, thomas).

parent(lene, brigitte).
parent(bernd, brigitte).

parent(lene, klaus).
parent(bernd, klaus).

parent(lene, berndJr).
parent(bernd,berndJr).

% X is father of Y
father(X, Y) :- parent(X, Y), male(X).

% X is mother of Y
mother(X, Y) :- parent(X, Y), female(X).

% X is son of Y
son(X, Y) :- parent(Y, X), male(X).

% X is daughter of Y
daughter(X, Y) :- parent(Y, X), female(X).

% X is brother of Y
brother(X, Y) :- father(F, X), father(F, Y), mother(M, X), mother(M, Y), male(X).

% X is sister of Y
sister(X, Y) :- father(F, X), father(F, Y), mother(M, X), mother(M, Y), female(X).
