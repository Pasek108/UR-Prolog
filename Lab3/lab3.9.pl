/*******************************************************************************

3.9 Define predicates calculating the following sums and products:

    - sum of 1 to 100 numbers of the form 1/n
    - product of 1 to 50 numbers of the form (1+n)/(2+n)
    - sum of 1 to 1000 numbers of the form 1/(i^2)
    - sum of 1 to 1000 numbers of the form (sqrt i)-1/i
    - product of 1 to 1000 numbers of the form (i+1)/(i^3)

*******************************************************************************/

listSum([X], X).
listSum([X,Y|T], Sum) :-
  Z is X + Y,
  listSum([Z|T], Sum).

f1(X, Y) :- Y is 1 / X.
sum1(R) :-
  numlist(1, 100, L),
  maplist(f1, L, L1),
  listSum(L1, R), !.

/*

1 ?- sum1(R).
R = 5.187377517639621.

*/

listProd([X], X).
listProd([X,Y|T], Prod) :-
  Z is X * Y,
  listProd([Z|T], Prod).

f2(X, Y) :- Y is (1 + X ) / (2 + X).
prod1(R) :-
  numlist(1, 50, L),
  maplist(f2, L, L1),
  listProd(L1, R), !.

/*

2 ?- prod1(R).
R = 0.03846153846153846.

*/

f3(X, Y) :- Y is 1 / (X ** 2).
sum2(R) :-
  numlist(1, 1000, L),
  maplist(f3, L, L1),
  listSum(L1, R), !.

/*

3 ?- sum2(R).
R = 1.6439345666815615.

*/

f4(X, Y) :- Y is sqrt(X) - 1 / X.
sum3(R) :-
  numlist(1, 1000, L),
  maplist(f4, L, L1),
  listSum(L1, R), !.

/*

4 ?- sum3(R).
R = 21089.970416620185.

*/

f5(X, Y) :- Y is (X + 1) / (X ** 3).
prod2(R) :-
  numlist(1, 1000, L),
  maplist(f5, L, L1),
  listProd(L1, R), !.

/*

5 ?- prod2(R).
R = 0.0.

*/
