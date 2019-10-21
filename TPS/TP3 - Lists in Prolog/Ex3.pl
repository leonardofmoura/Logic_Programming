%Append predicate -> L is de concatenation of L1 and L2

append1(L,[],L).

append1(L1,[H2 | T2],L) :- append1([L1 | H2],T2,L).