:- use_module(library(clpfd)).

restrict_oscil([H1,H2]).

restrict_oscil([H1,H2,H3|T]) :-
    (H2 #> H1 #/\ H2 #> H3) #\/ (H2 #< H1 #/\ H2 #< H3),
    restrict_oscil([H2,H3|T]).


restrict_two([H1,H2]) :-
    H1 #> H2 #\/ H1 #< H2.

ups_and_downs(Min,Max,N,L) :-
    length(L,N),

    domain(L,Min,Max),

    (N \= 2, restrict_oscil(L);
    restrict_two(L)),

    labeling([],L).
        
