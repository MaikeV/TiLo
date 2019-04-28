% X is female
female(maike).
female(anne).
female(anni).
female(sabine).
female(inka).
female(lene).
female(brigitte).
female(kathi).
female(joyce).
female(nathalie).
female(nadine).
female(lena).

% Y is male
male(thomas).
male(gerd).
male(gerdJr).
male(bernd).
male(klaus).
male(berndJr).
male(stefanW).
male(andre).
male(louis).
male(max).
male(urmel).
male(stefanR).
male(mario).

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
parent(bernd, berndJr).

parent(brigitte, stefanW).
parent(brigitte, andre).
parent(brigitte, kathi).

parent(klaus, joyce).
parent(klaus, louis).

parent(berndJr, max).
parent(berndJr, urmel).

parent(sabine, mario).
parent(sabine, lena).

parent(inka, stefanR).

parent(gerdJr, nadine).
parent(gerdJr, nathalie).

% X is father of Y
father(X, Y) :- parent(X, Y), male(X).

% X is mother of Y
mother(X, Y) :- parent(X, Y), female(X).

% X is son of Y
son(X, Y) :- parent(Y, X), male(X).

% X is daughter of Y
daughter(X, Y) :- parent(Y, X), female(X).

% X is sibling of Y
sibling(X, Y) :- father(F, X), father(F, Y), mother(M, X), mother(M, Y).

% X is brother of Y
brother(X, Y) :- father(F, X), father(F, Y), mother(M, X), mother(M, Y), male(X), X\=Y.

% X is sister of Y
sister(X, Y) :- father(F, X), father(F, Y), mother(M, X), mother(M, Y), female(X), X\=Y.

% X is grandmother of Y
grandmother(X, Y) :- mother(X, M), mother(M, Y), female(X).
grandmother(X, Y) :- mother(X, F), father(F, Y), female(X).

% X is grandfather of Y
grandfather(X, Y) :- father(X, M), mother(M, Y), male(X).
grandfather(X, Y) :- father(X, F), father(F, Y), male(X).

% X is uncle of Y
uncle(X, Y) :- brother(X, F), father(F, Y), male(X).
uncle(X, Y) :- brother(X, M), mother(M, Y), male(X).

aunt(X, Y) :- sister(X, F), father(F, Y), female(X).
aunt(X, Y) :- sister(X, M), mother(M, Y), female(X).

% X is cousin of Y
cousin(X, Y) :- father(F, X), uncle(F, Y).
cousin(X, Y) :- mother(M, X), aunt(M, Y).
