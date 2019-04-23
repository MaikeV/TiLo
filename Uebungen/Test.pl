% Autor:
% Datum: 05.04.2019

%Fakten:
gross(erwin).
schlank(erwin).

%Regeln:
liebt(klaus, X) :- gross(X), schlank(X).
liebt(klaus, hilda).

nat(o).
nat(s(X)):- nat(X).

ad(X,o,X).
ad(X,s(Y),s(R)):- ad(X,Y,R).

um1groesser(X,s(X)).

list(a, list(b, list(c, nil))).