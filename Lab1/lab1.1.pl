/*******************************************************************************

1.1 Run the SWI shell and load the file. By asking the right questions, check:

    - Is Tomek a male?
    - Is Tomek a female?
    - Who is Max's parent?
    - Whose parent is Max?
    - Is Ola a mother?
    - Does Ola have a mother?
    - Does Tomek have children?
    - Does Ania have a mother and a father?
    - Who has a grandson? (without adding new rules)
    - Who has a great-grandson? (without adding new rules)
    - Is Ola a female?
    - Who is the male?
    - Who is Max's mother?
    - Who is Max's father?
    - Who has a mother and a father?
    - Who has a granddaughter? (without adding new rules)
    - Who has a great-granddaughter? (without adding new rules)


*******************************************************************************/

parent(ola, max).
parent(tomek, max).
parent(tomek, lila).
parent(max, ania).
parent(max, kasia).
parent(kasia, radek).
 
female(ola).
female(lila).
female(kasia).
female(ania).

male(tomek).
male(max).
male(radek).
 
mother(X,Y) :-
  parent(X,Y),
  female(X).
 
father(X,Y) :-
  parent(X,Y),
  male(X).

/*

Is Tomek a male?

1 ?- male(tomek).
true.

----------------------------

Is Tomek a female?

2 ?- female(tomek).
false.

----------------------------

Who is Max's parent?

3 ?- parent(X, max).
X = ola ;
X = tomek.

----------------------------

Whose parent is Max?

4 ?- parent(max, X).
X = ania ;
X = kasia.

----------------------------

Is Ola a mother?

5 ?- mother(ola, _).
true.

----------------------------

Does Ola have a mother?

6 ?- mother(_, ola).
false.

----------------------------

Does Tomek have children?

7 ?- parent(tomek, _).
true ;
true.

----------------------------

Does Ania have a mother and a father?

8 ?- mother(_, ania), father(_, ania).
false.

----------------------------

Who has a grandson? (without adding new rules)

9 ?- parent(X, Y), parent(Y, Z), male(Z).
X = max,
Y = kasia,
Z = radek ;
false.

----------------------------

Who has a great-grandson? (without adding new rules)

10 ?- parent(X, Y), parent(Y, Z), parent(Z, A), male(A).
X = ola,
Y = max,
Z = kasia,
A = radek ;
X = tomek,
Y = max,
Z = kasia,
A = radek ;
false.

----------------------------

Is Ola a female?

11 ?- female(ola).
true.

----------------------------

Who is the male?

12 ?- male(X).
X = tomek ;
X = max ;
X = radek.

----------------------------

Who is Max's mother?

13 ?- mother(X, max).
X = ola ;
false.

----------------------------

Who is Max's father?

14 ?- father(X, max).
X = tomek.

----------------------------

Who has a mother and a father?

15 ?- mother(_, X), father(_, X).
X = max ;
false.

----------------------------

Who has a granddaughter? (without adding new rules)

16 ?- parent(X, Y), parent(Y, Z), female(Z).
X = ola,
Y = max,
Z = ania ;
X = ola,
Y = max,
Z = kasia ;
X = tomek,
Y = max,
Z = ania ;
X = tomek,
Y = max,
Z = kasia ;
false.

----------------------------

Who has a great-granddaughter? (without adding new rules)

17 ?- parent(X, Y), parent(Y, Z), parent(Z, A), female(A).
false.

*/
