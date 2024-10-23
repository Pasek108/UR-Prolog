/*******************************************************************************

3.6 Define the permutation/2 predicate and analyze its behavior. Test the 
    operation of the predicate with examples.

% permutation(P, L) - P is a permutation of the list L
 
permutation([], []).
 
permutation(P, [H|T]) :-
    permutation(P1, T),
    append(A, B, P1),      % P1 is divided into two parts
    append(A, [H|B], P).   %P is formed by insertion 
                           % of the H element to a certain place in the P1 list

*******************************************************************************/

permutation([], []).
permutation(P, [H|T]) :-
    permutation(P1, T),
    append(A, B, P1),      % P1 is divided into two parts
    append(A, [H|B], P).   % P is formed by insertion 
                           % of the H element to a certain place in the P1 list

/*

1 ?- permutation(P, []).
P = [].

2 ?- permutation(P, [1]).
P = [1] ;
false.

3 ?- permutation(P, [1,2,3]).
P = [1, 2, 3] ;
P = [2, 1, 3] ;
P = [2, 3, 1] ;
P = [1, 3, 2] ;
P = [3, 1, 2] ;
P = [3, 2, 1] ;
false.

*/
