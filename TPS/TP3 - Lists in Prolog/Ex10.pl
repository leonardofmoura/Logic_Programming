% a)
% ordered(L) -> True if L is a ordered list of integers

ordered_([_]).
ordered_([]).

ordered_([H1,H2|T]) :- 
    H1 =< H2,
    ordered_([H2|T]).

% b)
% order(List1,List2) -> Orders List1 to List2 
% Based on the insersion sort implementation found at http://kti.mff.cuni.cz/~bartak/prolog/sorting.html

insert(X,[],[X]).

insert(X,[H1|T1],[H1|T2]) :- 
    X > H1,
    insert(X,T1,T2).

insert(X,[H1|T1],[X,H1|T1]) :- X =< H1.

i_sort([],X,X).

i_sort([H|T],TempList,Sorted) :- 
    insert(H,TempList,NewTempList),
    i_sort(T,NewTempList,Sorted).

order(List1,List2):- i_sort(List1,[],List2).
