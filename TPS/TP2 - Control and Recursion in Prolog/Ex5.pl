%Function to calculate fibonacci numbers

%Base cases
fibonacci(0,0).
fibonacci(1,1).

%Recursive step
fibonacci(Number,Valor) :-
    Number > 1,
    Prev is Number-1,
    Prev2 is Number-2,
    fibonacci(Prev,Res1),
    fibonacci(Prev2,Res2),
    Valor is Res1 + Res2.