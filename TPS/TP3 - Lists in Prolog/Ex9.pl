% a)
% substitute_(Elem1,Elem2,List1,List2) -> Substitutes every ocurrence of Elem1 in List1 to Elem2 in List2
substitute_(_,_,[],[]).

substitute_(Elem1, Elem2, [H1|T1], [H2|T2]) :-
    Elem1 = H1,
    Elem2 = H2,
    substitute_(Elem1,Elem2,T1,T2).

substitute_(Elem1,Elem2,[H1|T1],[H2|T2]) :-
    Elem1 \= H1,
    H1 = H2,
    substitute_(Elem1,Elem2,T1,T2).    

% b)
% elim_duplicates(List1,List2) -> Eliminates duplicates in List1 in List2

find(Elem,List) :- append(_,[Elem|_],List).

elim_dups([],[],_).

elim_dups([H1|T1],List2,FoundElems) :-
    find(H1,FoundElems),
    elim_dups(T1,List2,FoundElems).

elim_dups([H1|T1],[H1|T2],FoundElems) :-
    \+find(H1,FoundElems),
    elim_dups(T1,T2,[H1|FoundElems]).

elim_duplicates(List1,List2) :- elim_dups(List1,List2,[]).

