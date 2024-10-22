/*******************************************************************************

2.6 Define the recursive predicate seq/2, which determines the value of the nth 
    term of a numerical sequence defined as follows:

    seq_1 = 3
    seq_2 = 4
    seq_n = seq_n-1 + 3*seq_n-2, for n > 2

*******************************************************************************/

seq(2, R) :- R = 4, !.
seq(1, R) :- R = 3, !.
seq(N, R) :-
    N1 is N - 1,
    N2 is N - 2,
    seq(N1, R1),
    seq(N2, R2),
    R3 is (3 * R2),
    R is R1 + R3, !.

/*

1 ?- seq(1, R).
R = 3.

2 ?- seq(2, R).
R = 4.

3 ?- seq(3, R).
R = 13.

4 ?- seq(4, R).
R = 25.

*/
