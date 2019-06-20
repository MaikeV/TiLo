%Praktikum 5
%Aufgabe 1 - gerade binaere Palindrome
% s = #

state(z0).
state(z1).

sigma(0).
sigma(1).

gamma(0).
gamma(1).
gamma(s).

%1. Haelfte (Eingabesymbol auf Keller)
delta(z0, 1, s, z0, [1, s]).
delta(z0, 0, s, z0, [0, s]).
delta(z0, 1, 0, z0, [1, 0]).
delta(z0, 0, 0, z0, [0, 0]).
delta(z0, 1, 0, z0, [1, 1]).
delta(z0, 0, 1, z0, [0, 1]).

%Uebergang 1. -> 2. ohne Lesen
delta(z0, nix, s, z1, [s]).
delta(z0, nix, 0, z1, [0]).
delta(z0, nix, 1, z1, [1]).

%2. Haelfte (Vergleich von Eingabe und Keller)
delta(z1, 1, 1, z1, []).
delta(z1, 0, 0, z1, []).
delta(z1, nix, s, z1, []).

startState(z0).

basement(s).


%Aufgabe 2

lvonM(Ws) :-
  startState(S),
  basement(B),
  esPlus(S, Ws, [B], Snew, Bnew),
  sigmaStar(Ws).

es(S, W, [B|Bs], Snew, Bnew) :-
  delta(S, W, B, Snew, Btrans),
  append(Btrans, Bs, Bnew).

esPlus(S, [], [], S, []).
esPlus(S, Ws, Bs, Snew, Bnew) :-
  es(S, nix, Bs, Snew, Bnew),
  esPlus(Snew, Ws, Bnew, SnewNew, BnewNew).
esPlus(S, [W|Ws], Bs, Snew, Bnew) :-
  es(S, W, Bs, Snew, Bnew),
  esPlus(Snew, Ws, Bnew, SnewNew, BnewNew).

sigmaStar([]).
sigmaStar(Ws) :-
    sigmaStar(Hs),
    sigma(H),
    append([H], Hs, Ws).
