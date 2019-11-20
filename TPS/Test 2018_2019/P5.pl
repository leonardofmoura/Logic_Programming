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

pairs(Acc,List) :-
    flight(F1,_,To1,_,_,_),
    flight(F2,To1,_,DepTime2,_,_),
    arrivalTime(F1,ArrTime1),
    \+ member(([F1,F2]),Acc),
    convTimeH(ArrTime1,ArrTime1H),
    convTimeH(DepTime2,DepTime2H),
    Diff is abs(DepTime2H - ArrTime1H),
    Diff >= 30,
    Diff =< 90, 
    pairs([[F1,F2]|Acc],List).

pairs(Acc,Acc) :-
    flight(F1,_,To1,_,_,_),
    flight(F2,To1,_,_,_,_),
    member([F1,F2],Acc).

print_([]).

print_([[F1,F2]|T]) :-
    flight(F1,_,To1,_,_,_),
    write(To1), write(' - '), write(F1), write(' \\ '), write(F2), nl,
    print_(T).


pairableFlights :- \+ pairs([],List).

pairableFlights :- pairs([],List),print_(List).
