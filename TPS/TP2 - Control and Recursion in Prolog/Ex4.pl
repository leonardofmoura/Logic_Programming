%Factorial calculation funciton

% Base case
factorial(0,1).

% Recursive step
factorial(N,Valor) :-
    N > 0,
    Prev is N-1,
    factorial(Prev,Res),
    Valor is Res*N.
