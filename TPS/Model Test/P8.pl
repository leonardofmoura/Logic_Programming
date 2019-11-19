:- use_module(library(lists)).

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


made_times([]) :- fail.

made_times([H|_]) :- H = 120. 

% made_times(+Times) - true if one of the members of the list is 120
made_times([_|T]) :- made_times(T).

% madeItThrough(+Participant)
madeItThrough(P) :-
    performance(P,Times),
    made_times(Times).

%===================================================0
eligibleOutcome(Id,Perf,TT) :-
    performance(Id,Times),
    madeItThrough(Id),
    participant(Id,_,Perf),
    sumlist(Times,TT).

untilElem([],_,_,_) :- fail.
untilElem(_,0,Acc,NList) :- reverse(Acc,NList).
untilElem([H|T],Index,Acc,Nlist) :-
    N is Index - 1,
    untilElem(T,N,[H|Acc],Nlist).

nextPhase(Num,P) :- 
    setof(TT-Id-Per,(eligibleOutcome(Id,Per,TT)),L),
    reverse(L, Nl),
    untilElem(Nl,Num,[],P).

len_([],Acc,Acc).
len_([_|T],Acc,Len) :-
    Nacc is Acc + 1,
    len_(T,Nacc,Len). 