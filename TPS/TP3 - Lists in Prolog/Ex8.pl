% a)
% count(List,N) -> True if N is the number of elements in the list
count([],0).

count([_|T],N) :-
    count(T,Dec),  
    N is Dec+1.


% OR USING ACCUMULATOR
count_acc(List,N) :- count_acc0(List,0,N).

count_acc0([],Acc,Acc).

count_acc0([_|T],Acc,Len) :-
    NAcc is Acc + 1,
    count_acc0(T,NAcc,Len).

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
