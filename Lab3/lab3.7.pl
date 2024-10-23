/*******************************************************************************

3.7 Define the middle/3 predicate that retrieves all elements from the list L, 
    excluding the first N and the last N. The first argument of the predicate 
    is the number of elements cut off on each side of the list, the second is 
    the input list, and the third is the result.

Note: You can cut off elements from a list if its length is greater than 2 * N. 
      Otherwise, the result is an empty list.

You should use the take/2 and drop/2 predicates

*******************************************************************************/

take(_, [], []) :- !.
take(0,  _, []) :- !.
take(N, [H|T], [H|L]) :-
  M is N - 1,
  take(M, T, L).
  
drop(_, [], []) :- !.
drop(0,  R,  R) :- !.
drop(N, [_|T], L) :-
  M is N - 1,
  drop(M, T, L).

middle(_, [], []) :- !.
middle(0, X, X) :- !.
middle(N, L, R) :-
  drop(N, L, L1),
  reverse(L1, L2),
  drop(N, L2, L3),
  reverse(L3, R).

/*

1 ?- middle(0, [1,2,3], R).
R = [1, 2, 3].

2 ?- middle(0, [], R).
R = [].

3 ?- middle(2, [], R).
R = [].

4 ?- middle(1, [1,2,3], R).
R = [2].

5 ?- middle(2, [1,2,3], R).
R = [].

6 ?- middle(2, [1,2,3,4,5,6], R).
R = [3, 4].

*/
