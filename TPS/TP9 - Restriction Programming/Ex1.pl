:- use_module(library(clpfd)).
:- use_module(library(lists)).

display_square_([],_,_).

display_square_([H|T],Size,Size) :-
    write(H), write(' '), nl,
    display_square_(T,Size,1), !.

display_square_([H|T],Size,Index) :-
    write(H), write(' '),
    NextIndex is Index + 1,
    display_square_(T,Size,NextIndex).

display_square(List,Size) :-
    display_square_(List,Size,1).


% a)
% magic3x3(-Vars) -> solves a 3x3 magic square where Vars is a list representing the 3x3 board
magic3x3(Vars) :-
    Vars = [V1,V2,V3,V4,V5,V6,V7,V8,V9],
    domain(Vars,1,9),
    all_distinct(Vars),
    V1 + V2 + V3 #= Sum,
    V4 + V5 + V6 #= Sum, 
    V7 + V8 + V9 #= Sum,
    V1 + V4 + V7 #= Sum,
    V2 + V5 + V8 #= Sum, 
    V3 + V6 + V9 #= Sum,
    V1 + V5 + V9 #= Sum,
    V3 + V5 + V7 #= Sum,
    labeling([],Vars).

% b)
restrict_row_sum_(_,_,AccSum,Sum,0) :- AccSum #= Sum.

restrict_row_sum_(List,StartIndex,AccSum,Sum,Size) :-
    nth1(Size, List, Elem),
    NextAccSum #= AccSum + Elem,
    NextSize is Size - 1,
    restrict_row_sum_(List,StartIndex,NextAccSum,Sum,NextSize).
    
restrict_row_sum(_,Index,Size,_) :-
    Len is Size * Size,
    Index = Len.
    
restrict_row_sum(List,Index,Size,Sum) :-
    restrict_row_sum_(List,Index,0,Sum,Size),
    NextIndex is Index + Size, 
    restrict_row_sum(List,NextIndex,Size,Sum).


restrict_col_sum_(_,Index,AccSum,Sum,Size) :- 
    Len is Size * Size - 1,
    Index > Len,
    AccSum #= Sum.

restrict_col_sum_(List,StartIndex,AccSum,Sum,Size) :-
    nth0(StartIndex,List,Elem),
    NextAccSum #= AccSum + Elem,
    NextIndex is StartIndex + Size,
    restrict_col_sum_(List,NextIndex,NextAccSum,Sum,Size).

restrict_col_sum(_,Size,Size,_).

restrict_col_sum(List,Index,Size,Sum) :-
    restrict_col_sum_(List,Index,0,Sum,Size),
    NextIndex is Index + 1,
    restrict_col_sum(List,NextIndex,Size,Sum).


restrict_diag_sum_(_,Index,AccSum,Sum,Size) :- 
    Len is Size * Size - 1,
    Index > Len,
    AccSum #= Sum.

restrict_diag_sum_(List,StartIndex,AccSum,Sum,Size) :-
    nth0(StartIndex,List,Elem),
    NextAccSum #= AccSum + Elem,
    NextIndex is StartIndex + Size + 1,
    restrict_diag_sum_(List,NextIndex,NextAccSum,Sum,Size).

restrict_diag_sum(List,Index,Size,Sum) :-
    restrict_diag_sum_(List,Index,0,Sum,Size).


restrict_diag2_sum_(_,Index,AccSum,Sum,Size) :- 
    Len is Size * Size - 2,
    Index > Len,
    AccSum #= Sum.

restrict_diag2_sum_(List,StartIndex,AccSum,Sum,Size) :-
    nth1(StartIndex,List,Elem),
    NextAccSum #= AccSum + Elem,
    NextIndex is StartIndex + Size - 1,
    restrict_diag2_sum_(List,NextIndex,NextAccSum,Sum,Size).

restrict_diag2_sum(List,Index,Size,Sum) :-
    restrict_diag2_sum_(List,Index,0,Sum,Size).

magic(Size,Res) :-
    Len is Size * Size,
    length(Res, Len),
    domain(Res,1,Len),
    all_distinct(Res),

    restrict_row_sum(Res,0,Size,Sum),
    restrict_col_sum(Res,0,Size,Sum),
    restrict_diag_sum(Res,0,Size,Sum),
    restrict_diag2_sum(Res,Size,Size,Sum),

    write('labeling'), nl,
    labeling([],Res),
    display_square(Res,Size).

    

    
    
    
