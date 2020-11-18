% permutation(List1,List2) -> True if List2 is a permutation of List2
% (Uses the elim_first predicate)

elim_first(X,[X|T],T).

elim_first(X,[H|T],[H|T2]) :-
    X \= H,
    elim_first(X,T,T2).


permutation_([],[]).

permutation_([H|T],List2) :- 
    elim_first(H,List2,New),
    permutation_(T,New).