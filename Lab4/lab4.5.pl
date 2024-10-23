/*******************************************************************************

4.5 Write a program in Prolog that decodes the operation, knowing that the same 
    letters correspond to the same digits, and different letters correspond to 
    different digits.

 AB + CD =  EA
  +    +     +
 DF +  D =  EG
--------------
CHE + GH = CGE

*******************************************************************************/

assign([], _).
assign([V|Vs], L1):-
  select(V, L1, L2),
  assign(Vs, L2).

operation :-
  X = [A, B, C, D, E, F, G, H],
  Y = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
  assign(X, Y),

  A > 0, C > 0, D > 0, E > 0, G > 0,
            (A * 10 + B) + (C * 10 + D) =:=           (E * 10 + A),
            (D * 10 + F) +           D  =:=           (E * 10 + G),
  (C * 100 + H * 10 + E) + (G * 10 + H) =:= (C * 100 + G * 10 + E),
            (A * 10 + B) + (D * 10 + F) =:= (C * 100 + H * 10 + E),
            (C * 10 + D) +           D  =:=           (G * 10 + H),
            (E * 10 + A) + (E * 10 + G) =:= (C * 100 + G * 10 + E),

  write(' '), write(A), write(B), write(' + '), write(C), write(D), write(' =  '), write(E), writeln(A),
  writeln('  +    +     +'),
  write(' '), write(D), write(F), write(' +  '), write(D), write(' =  '), write(E), writeln(G),
  writeln('--------------'),
  write(C), write(H), write(E), write(' + '), write(G), write(H), write(' = '), write(C), write(G), writeln(E),
  fail.

/*

1 ?- operation.
 49 + 15 =  64
  +    +     +
 57 +  5 =  62
--------------
106 + 20 = 126
false.

*/
