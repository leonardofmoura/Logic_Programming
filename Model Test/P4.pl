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

% ===============================================
getTime_([],Acc,Acc).
getTime_([H|T],CountAcc,Count) :-
    NextCount is CountAcc + H, 
    getTime_(T,NextCount,Count).

% getTime(+Participant, -Time) - Time is the total time of the participant 
getTime(P,Time) :-
    performance(P,T),
    getTime_(T,0,Time).

bestParticipant(P1,P2,Z) :-
    getTime(P1,T1),
    getTime(P2,T2),
    T1 > T2, 
    Z = P1.

bestParticipant(P1,P2,Z) :-
    getTime(P1,T1),
    getTime(P2,T2),
    T2 > T1, 
    Z = P2.

bestParticipant(P1,P2,Z) :-
    getTime(P1,T1),
    getTime(P2,T2),
    T2 = T1, 
    fail.
