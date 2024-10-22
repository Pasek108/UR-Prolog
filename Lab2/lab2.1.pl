/*******************************************************************************

2.1 Add rules to the Knowledge Base from task 1.1:

    - sister(X, Y) - succeeds if X is Y's sister
    - pair(X, Y) - succeeds if X is a female, Y is a male and they have a child
      together
    - brother(X, Y) - succeeds if X is Y's brother
    - family(X, Y, Z1, Z2) - is successful if X is a female, Y is a male and Z1, 
      Z2 are their common (different) children

NOTE: You cannot be a sister (brother) to yourself.

*******************************************************************************/

parent(ola, max).
parent(tomek, max).
parent(tomek, lila).
parent(max, ania).
parent(max, kasia).
parent(kasia, radek).
parent(ola, lila).

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
  


sister(X, Y) :-
  female(X), 
  parent(Z, X), 
  parent(Z, Y), 
  X \= Y.
  
/*

1 ?- sister(X, Y).
X = lila,
Y = max ;
X = kasia,
Y = ania ;
X = ania,
Y = kasia.

2 ?- sister(lila, lila).
false.

*/

pair(X, Y) :- 
  female(X),
  male(Y),
  parent(X, Z),
  parent(Y, Z).
  
/*

3 ?- pair(X, Y).
X = ola,
Y = tomek ;
false.

4 ?- pair(ola, tomek).
true.

5 ?- pair(tomek, ola).
false.

*/

brother(X, Y) :-
  male(X),
  parent(Z, X), 
  parent(Z, Y), 
  X \= Y.
  
/*

6 ?- brother(X, Y).
X = max,
Y = lila ;
false.

7 ?- brother(max, max).
false.

*/
  
family(X, Y, Z1, Z2) :- 
  female(X),
  male(Y),
  parent(X, Z1),
  parent(Y, Z1),
  parent(X, Z2),
  parent(Y, Z2),
  Z1 \= Z2.

/*

8 ?- family(X, Y, Z1, Z2).
false.

----------------------------

after adding:
parent(ola, lila).

----------------------------

10 ?- family(X, Y, Z1, Z2).
X = ola,
Y = tomek,
Z1 = max,
Z2 = lila ;
X = ola,
Y = tomek,
Z1 = lila,
Z2 = max ;
false.

*/
