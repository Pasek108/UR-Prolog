/*******************************************************************************

2.5 Write a program that calculates the result of the quadratic equation 
    ax^2 + bx + c = 0 in the realm of real numbers. Implement predicates:

    - delta/4 – calculating delta, arguments: a, b, c, result,
    - trinomial/4 – calculating the result of a quadratic equation, arguments
      in the following order: a, b, c, result.

Note: Note the non-determinism in the trojnomian/4 predicate, which finds zero,
      one, or two solutions.

*******************************************************************************/

/*

1 ?- X is 3*5.
X = 15.

*/

/*

6 ?- 1 + 3 = 1 + 3.
true.

7 ?- 1 + 3 = 3 + 1.
false.

8 ?- 1 + 3 =:= 1 + 3.
true.

9 ?- 1 + 3 =:= 3 + 1.
true.

10 ?- fun(5,Y).
Y = 10.

*/

delta(A,B,C,D) :- D is B*B - 4*A*C.

trinomial(A,B,C,X) :-
    delta(A,B,C,D),
    D > 0,
    X1 is (B - sqrt(D)) / (2 * A),
    X2 is (B + sqrt(D)) / (2 * A),
    X = [X1, X2].

trinomial(A,B,C,X) :-
    delta(A,B,C,D),
    D = 0,
    X1 is -B / (2 * A),
    X = [X1].

trinomial(A,B,C,X) :-
    delta(A,B,C,D),
    D < 0,
    X = [].
    
/*

1 ?- trinomial(1,0,-1,X).
X = [-1.0, 1.0] ;
false.

2 ?- trinomial(1,-2,1,X).
X = [1] ;
false.

3 ?- trinomial(1,0,1,X).
X = [].

*/

trinomial2(A,B,C,X) :-
    delta(A,B,C,D),
    D > 0,
    X1 is (B - sqrt(D)) / (2 * A),
    X2 is (B + sqrt(D)) / (2 * A),
    X = [X1, X2], !.

trinomial2(A,B,C,X) :-
    delta(A,B,C,D),
    D = 0,
    X1 is -B / (2 * A),
    X = [X1], !.

trinomial2(_,_,_,[]).

/*

7 ?- trinomial2(1,0,-1,X).
X = [-1.0, 1.0].

8 ?- trinomial2(1,-2,1,X).
X = [1].

9 ?- trinomial2(1,0,1,X).
X = [].

*/
