/*******************************************************************************

2.8 Write a program in Prolog to solve the following problem: 
    In a three-digit number, the tens digit and the ones digit are changed, 
    thus creating a new three-digit number. The sum of both numbers is 1187. 
    Find these numbers. Is the solution clear?

*******************************************************************************/

num([A2, A1, A0], [B2, B1, B0]) :-
  between(0, 9, A2), 
  between(0, 9, A1),
  between(0, 9, A0),
  between(0, 9, B2),
  between(0, 9, B1),
  between(0, 9, B0),
  A2 =:= B2,
  A1 =:= B0,
  A0 =:= B1,
  N1 is 100*A2 + 10*A1 + 1*A0,
  N2 is 100*B2 + 10*B1 + 1*B0,
  SUM is N1 + N2,
  SUM =:= 1187.

/*

1 ?- num([A2, A1, A0], [B2, B1, B0]).
A2 = B2, B2 = 5,
A1 = B0, B0 = 8,
A0 = B1, B1 = 9 ;
A2 = B2, B2 = 5,
A1 = B0, B0 = 9,
A0 = B1, B1 = 8 ;
false.

*/

num2(A, B) :-
  between(100, 999, A),
  between(100, 999, B),
  SUM is A + B,
  SUM =:= 1187,
  A0 is A mod 10,
  A1 is (A mod 100) div 10,
  A2 is A div 100,
  B0 is B mod 10,
  B1 is (B mod 100) div 10,
  B2 is B div 100,
  A2 =:= B2,
  A1 =:= B0,
  A0 =:= B1.

/*

5 ?- num2(A, B).
A = 589,
B = 598 ;
A = 598,
B = 589 ;
false.

*/
