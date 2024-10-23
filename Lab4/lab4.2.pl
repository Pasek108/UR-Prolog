/*******************************************************************************

4.2 Write a Prolog program to solve the following magic square. The square 
    should contain numbers from 1 to 16, entered in such a way that the sum of 
    the numbers in each row and each column is equal to 34. Is the solution 
    unambiguous?

x    x    5    x

15   x    x    3

x    x   11    2

1   12    x    x

Modify the starting square by removing the two selected numbers. Is the 
solution clear?

*******************************************************************************/

assign([], _).
assign([V|Vs], L1):-
  select(V, L1, L2),
  assign(Vs, L2).

square() :-
  X = [C11, C21, C41, C22, C32, C13, C23, C34, C44],
  Y = [4, 6, 7, 8, 9, 10, 13, 14, 16],
  assign(X, Y),

  C31 = 5,
  C12 = 15,
  C42 = 3,
  C33 = 11,
  C43 = 2,
  C14 = 1,
  C24 = 12,

  C11 + C21 + C31 + C41 =:= 34,
  C12 + C22 + C32 + C42 =:= 34,
  C13 + C23 + C33 + C43 =:= 34,
  C14 + C24 + C34 + C44 =:= 34,

  C11 + C12 + C13 + C14 =:= 34,
  C21 + C22 + C23 + C24 =:= 34,
  C31 + C32 + C33 + C34 =:= 34,
  C41 + C42 + C43 + C44 =:= 34,

  write(C11), write('\t'), write(C21), write('\t'), write(C31), write('\t'), writeln(C41), writeln(' '),
  write(C12), write('\t'), write(C22), write('\t'), write(C32), write('\t'), writeln(C42), writeln(' '),
  write(C13), write('\t'), write(C23), write('\t'), write(C33), write('\t'), writeln(C43), writeln(' '),
  write(C14), write('\t'), write(C24), write('\t'), write(C34), write('\t'), writeln(C44), fail.

/*

1 ?- square.
4       9       5       16

15      6       10      3

14      7       11      2

1       12      8       13
false.

*/
