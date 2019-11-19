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

% mem(+Elem,List) - true if Elem is a member of list
mem(Elem,[Elem|_]).
mem(Elem,[_|T]) :- mem(Elem,T).

% ==================================================
patientJuri_(Juri,Vis,Count) :-
    performance(Elem,List),
    \+ mem(Elem,Vis),
    nt(List,Juri,Time),
    Time = 120,
    NCount is Count + 1,
    patientJuri_(Juri,[Elem|Vis],NCount).

patientJuri_(_,Vis,Count) :- 
    performance(Elem,List),
    mem(Elem,Vis),
    Count >= 2.
    
patientJuri(Juri) :- patientJuri_(Juri,[],0).
    


