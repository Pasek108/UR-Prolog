/*******************************************************************************

4.4 Write a program in Prolog that decodes the operation, knowing that the same 
    letters correspond to the same digits, and different letters correspond to 
    different digits.

AB + C = DD
 + + = +
DE + C = DC
------------
FB + AE = GB

*******************************************************************************/

assign([], _).
assign([V|Vs], L1):-
  select(V, L1, L2),
  assign(Vs, L2).

operation :-
  X = [A, B, C, D, E, F, G],
  Y = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
  assign(X, Y),

  A > 0, D > 0, F > 0, G > 0,
  (A * 10 + B) +           C  =:= (D * 10 + D),
  (D * 10 + E) +           C  =:= (D * 10 + C),
  (F * 10 + B) + (A * 10 + E) =:= (G * 10 + B),
  (A * 10 + B) + (D * 10 + E) =:= (F * 10 + B),
            C  +           C  =:= (A * 10 + E),
  (D * 10 + D) + (D * 10 + C) =:= (G * 10 + B),
  
  write(A), write(B), write(' +  '), write(C), write(' = '), write(D), writeln(D),
  writeln(' +    + =  +'),
  write(D), write(E), write(' +  '), write(C), write(' = '), write(D), writeln(C),
  writeln('------------'),
  write(F), write(B), write(' + '), write(A), write(A), write(' = '), write(G), writeln(B),
  fail.

/*

1 ?- operation.
17 +  5 = 22
 +    + =  +
20 +  5 = 25
------------
37 + 11 = 47
false.

*/
