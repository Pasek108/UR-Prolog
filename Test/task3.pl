/*******************************************************************************

Task 3 Group 1

Write a program that allows you to determine product of 1 to 200 numbers of the
form 3/(i^2 + i).

*******************************************************************************/

iloczyn(1, Y) :- Y is 3 / 2, !.
iloczyn(I, Y) :-
    I1 is I - 1,
    iloczyn(I1, X),
    Y is X * (3 / (I * I + I)).

/*

?- iloczyn(200, Y).
Y = 0.0.

*/

/*******************************************************************************

Task 3 Group 2

Define the recursive predicate seq(N,X), determining the value of the Nth term 
of the numerical sequence defined as follows:

                          0: N = 1
                          2: N = 2
seq(N - 1) + 2 * seq(N - 2): N > 2

*******************************************************************************/

seq(1, 0) :- !.
seq(2, 2) :- !.
seq(N, X) :-
    N1 is N - 1,
    N2 is N - 2,
    seq(N1, X1),
    seq(N2, X2),
    X is X1 + 2 * X2.

/*

?- seq(1, X). 
X = 0.

?- seq(2, X).
X = 2.

?- seq(3, X). 
X = 2.

?- seq(4, X). 
X = 6.

?- seq(5, X). 
X = 10.

?- seq(6, X). 
X = 22.

*/
