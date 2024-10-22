/*******************************************************************************

2.2 Add a parents(X) rule to the Knowledge Base from task 1.1, which prints
    information about X's parents according to. given examples:

?- parents(max).
father: Tomek
mother: ola
Yes
 
?- parents(lila).
father: Tomek
Yes
 
?- parents(radek).
mother: Kasia
Yes
 
?- parents(ola).
no data
Yes

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
  


parents(C) :-
  \+parent(_, C),
  writeln("no data"), !.

parents(C) :-
  (parent(P, C), male(P),   write("father: "),  writeln(P), fail);
  (parent(P, C), female(P), write("mother: "),  writeln(P), fail).
parents(_).
  
/*

1 ?- parents(max).
father: tomek
mother: ola
true.

2 ?- parents(lila).
father: tomek
true.

3 ?- parents(radek).
mother: kasia
true.

4 ?- parents(ola).
no data
true.

*/
