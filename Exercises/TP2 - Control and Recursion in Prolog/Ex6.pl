% Prime numbers

prime(2).
prime(3).

prime(N) :- 
    integer(N),
    \+ isEven(N),
    Inc is N + 1,
    Half is Inc / 2,
    X is round(Half),
    noFactor(N,X).

noFactor(N,F) :-
    \+ hasFactor(N,F), 
    Inf is F-1,
    noFactor(N,Inf).

noFactor(N,2) :-
    \+ hasFactor(N,2).

hasFactor(N,F) :-
    Fac is N mod F, 
    Fac = 0.

isEven(N) :-
    Res is N mod 2,
    Res = 0.
    
