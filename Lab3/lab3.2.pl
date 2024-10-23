/*******************************************************************************

3.2 Define the drop/3 predicate that removes the initial N elements from the 
    list. Arguments:

    - natural number
    - starting list
    - result list

Note: There are two postconditions to consider: deleting from an empty list and 
      deleting "0" items.

*******************************************************************************/

drop(_, [], []) :- !.
drop(0,  R,  R) :- !.
drop(N, [_|T], L) :-
  M is N - 1,
  drop(M, T, L).

/*

1 ?- drop(3, [], R).
R = [].

2 ?- drop(0, [1,2,3], R).
R = [1, 2, 3].

3 ?- drop(2, [1,2,3], R).
R = [3].

4 ?- drop(5, [1,2,3], R).
R = [].

5 ?- drop(2, [a,b,c,d], R).
R = [c, d].

*/
