/*******************************************************************************

3.1 Define the take/3 predicate that takes the initial N elements from the list. 
    Arguments:

    - natural number
    - starting list
    - result list

Note: There are two postconditions to consider: retrieving from an empty list 
      and retrieving "0" elements.

*******************************************************************************/

take(_, [], []) :- !.
take(0,  _, []) :- !.
take(N, [H|T], [H|L]) :-
  M is N - 1,
  take(M, T, L).

/*

1 ?- take(3, [], R).
R = [].

2 ?- take(0, [1,2,3], R).
R = [].

3 ?- take(2, [1,2,3], R).
R = [1, 2].

4 ?- take(5, [1,2,3], R).
R = [1, 2, 3].

5 ?- take(2, [a,b,c,d], R).
R = [a, b].

*/
