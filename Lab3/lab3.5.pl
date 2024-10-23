/*******************************************************************************

3.5 Define the split/3 predicate, which divides the list L into two parts L1
    and L2 of approximately equal length (with an accuracy of one element).

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

split(L, L1, L2) :-
  length(L, Len),
  Len1 is Len div 2,
  take(Len1, L, L1),
  drop(Len1, L, L2).

/*

1 ?- split([1,2,3], L1, L2).
L1 = [1],
L2 = [2, 3].

2 ?- split([1,2,3,4,5,6], L1, L2).
L1 = [1, 2, 3],
L2 = [4, 5, 6].

3 ?- split([1], L1, L2).
L1 = [],
L2 = [1].

4 ?- split([], L1, L2).
L1 = L2, L2 = [].

*/
