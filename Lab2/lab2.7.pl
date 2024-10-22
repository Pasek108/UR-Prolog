/*******************************************************************************

2.7 Write a Prolog program to solve the following puzzle: 
    There are gold coins in the chest. There are less than 100 of them. If they 
    are taken out after 3, there will be 1 left in the chest. If they are taken 
    out after 4, there will be 2 left in the chest. If they are taken out after 
    5, there will be 3 left in the chest. If they are taken out after 6, then 
    in There will be 4 left in the chest. How many coins are in the chest?

Hint:

num(X) :-
  between(100, 999, X),
  X mod 3 =:= 0,
  X mod 5 =:= 0,
  X mod 7 =:= 0.

*******************************************************************************/

coins(X) :-
  between(0, 100, X),
  X mod 3 =:= 1,
  X mod 4 =:= 2,
  X mod 5 =:= 3,
  X mod 6 =:= 4.

/*

1 ?- coins(X).
X = 58 ;
false.

*/
