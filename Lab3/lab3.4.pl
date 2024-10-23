/*******************************************************************************

3.4 Define the middle/2 predicate that retrieves all elements from the list L 
    except the first and last. The first argument of the predicate is the input 
    list and the second argument is the result.

*******************************************************************************/

init(L, I) :-
  reverse(L, [_|T]),
  reverse(T, I).

middle([_|T] ,M) :-
  init(T, M).

/*

1 ?- middle([a,b,c,d], X).
X = [b, c].

2 ?- middle([a,b,c], X).
X = [b].

3 ?- middle([], X).
false.

*/

middle2(L, M) :-
  L = [_|T],
  init(T, M).

/*

4 ?- middle2([a,b,c,d], X).
X = [b, c].

5 ?- middle2([a,b,c], X).
X = [b].

6 ?- middle2([], X).
false.

*/
