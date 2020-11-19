:- use_module(library(lists)).

generate_line_(L,L,0) :- !.
generate_line_(L,Aux,Len) :-
    Next is Len - 1,
    generate_line_(L,[' '|Aux],Next).

% generate_line/2
% generate line of ' ' with length Len
generate_line(L,Len) :-
    generate_line_(L,[],Len).


empty_board_(B,_,B,0) :- !.
empty_board_(B,Line,Aux,Len) :-
    Next is Len -1,
    empty_board_(B,Line,[Line|Aux],Next).

% empty_board/2
% create empty board of order Len
empty_board(B,Len) :-
    generate_line(L,Len),
    empty_board_(B,L,[],Len).


replaceN_([],_,_,Aux,Res) :- reverse(Aux, Res).
replaceN_([_|T],0,NewElem,Aux,Res) :-
    replaceN_(T,-1,NewElem,[NewElem|Aux],Res), !.
replaceN_([H|T],N,NewElem,Aux,Res) :-
    Next is N - 1,
    replaceN_(T,Next,NewElem,[H|Aux],Res).

% replaceN/4
% replace Nth element with NewElem
replaceN(List,N,NewElem,Res) :-
    length(List, Len),
    N =< Len,
    replaceN_(List,N,NewElem,[],Res).

% process_board/3
% turn coordinate list of points into board for display
process_board(NewBoard,[],NewBoard).
process_board(B,[X,Y|Tail],NewBoard) :-
    nth0(Y,B,Line),
    replaceN(Line,X,'X',NewLine),
    replaceN(B,Y,NewLine,TempNewBoard),
    process_board(TempNewBoard,Tail,NewBoard).

% write_separator/1
% write line separator for board display
write_separator(0) :- write('+'),!, nl.
write_separator(Len) :-
    write('+---'),
    Next is Len - 1,
    write_separator(Next).

% display_board(+Board)
% display Board on the screen
display_board(B) :- 
    length(B, Len),
	display_board(B,Len), !.
display_board([L|T],Len) :- 
	Len >= 0,
	write_separator(Len),
	draw_line(L), nl,
	display_board(T,Len).
display_board([],Len) :- write_separator(Len).

% display_line(+Line)
% display single line
draw_line(Line) :-
    write('| '),
    draw_line_(Line).
draw_line_([]) :- !.
draw_line_([' '|T]) :-  
    write('  | '),
	draw_line_(T).
draw_line_([H|T]) :- 
    write(H),
    write(' | '),
	draw_line_(T).

%display(+Sol)
%Displays a board aconrdig to the solution given
display_gap(Sol,Len) :-
    empty_board(B,Len),
    process_board(B,Sol,NewBoard),
    display_board(NewBoard).
