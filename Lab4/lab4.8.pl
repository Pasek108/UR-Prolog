/*******************************************************************************

4.8 Write a program in Prolog to solve the following problem: Enter the numbers 
    1 to 12 so that the sum of the numbers on each of the six lines forming the 
    star is 26. Is the solution unambiguous?
    
      (x)
      / \
(x)-(x)-(x)-(x)
  \ /     \ /
  (x)     (x)
  / \     / \
(x)-(x)-(x)-(x)
      \ /
      (x)

*******************************************************************************/

assign([], _).
assign([V|Vs], L1):-
  select(V, L1, L2),
  assign(Vs, L2).

star :-
  X = [A, B, C, D, E, F, G, I, J, K, L, M],
  Y = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
  assign(X, Y),

  A + B + C + D =:= 26,
  E + B + F + I =:= 26,
  E + C + G + L =:= 26,
  I + J + K + L =:= 26,
  A + F + J + M =:= 26,
  D + G + K + M =:= 26,

  write('      '), writeln(E),
  writeln('     / \\'),
  write(A), write(' - '), write(B), write(' - '), write(C), write(' - '), writeln(D),
  writeln(' \\ /     \\ /'),
  write('  '), write(F), write('       '), writeln(G),
  writeln(' / \\     / \\'),
  write(I), write(' - '), write(J), write(' - '), write(K), write(' - '), writeln(L),
  writeln('     \\ /'),
  write('      '), writeln(M), writeln(''),
  fail.

/*

1 ?- star.
      5
     / \
1 - 2 - 11 - 12
 \ /     \ /
  10       4
 / \     / \
9 - 8 - 3 - 6
     \ /
      7

      8
     / \
1 - 2 - 11 - 12
 \ /     \ /
  9       3
 / \     / \
7 - 10 - 5 - 4
     \ /
      6
      
... and many more solutions

*/
