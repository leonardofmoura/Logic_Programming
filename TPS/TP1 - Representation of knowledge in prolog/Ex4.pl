% Data representation

food(frango).
food(peru).
food(salmao).
food(solha).

drink(cerveja).
drink(verde).
drink(maduro).

married(ana,bruno).
married(barbara,antonio).

matches(cerveja,salmao).
matches(verde,frango).
matches(solha,frango).

likes(ana,verde).
likes(bruno,verde).

marriedAndLike(P1,P2,Drink) :-
    married(P1,P2),
    likes(P1,Drink),
    likes(P2,Drink).

/* Answers
a) marriedAndLike(ana,bruno,verde).
b) mateches(Bebida,salmao).
c) 
*/