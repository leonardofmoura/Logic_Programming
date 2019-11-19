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

% nt(+List,+Num,-Elem) - Returns the nth element of a list
nt([H|_],1,H).

nt([_|T],Num,Elem) :- 
    Inv is Num - 1,
    nt(T,Inv,Elem).

% rev(+List, -RevList) - RevList is the reverse of List
rev_([],Acc,Acc).
rev_([H|T],Acc,RevList) :- rev_(T,[H|Acc],RevList).

rev(List,RevList) :- rev_(List,[],RevList).

% ========================================================
juriTimes_([],_,TimesAcc,Times,TotalAcc,TotalAcc) :- rev(TimesAcc,Times).

juriTimes_([Participant|Rest],Juri,TimesAcc,Times,TotalAcc,Total) :-
    performance(Participant,J),
    nt(J,Juri,T),
    NextTime is TotalAcc + T, 
    juriTimes_(Rest,Juri,[T|TimesAcc],Times,NextTime,Total).

juriTimes(Participants,Juri,Times,Total) :- juriTimes_(Participants,Juri,[],Times,0,Total).
