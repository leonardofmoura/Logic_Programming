:- use_module(library(clpfd)).

restrict_set([],_).

restrict_set([H|T],Set) :-
    H in_set Set,
    restrict_set(T,Set).

restrict_order([_,_]).

restrict_order([H1,H2,H3|T]) :-
    (H1 #> H2 #/\ H2 #> H3) #\/ (H1 #< H2 #/\ H2 #< H3),
    restrict_order([H2,H3|T]). 

p3(L1,L2) :-
    length(L1,Len),
    length(L2,Len),

    list_to_fdset(L1,Set),

    restrict_set(L2,Set),
    all_distinct(L2),

    restrict_order(L2),

    write('labeling'),
    labeling([],L2).

    
    
    
