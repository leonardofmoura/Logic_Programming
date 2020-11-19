/**	PLOG 2019/2020
 *	Joao Campos e Leonardo Moura
 *	Gap puzzle
 *	Two shaded squares in every row and column
 *	Shaded squares do not touch, even at corners.
 *
 *	Main file
 */

:-use_module(library(lists)).
:-use_module(library(clpfd)).
:-use_module(library(statistics)).
:-use_module(library(random)).
:-include('display.pl').
:-include('auxiliar.pl').

% gap/2
% gap(+S, -Points).
% find a solution to gap puzzle with order S
gap(S,Points) :-
	S < 15,
  	statistics(walltime, [Start,_]),
	Max is 4 * S,
	Dom is S -1,

	length(Points,Max),
	domain(Points,0,Dom),

	extractX(Points,XList),
	extractY(Points,YList),

	crescent_order(Points),

	restrict_two(XList,Dom),
	restrict_two(YList,Dom),

	restrict_next(Points),

	labeling([value(selRandom)],Points),
	statistics(walltime, [End,_]),

	display_gap(Points,S),
  	Time is End - Start,
	format('finished in ~3d seconds.~n', [Time]).

gap(S,Points) :-
	S >= 15,
  	statistics(walltime, [Start,_]),
	Max is 4 * S,
	Dom is S -1,

	length(Points,Max),
	domain(Points,0,Dom),

	extractX(Points,XList),
	extractY(Points,YList),

	restrict_two(XList,Dom),
	restrict_two(YList,Dom),

	restrict_next(Points),

	labeling([value(selRandom)],Points),
	statistics(walltime, [End,_]),

	display_gap(Points,S),
  	Time is End - Start,
	format('finished in ~3d seconds.~n', [Time]).
