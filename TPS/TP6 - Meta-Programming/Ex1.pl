map([],_,[]).
map([LiH|LiT],Pred,[ResH|ResT]) :- 
    apply(Pred,[LiH,ResH]),
    map(LiT,Pred,ResT).

apply(OP,Args) :- ExecOP =.. [OP|Args], ExecOP.