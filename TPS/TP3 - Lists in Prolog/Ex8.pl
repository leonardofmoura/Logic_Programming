% a)
% count(List,N) -> True if N is the number of elements in the list
count([],0).

count([_|T],N) :-
    count(T,Dec),  
    N is Dec+1.

% b)
% count_elem(X,List,N) -> True if X ocurrs N times in List
count_elem(_,[],0).

count_elem(X,[H|T],N) :-
    X = H,
    Dec is N-1,
    count_elem(X,T,Dec).

count_elem(X,[H|T],N) :-
    X \= H,
    count_elem(X,T,N).
