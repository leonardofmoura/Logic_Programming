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

len_([],Acc,Acc).
len_([_|T],Acc,Len) :-
    Nacc is Acc + 1,
    len_(T,Nacc,Len). 

len(List,Len) :- len_(List,0,Len).

% ===============================================

% nocliks(+Participant) - true if Participant had no clicks in it's performance
noclicks_([]).
noclicks_([120|T]) :- noclicks_(T).
noclicks_([H|_]) :- H \= 120, fail.

noclicks(P) :-
    performance(P,Times),
    noclicks_(Times).

nSuccessfulParticipants(T) :- 
    findall(X,(performance(X,_),noclicks(X)),L),
    len(L,T).