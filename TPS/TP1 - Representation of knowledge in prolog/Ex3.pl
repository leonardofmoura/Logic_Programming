% Fact representation

book('Os Maias').
nationality('Eca de queiroz',portugues).
category('Os Maias',romance).
category('Os Maias',fiction).
author('Os Maias','Eca de queiroz').

% Author is portuguese and writes romances
portugueseWritesRomances(Author) :-
    nationality(Author,portugues),
    author(Book,Author),
    category(Book,romance).

fictionAuthorsWriteOthers(Author) :-
    author(Book,Author),
    category(Book,Cat),
    category(Book,fiction),
    Cat \= fiction.

/* Solutions
a) author('Os Maias',A).
b) portugueseWritesRomances(A).
c) fictionAuthorWritesOthers(A).
*/


