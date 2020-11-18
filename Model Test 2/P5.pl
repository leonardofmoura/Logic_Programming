:- use_module(library(clpfd)).

restrict_tasks_([],[],Acc,Tasks) :- reverse(Acc,Tasks).

restrict_tasks_([Presente|TP],[Rolo|TR],Acc,Tasks) :-
    restrict_tasks_(TP,TR,[task(0,1,1,Presente,Rolo)|Acc],Tasks).

restrict_tasks(Presentes,RolosSelecionados,Tasks) :-
    restrict_tasks_(Presentes,RolosSelecionados,[],Tasks).


restrict_machines_([],_,Acc,Maquinas) :- reverse(Acc,Maquinas).

restrict_machines_([H|T],Index,Acc,Maquinas) :-
    Next is Index + 1,
    restrict_machines_(T,Next,[machine(Index,H)|Acc],Maquinas).

restrict_machines(Rolos,Maquinas) :-
    restrict_machines_(Rolos,1,[],Maquinas).


embrulha(Rolos,Presentes,RolosSelecionados) :-
    length(Presentes,Len),
    length(RolosSelecionados,Len),
    length(Rolos,LenRolos),
    
    domain(RolosSelecionados,1,LenRolos),

    restrict_machines(Rolos,Maquinas),
    restrict_tasks(Presentes,RolosSelecionados,Tasks),

    cumulatives(Tasks,Maquinas,[bound(upper)]),

    write(labeling),
    labeling([],RolosSelecionados).
    
    





    