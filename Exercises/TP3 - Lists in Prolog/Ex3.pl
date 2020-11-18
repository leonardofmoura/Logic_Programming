% Append predicate -> L is de concatenation of L1 and L2

append_([],L,L).

append_([X|L1],L2,[X|L]) :- append_(L1,L2,L).