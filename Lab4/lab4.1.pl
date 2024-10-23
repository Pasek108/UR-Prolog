/*******************************************************************************

4.1 Write a program to determine the 9-digit combination for a safe. The 
    following tips are given:

    the first digit is the sum of the fourth and fifth,
    the second digit is the double sixth,
    the third digit is not divisible by 5,
    the fourth digit is only divisible by 1,
    the sixth digit is 2 less than the eighth,
    the seventh digit is divisible by 3,
    the eighth digit is double the first,
    the ninth digit is one less than the eighth,
    the code does not contain the numbers 0 and 9.

Is the solution clear? If not, modify the code predicate so that all possible 
solutions are displayed.

*******************************************************************************/

password([D1, D2, D3, D4, D5, D6, D7, D8, D9]) :-
  between(1, 8, D1),
  between(1, 8, D2),
  between(1, 8, D3),
  between(1, 8, D4),
  between(1, 8, D5),
  between(1, 8, D6),
  between(1, 8, D7),
  between(1, 8, D8),
  between(1, 8, D9),

  D1 =:= D4 + D5,
  D2 =:= 2 * D6,
  D3 mod 5 =\= 0,
  D4 =:= 1,
  D6 =:= D8 - 2,
  D7 mod 3 =:= 0,
  D8 =:= 2 * D1,
  D9 =:= D8 - 1,

  write(D1), write(D2), write(D3), write(D4), write(D5), write(D6), write(D7), write(D8), writeln(D9),
  fail.


/*

1 ?- password([D1, D2, D3, D4, D5, D6, D7, D8, D9]).
241112343
241112643
242112343
242112643
243112343
243112643
244112343
244112643
246112343
246112643
247112343
247112643
248112343
248112643
381124365
381124665
382124365
382124665
383124365
383124665
384124365
384124665
386124365
386124665
387124365
387124665
388124365
388124665
false.

*/
