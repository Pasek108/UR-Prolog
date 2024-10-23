/*******************************************************************************

Task 4 Group 1

Define the predicate middle(N, X, Y) that takes z list X all elements, omitting 
the first N and N last (Y is the resulting list). You can cut off elements from 
a list if its length is greater than 2*N. Otherwisethe result is an empty list. 
You can use in your code predicates take and drop.

*******************************************************************************/

middle(_, [], []) :- !.
middle(0, X, X) :- !.
middle(N, [_|T], Y) :-
    reverse(T, [_|R]),
    reverse(R, I),
    M is N - 1,
    middle(M, I, Y).

/*

?- middle(1, [a, b, c, d], Y).
Y = [b, c].

*/

/*******************************************************************************

Task 4 Group 2

Define the predicate maxList(X,Y), determining the maximum value in the list X 
(Y is the maximum value). The predicate is supposed to work for non-empty lists.

*******************************************************************************/

maxList([], Y) :- writeln(Y), fail.
maxList([H|T], Y) :- 
    H > Y,
    maxList(T, H).
maxList([H|T], Y) :- 
    H < Y,
    maxList(T, Y).
maxList([H|T], Y) :- 
    H =:= Y,
    maxList(T, Y).

/*

?- maxList([1, 4, 6, 2], 0).
6
false.

*/
