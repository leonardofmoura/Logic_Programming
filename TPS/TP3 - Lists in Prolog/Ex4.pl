
invert([],L,L).

invert([Elem|T],L2,R) :- invert(T,[Elem|L2],R). 

invert(L1,L) :- invert(L1,[],L).