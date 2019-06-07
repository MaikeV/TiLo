startState(s0).
endState(s3).

sigma(a).
sigma(b).

delta(s0, a, s1).
delta(s0, b, s1).
delta(s1, a, s0).
delta(s1, b, s0).

state(s0).
state(s1).

startState(s0).
endState(s0).

lvonN(Ws) :-
    startState(S),
    sigmaStar(Ws),
    endState(E),
    deltaStar(S, Ws, E).

deltaStar(S, [], S) :-
    state(S).
deltaStar(S, [W|Ws], SNew) :-
    delta(S, W, STrans),
    deltaStar(STrans, Ws, SNew).

sigmaStar([]).
sigmaStar(Ws) :-
    sigmaStar(Hs),
    sigma(H),
    append([H], Hs, Ws).
