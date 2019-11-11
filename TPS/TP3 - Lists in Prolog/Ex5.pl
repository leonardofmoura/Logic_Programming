% a)
memberA(X,[H|T]) :-
    X = H;
    memberA(X,T).

% b)
memberB(X,L) :- append(_,[X|_],L).

% c)
last(L,X) :- append(_,[X],L).

% d)
nthElem([H|T],Num,Elem) :-
    Num = 1,
    H = Elem;
    Inf is Num-1,
    nthElem(T,Inf,Elem).

/* OR 
nthElem([H|T],Num,Elem) :-
    Inf is Num-1,
    nthElem(T,Inf,Elem).

nthElem([H|T],1,Elem) :-
    H = Elem.
*/



    