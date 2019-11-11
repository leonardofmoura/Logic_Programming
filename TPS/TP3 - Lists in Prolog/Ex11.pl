
flat_list([],[]).

flat_list(X,[X]) :- atomic(X).

flat_list([H1|T1],L) :-
    flat_list(H1,L1),
    flat_list(T1,L2),
    append(L1,L2,L).
    
