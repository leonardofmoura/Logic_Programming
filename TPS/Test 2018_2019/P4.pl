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

countries_(Comp,VisF,Acc,List) :-
    flight(Flight,Airport1,Airport2,_,_,Comp),
    \+ member(Flight, VisF),
    airport(_,Airport1,Country1),
    airport(_,Airport2,Country2),
    \+ member(Country2,Acc),
    \+ member(Country1,Acc),
    Country1 \= Country2,
    countries_(Comp,[Flight|VisF],[Country1,Country2|Acc],List).

countries_(Comp,VisF,Acc,List) :-
    flight(Flight,Airport1,Airport2,_,_,Comp),
    \+ member(Flight, VisF),
    airport(_,Airport1,Country1),
    airport(_,Airport2,Country2),
    \+ member(Country2,Acc),
    \+ member(Country1,Acc),
    Country1 == Country2,
    countries_(Comp,[Flight|VisF],[Country1|Acc],List).

countries_(Comp,VisF,Acc,List) :-
    flight(Flight,Airport1,Airport2,_,_,Comp),
    \+ member(Flight, VisF),
    airport(_,Airport1,Country1),
    airport(_,Airport2,Country2),
    member(Country2,Acc),
    \+ member(Country1,Acc),
    countries_(Comp,[Flight|VisF],[Country1|Acc],List).

countries_(Comp,VisF,Acc,List) :-
    flight(Flight,Airport1,Airport2,_,_,Comp),
    \+ member(Flight, VisF),
    airport(_,Airport1,Country1),
    airport(_,Airport2,Country2),
    \+ member(Country2,Acc),
    member(Country1,Acc),
    countries_(Comp,[Flight|VisF],[Country2|Acc],List).


countries(Comp,List) :- countries_(Comp,[],[],List).
