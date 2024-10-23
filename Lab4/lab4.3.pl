/*******************************************************************************

4.3 Write a Prolog program to solve the following magic square. The square 
    should contain numbers from 2 to 17, entered in such a way that the sum of 
    the numbers: in each row, in each column, on each of both diagonals, 
    four central fields and four corners is equal to 38. Is the solution 
    unambiguous?

9    x    x    x

x    x    8    17

4    13   x    x

x    6    5    x

Modify the starting square by removing the two selected numbers. Is the 
solution clear?

*******************************************************************************/

assign([], _).
assign([V|Vs], L1):-
  select(V, L1, L2),
  assign(Vs, L2).

square() :-
  X = [C21, C31, C41, C12, C22,  C33, C43, C14, C44],
  Y = [2, 3, 7, 10, 11, 12, 14, 15, 16],
  assign(X, Y),

  C11 = 9,
  C32 = 8,
  C42 = 17,
  C13 = 4,
  C23 = 13,
  C24 = 6,
  C34 = 5,

  C11 + C21 + C31 + C41 =:= 38,
  C12 + C22 + C32 + C42 =:= 38,
  C13 + C23 + C33 + C43 =:= 38,
  C14 + C24 + C34 + C44 =:= 38,

  C11 + C12 + C13 + C14 =:= 38,
  C21 + C22 + C23 + C24 =:= 38,
  C31 + C32 + C33 + C34 =:= 38,
  C41 + C42 + C43 + C44 =:= 38,
    
  C11 + C22 + C33 + C44 =:= 38,
  C14 + C23 + C32 + C41 =:= 38,

  C22 + C32 + C23 + C33 =:= 38,
  C11 + C41 + C14 + C44 =:= 38,

  write(C11), write('\t'), write(C21), write('\t'), write(C31), write('\t'), writeln(C41), writeln(' '),
  write(C12), write('\t'), write(C22), write('\t'), write(C32), write('\t'), writeln(C42), writeln(' '),
  write(C13), write('\t'), write(C23), write('\t'), write(C33), write('\t'), writeln(C43), writeln(' '),
  write(C14), write('\t'), write(C24), write('\t'), write(C34), write('\t'), writeln(C44), fail.

/*

1 ?- square.
9       16      11      2

10      3       8       17

4       13      14      7

15      6       5       12
false.

*/
