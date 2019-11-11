% a) list_to(N,L) -> True if L is a list of all the integers between 1 and N

list_to_(0,Acc,Acc).

list_to_(N,Acc,Res) :-
    N > 0,
    Inf is N - 1,
    list_to_(Inf,[N|Acc],Res).

list_to(N,L) :-
    list_to_(N,[],L).

% b) list_between(N1,N2,L) -> True if L is a list if all the integers between N1 and N2
list_between_(N1,N1,Acc,[N1|Acc]).

list_between_(N1,N2,Acc,L) :-
    N2 > N1,
    Inf is N2 - 1,
    list_between_(N1,Inf,[N2|Acc],L).

list_between(N1,N2,L) :-
    list_between_(N1,N2,[],L).

% c) sum_list(L,N) -> True if N is the sum of all the elements of L
sum_list_([],Acc,Acc).

sum_list_([H|T],Acc,Res) :-
    Sum is Acc + H,
    sum_list_(T,Sum,Res).

sum_list(L,Sum) :-
    sum_list_(L,0,Sum).

% d) even(N) -> True if N is even
even(N) :- 0 is mod(N,2).

% e) list_even(N,L) -> True if L is a list of all the even numbers equal or inferior to N
list_even_(0,Acc,[0|Acc]).

list_even_(N,Acc,Res) :-
    N > 0,
    Inf is N - 2,
    list_even_(Inf,[N|Acc],Res).

list_even(N,Res) :-
    even(N),
    list_even_(N,[],Res);
    \+ even(N),
    Inf is N - 1,
    list_even_(Inf,[],Res).

% f) list_odd(N,L) -> True if L is a list of all odd numbers equal or inferior to N
list_odd_(1,Acc,[1|Acc]).

list_odd_(N,Acc,Res) :-
    N > 0,
    Inf is N - 2,
    list_odd_(Inf,[N|Acc],Res).

list_odd(N,Res) :-
    even(N),
    Inf is N - 1,
    list_odd_(Inf,[],Res);
    \+ even(N),
    list_odd_(N,[],Res).
