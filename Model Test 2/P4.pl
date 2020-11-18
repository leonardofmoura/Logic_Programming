:- use_module(library(clpfd)).


restrict_elems([],_,[]).

restrict_elems([H|T],ElementList,[V|RetList]) :-
    element(H,ElementList, V),
    restrict_elems(T,ElementList,RetList).
    

constroi(NEmb,Orcamento,EmPorObjeto,CustoPorObjeto,EmbUsadas,Objetos) :-
    length(EmPorObjeto,Len),
    length(CustoPorObjeto,Len),

    length(Objetos,4),
    
    domain(Objetos,1,Len),
    all_distinct(Objetos),
    
    restrict_elems(Objetos,CustoPorObjeto,Custos),
    sum(Custos,#=<,Orcamento),

    restrict_elems(Objetos,EmPorObjeto,Embalagens),
    sum(Embalagens,#=,EmbUsadas),
    EmbUsadas #=< NEmb,

    write(labeling),
    labeling([maximize(EmbUsadas)],Objetos).






    
