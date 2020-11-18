:- use_module(library(clpfd)).


restrict_pairs(_,_,_,0,_).

restrict_pairs([M,W|T],MenH,WomanH,MaxLen,Delta) :-
    element(M,MenH,MenHeight),
    element(W,WomanH,WomanHeight),

    MenHeight #> WomanHeight,
    MenHeight - WomanHeight #>= Delta,

    NextLen is MaxLen - 1,
    restrict_pairs(T,MenH,WomanH,NextLen,Delta).
    

optimal_skating_pairs(MenHeights,WomanHeights,Delta,Pairs) :-
    length(MenHeights,MenLen),
    length(WomanHeights,WomanLen),

    minimum(MaxLen,[MenLen,WomanLen]),

    restrict_pairs(TempPairs,MenHeights,WomanHeights,MaxLen,Delta),

    length(TempPairs,PairLen),

    write(labeling),
    labeling([maximize(PairLen)],IncPairs),
    Pairs = IncPairs.    
    





    
    
    