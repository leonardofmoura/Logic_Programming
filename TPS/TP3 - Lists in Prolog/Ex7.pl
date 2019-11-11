
% True if Elem1 and Elem2 are members of L and Elem1 ocurrs in the list before Elem2

before(Elem1,Elem2,L) :- 
    append(_,[Elem1|T],L),
    append(_,[Elem2|_],T).