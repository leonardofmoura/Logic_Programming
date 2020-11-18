:-use_module(library(clpfd)).


conselho(x,120,410).
conselho(y,10,800).
conselho(z,543,2387).
conselho(w,3,38).
conselho(k,234,376).

restrict_elem([],_,[]).

restrict_elem([H|T],Elements,[V|Res]) :-
    element(H,Elements,V),
    restrict_elem(T,Elements,Res).
    

unifyIndexes([],_,[]).

unifyIndexes([H|T],Elements,[Val|Res]) :-
    nth1(H,Elements,Val),
    unifyIndexes(T,Elements,Res).

conselhos(0,_,_,_,_) :- fail, !.

conselhos(NDias,MaxDist,ConselhosVisitados,DistTotal,TotalEleitores) :-
    length(IndexConselhos,NDias),

    findall(Conselho,conselho(Conselho,_,_),Conselhos),
    findall(Dist,conselho(_,Dist,_),Distancias),
    findall(Indeciso,conselho(_,_,Indeciso),Indecisos),

    all_distinct(IndexConselhos),

    restrict_elem(IndexConselhos,Distancias,ListDist),
    sum(ListDist,#=,DistTotal),
    DistTotal #< MaxDist,

    restrict_elem(IndexConselhos,Indecisos,ListIndecisos),
    sum(ListIndecisos,#=,TotalEleitores),

    labeling([maximize(TotalEleitores)],IndexConselhos),
    unifyIndexes(IndexConselhos,Conselhos,ConselhosVisitados).

conselhos(NDias,MaxDist,ConselhosVisitados,DistTotal,TotalEleitores) :-
    NextD is NDias - 1,
    conselhos(NextD,MaxDist,ConselhosVisitados,DistTotal,TotalEleitores).
    


    
