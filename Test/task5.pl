/*******************************************************************************

Task 5 Group 1

Write a Prolog program to decode the operation knowing that the same letters 
correspond to the same numbers, a different letters have different numbers.

AB +  C = DD
 +    +    +
DE +  C - DC
------------
FB + AE = GB

You can use the assign predicate in your program.

assign([], _).
assign([V|Vs], L1):-
    select(V, L1, L2),
    assign(Vs, L2).

*******************************************************************************/

assign([], _).
assign([V|Vs], L1):-
    select(V, L1, L2),
    assign(Vs, L2).

dzialanie :-
    X = [A, B, C, D, E, F, G],
    Y = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
    assign(X, Y),
    A > 0, D > 0, F > 0, G > 0,
    A * 10 + B + C =:= D * 10 + D,
    D * 10 + E + C =:= D * 10 + C,
    F * 10 + B + A * 10 + E =:= G * 10 + B,
    A * 10 + B + D * 10 + E =:= F * 10 + B,
    C + C =:= A * 10 + E,
    D * 10 + D + D * 10 + C =:= G * 10 + B,
    write(A), write(B), write(' +  '), write(C), write(' = '), write(D), writeln(D),
    writeln(' +    + =  +'),
    write(D), write(E), write(' +  '), write(C), write(' = '), write(D), writeln(C),
    writeln('------------'),
    write(F), write(B), write(' + '), write(A), write(A), write(' = '), write(G), writeln(B),
    fail.

/*

?- dzialanie.
17 +  5 = 22
 +    + =  +
20 +  5 = 25
------------
37 + 11 = 47
false.

*/

/*******************************************************************************

Task 5 Group 2

Write a program to solve the following problem: 
Enter the numbers from 1 to 12 so that the sum of the numbers on each of the 
six lines forming a star was 26.

      (x)
      / \
(x)-(x)-(x)-(x)
  \ /     \ /
  (x)     (x)
  / \     / \
(x)-(x)-(x)-(x)
      \ /
      (x)

You can use the assign predicate in your program.

assign([], _).
assign([V|Vs], L1):-
    select(V, L1, L2),
    assign(Vs, L2).

*******************************************************************************/

assign([], _).
assign([V|Vs], L1):-
    select(V, L1, L2),
    assign(Vs, L2).

/*
      E
     / \
A - B - C - D
 \ /     \ /
  F       G
 / \     / \
I - J - K - L
     \ /
      M
*/
gwiazda :-
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

?- gwiazda. 
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
...

*/
