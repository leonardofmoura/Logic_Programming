% test graph
connected(a,b).
connected(a,c).
connected(b,d).
connected(b,e).
connected(b,f).
connected(c,g).
connected(d,h).
connected(d,i).
connected(f,i).
connected(f,j).
connected(f,k).
connected(a,b).
connected(g,l).
connected(g,m).
connected(k,n).
connected(l,o).
connected(i,f).

% List functions
member_(X, [X|_]).
member_(X, [_|T]) :- member_(X,T).

append_([],L2,L2).
append_([H1|T1],L2, [H1|Tail]) :- append_(T1,L2,Tail).

reverse__([],Acc,Acc).
reverse__([H|T1],Acc,L2) :- reverse__(T1,[H|Acc],L2). 

reverse_(L1,L2) :- reverse__(L1,[],L2).

% queue functions
% empty_queue(+Queue) - True if queue is empty
empty_queue([]).

% queue_push(+Elem,+Queue, -NewQueue) - NewQueue is Queue with Elem pushed into it
queue_push(Elem,Q,NQ) :- append_(Q,[Elem],NQ).

% queue_push_list(+List, +Queue, -NewQueue) - NewQueue is Queue with List pushed into it
queue_push_list(Q,List,NQ) :- append_(Q,List,NQ).

% queue_head(+Queue, -Head) - Head is the head of Queue
queue_head([Head|_],Head).

% queue_pop(+Queue, -NewQueue, -Elem) - NewQueue is Queue with Elem removed from it
queue_pop([Elem|Tail],Tail,Elem).

% a)
% dfs(+Init, +Final, -Path).
dfs_(End,End,Acc,Path) :- reverse_([End|Acc],Path).
dfs_(Beg,End,Acc,Path) :-
    connected(Beg,Next),
    \+ member_(Next,Acc),
    dfs_(Next,End,[Beg|Acc],Path).

dfs(Beg,End,Path) :- dfs_(Beg,End,[],Path).

% b) This does not return a path between Start and End. It instead returns the breath first expansion until
% it finds the End node.
bfs_(_,[],_,_) :- fail.

bfs_(End,Acc,Queue,_,[End|Acc]) :- queue_pop(Queue,_,End).

bfs_(End,Acc,Queue,Discovered,Path) :-
    queue_pop(Queue,PopedQueue,Elem),
    NewDiscovered = [Elem|Discovered],
    findall(Node,(connected(Elem,Node), \+ member_(Node,NewDiscovered)),L),
    queue_push_list(PopedQueue,L,LastQueue),
    bfs_(End,[Elem|Acc],LastQueue,NewDiscovered,Path).

bfs(Start,End,Path) :- 
    bfs_(End,[],[Start],[],RevPath),
    reverse_(RevPath,Path).



