%participant(Id,Age,Performance)
participant(1234, 17, 'Pé coxinho').
participant(3423, 21, 'Programar com os pés').
participant(3788, 20, 'Sing a Bit').
participant(4865, 22, 'Pontes de esparguete').
participant(8937, 19, 'Pontes de pen-drives').
participant(2564, 20, 'Moodle hack').


%performance(Id,Times)
performance(1234,[120,120,120,120]).
performance(3423,[32,120,45,120]).
performance(3788,[110,2,6,43]).
performance(4865,[120,120,110,120]).
performance(8937,[97,101,105,110]).

% rev(+List, -RevList) - RevList is the reverse of List
rev_([],Acc,Acc).
rev_([H|T],Acc,RevList) :- rev_(T,[H|Acc],RevList).

rev(List,RevList) :- rev_(List,[],RevList).

%===================================================0
np([],_,Acc,Final) :- rev(Acc, Final).

np([H|T],Curr,Npl,Final) :-
    H \= 120, 
    np(T,Curr,Npl,Final).

np([120|T],Curr,NpL,Final) :- 
    Next is Curr + 1,
    np(T,Next,[Curr|NpL],Final).

noPressed(P,Juri) :-
    performance(P,Times),
    np(Times,1,[],Juri).

juriFans(L) :- findall(P-Juri,(performance(P,_),noPressed(P,Juri)),L).
