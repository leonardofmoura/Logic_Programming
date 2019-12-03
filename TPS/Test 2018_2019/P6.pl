airport('Aeroporto Francisco Sá Carneiro', 'LPPR', 'Portugal').
airport('Aeroporto Humberto Delgado', 'LPPT', 'Portugal').
airport('Aeropuerto Adolfo Suárez Madrid-Barajas', 'LEMD', 'Spain').
airport('Aéroport de Paris-Charles-de-Gaulie Roissy Airport', 'LFPG', 'France').
airport('Aeroporto Internazionale di Roma-Fiumicino - Leonardo da Vinci', 'LIRF', 'Italy').

company('TAP', 'TAP Air Portugal', 1945, 'Portugal').
company('RYR', 'Ryanair', 1984, 'Ireland').
company('AFR', 'Société Air France, S.A.', 1933, 'France').
company('BAW', 'British Airways', 1974, 'United Kingdom').

flight('TP1923', 'LPPR', 'LPPT', 1115, 55, 'TAP').
flight('TP1968', 'LPPT', 'LPPR', 2235, 55, 'TAP').
flight('TP842', 'LPPT', 'LIRF', 1450, 195, 'TAP').
flight('TP843', 'LIRF', 'LPPT', 1935, 195, 'TAP').
flight('TP5483', 'LPPR', 'LEMD', 630, 105, 'RYR').
flight('FR5484', 'LEMD', 'LPPR', 1935, 105, 'RYR').
flight('AF1024', 'LFPG', 'LPPT', 940, 155, 'AFR').
flight('AF1025', 'LPPT', 'LFPG', 1310, 155, 'AFR').

%================================================================================================

convTimeH(Hours,TMin) :-
    Hour is Hours // 100,
    HourMin is Hour * 60,
    Min is mod(Hours,100),
    TMin is HourMin + Min.
    write(TMin).

convTimeM(TMin,Hours) :-
    FHours is TMin // 60,
    HoursM is FHours * 100,
    Mins is round((((TMin / 60) - FHours) * 60)),
    Hours is HoursM + Mins.  
     
arrivalTime(F,At) :-
    flight(F,_,_,DepTime,Dur,_),
    convTimeH(DepTime,Time),
    Mint is Time + Dur,
    convTimeM(Mint,At).

% Note: exercise not complete

tr_([],_,Acc,Acc,N,N).

tr_([From,To|T],Time,Acc,L,N,FinalN) :-
    airport(_,Idf,From),
    airport(_,Idt,To),
    flight(F,Idf,Idt,DepTime,_,_),
    DepTime >= Time,
    arrivalTime(F,At),
    convTimeH(At,AtToS),
    MinTime is AtToS + 30,
    convTimeM(MinTime,MinTimeH), 
    MinTimeH < 2400,
    tr_([To|T],MinTimeH,[F|Acc],L,NFinalN).

tr_([From,To|T],Time,Acc,L,N,FinalN) :-
    airport(_,Idf,From),
    airport(_,Idt,To),
    flight(F,Idf,Idt,DepTime,_,_),
    DepTime < Time,
    NextDay is Day + 1, 
    arrivalTime(F,At),
    convTimeH(At,AtToS),
    MinTime is AtToS + 30,
    convTimeM(MinTime,MinTimeH), 
    MinTimeH < 2400,
    tr_([To|T],MinTimeH,[F|Acc],L,NextDay,FinalN).

tr_([From,To|T],Time,Acc,L,N,FinalN) :-
    airport(_,Idf,From),
    airport(_,Idt,To),
    flight(F,Idf,Idt,DepTime,_,_),
    DepTime >= Time,
    arrivalTime(F,At),
    convTimeH(At,AtToS),
    MinTime is AtToS + 30,
    convTimeM(MinTime,MinTimeH), 
    MinTimeH >= 2400,
    NextDay is N + 1,
    StartTime is MinTimeH - 2400,
    tr_([To|T],MinTimeH,[F|Acc],L,NextDay,FinalN).

tr_([From,To|T],Time,Acc,L,N,FinalN) :-
    airport(_,Idf,From),
    airport(_,Idt,To),
    flight(F,Idf,Idt,DepTime,_,_),
    DepTime < Time,
    NextDay is N + 1,
    arrivalTime(F,At),
    convTimeH(At,AtToS),
    MinTime is AtToS + 30,
    convTimeM(MinTime,MinTimeH), 
    MinTimeH >= 2400,
    NextDayN is NextDayN + 1,
    StartTime is MinTimeH - 2400,
    tr_([To|T],MinTimeH,[F|Acc],L,NextDayN,FinalN).

tripDays(List,Time,L,N) :- tr_(List,Time,[],L,0,N).
