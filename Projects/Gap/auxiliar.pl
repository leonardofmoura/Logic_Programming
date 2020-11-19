/**	PLOG 2019/2020
 *	Joao Campos e Leonardo Moura
 *	Gap puzzle
 *	Two shaded squares in every row and column
 *	Shaded squares do not touch, even at corners.
 *
 *	Auxiliar file
 */

% restrict_two/2
% restrict number of duplicates of each number to 2
restrict_two(Sol,0) :- count(0,Sol,#=,2).
restrict_two(Sol,S) :-
	count(S,Sol,#=,2),
	Next is S-1,
	restrict_two(Sol,Next).

restrict_next_pair([],_,_).
restrict_next_pair([HX,HY|T],X,Y) :-
	#\((HX #= X + 1) #/\ (HY #= Y + 1)),
	#\((HX #= X + 1) #/\ (HY #= Y - 1)),
	#\((HX #= X - 1) #/\ (HY #= Y + 1)),
	#\((HX #= X - 1) #/\ (HY #= Y - 1)),
	#\((HX #= X + 1) #/\ (HY #= Y)),
	#\((HX #= X - 1) #/\ (HY #= Y)),
	#\((HX #= X) #/\ (HY #= Y - 1)),
	#\((HX #= X) #/\ (HY #= Y + 1)),
	#\((HX #= X) #/\ (HY #= Y)),
	restrict_next_pair(T,X,Y).

restrict_next_(_,[]).
restrict_next_(Prev,[X,Y|T]) :-
	append(Prev,T,L),
	restrict_next_pair(L,X,Y),
	append(Prev,[X,Y],Next),
	restrict_next_(Next,T).

% restrict_next/1
% restrict coordinates so 2 points do not touch
restrict_next(List) :-
	restrict_next_([],List).

extractX_([],Res,Res).
extractX_([X,_|T],Acc,Res) :- extractX_(T,[X|Acc],Res).

% extractX/2
% extract every second element starting from first
extractX(List,Pairs) :- extractX_(List,[],Pairs).

extractY_([],Res,Res).
extractY_([_,Y|T],Acc,Res) :- extractY_(T,[Y|Acc],Res).

% extractY/2
% extract every second element
extractY(List,Pairs) :-
	extractY_(List,[],Pairs).

% crescent_order/1
% order coordinates in list
crescent_order([_,_]).
crescent_order([X1,Y1,X2,Y2|T]) :-
	X1 #>= X2,
	#\((X1 #= X2) #<=> (Y1 #> Y2)),
	crescent_order([X2,Y2|T]).
crescent_order([H1,H2|T]) :-
	H1 #>= H2,
	crescent_order([H2|T]).

% selRandom/4
% select random value for labeling
selRandom(Var, Rest, BB0, BB1):- % seleciona valor de forma aleatória
   fd_set(Var, Set), fdset_to_list(Set, List),
   random_member(Value, List), % da library(random)
   ( first_bound(BB0, BB1), Var #= Value ;
   later_bound(BB0, BB1), Var #\= Value ).
