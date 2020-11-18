:-use_module(library(clpfd)).

extractX([],[]).

extractX([H,_|T],[H|Rest]) :-
    extractX(T,Rest).

extractY([],[]).

extractY([_,H|T],[H|Rest]) :-
    extractY(T,Rest).


restrict_elem([],_,[]).

restrict_elem([H|T],Elements,[V|Rest]) :-
    element(H, Elements, V),
    restrict_elem(T,Elements,Rest).
    

restrict_heights([],[],_).

restrict_heights([M|Men],[W|Woman],Delta) :- 
    M #> W,
    M - W #=< Delta,
    restrict_heights(Men,Woman,Delta).

pair([],[]).

pair([X,Y|T],[X-Y|Pairs]) :-
    pair(T,Pairs).


restrict_crescent([_]).

restrict_crescent([X,Y|T]) :-
    X #< Y,
    restrict_crescent([Y|T]).

gym_pairs(MenHeights,WomanHeights,Delta,Pairs) :-
    length(MenHeights,Len),
    length(WomanHeights,Len),

    LenPairs is 2 * Len, 

    length(IncPairs,LenPairs),

    domain(IncPairs,1,Len),

    extractX(IncPairs,Men),
    extractY(IncPairs,Woman),

    all_distinct(Men),
    all_distinct(Woman),

    restrict_elem(Men,MenHeights,SelMenHeights),
    restrict_elem(Woman,WomanHeights,SelWomanHeights),

    restrict_heights(SelMenHeights,SelWomanHeights,Delta),

    restrict_crescent(SelMenHeights), % eliminate symetries

    write(labeling),
    
    labeling([],IncPairs),
    pair(IncPairs,Pairs).
    
    
    