:- include('Ex5.pl').


% 6)
delete_one(X,L1,L2) :- 
    append(La,[X|Lb],L1),
    append(La,Lb,L2).

% b) Do in another way
delete_all(_,[],[]).

delete_all(X,[X|T],L2) :- delete_all(X,T,L2).

delete_all(X,[H|T],[H|L2]) :- 
    X \= H, 
    delete_all(X,T,L2).

% c)
delete_all_list([],_,_).

delete_all_list([H|T],L1,L2) :- 
    delete_all(H,L1,L3),
    delete_all_list(T,L3,L2),
    (var(L2),
    L2 = L3;
    nonvar(L2)).
