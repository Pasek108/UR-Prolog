/*******************************************************************************

3.3 Define the init/2 predicate that retrieves all elements from the list L 
    except the last one. The first argument of the predicate is the input list 
    and the second argument is the result. Give two definitions of this 
    predicate:

    - using the reverse predicate;
    - using the take predicate.

*******************************************************************************/

init(L, I) :-
  reverse(L, [_|T]),
  reverse(T, I).

/*

5 ?- init([a,b,c], I).
I = [a, b].

6 ?- init([a], I).
I = [].

7 ?- init([], I).
false.

*/

init2(L, I) :-
  reverse(L, R),
  R = [_|T],
  reverse(T, I).

/*

1 ?- init2([a,b,c], I).
I = [a, b].

2 ?- init2([a], I).
I = [].

3 ?- init2([], I).
false.

*/

take(_, [], []) :- !.
take(0,  _, []) :- !.
take(N, [H|T], [H|L]) :-
  M is N - 1,
  take(M, T, L).

init3(L, I) :-
  length(L, Len),
  N is Len - 1,
  take(N, L, I).

/*

3 ?- init3([a,b,c], I).
I = [a, b].

4 ?- init3([a], I).
I = [].

5 ?- init3([], I).
I = [].

*/
