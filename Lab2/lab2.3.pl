/*******************************************************************************

2.3 Add a recursive rule to the Knowledge Base from task 1.1:

    - descendant(X,Y), which succeeds if X is a descendant of Y.
    - descendants(X), which prints all the descendants of X on the screen (each 
      on a separate line) and always succeeds. Use the fail predicate to search 
      for all solutions.

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
  


descendant(X,Y) :- parent(Y,X), !.
descendant(X,Y) :- parent(Z,X), descendant(Z,Y), !.

/*

1 ?- descendant(Y,max).
Y = ania.

2 ?- descendant(ania,max).
true.

3 ?- descendant(kasia,max).
true.

*/

descendants(X) :-
  (parent(X,Y), writeln(Y), fail);
  (parent(X,Z), descendants(Z), fail).
descendants(_).
  
/*

4 ?- descendants(tomek).
max
lila
ania
kasia
radek
true.

5 ?- descendants(max).
ania
kasia
radek
true.

6 ?- descendants(lila).
true.

*/
