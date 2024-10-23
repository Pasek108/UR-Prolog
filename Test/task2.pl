/*******************************************************************************

Task 2 Group 1

Assuming a predicate is defined dobrapizza(X, Y), which finds pizza Y that the
person X likes, define the predicate spotkanie(X, Y, Z), searching for women X 
who can make an appointment with man Y, assuming that they both like pizza Z.
Use knowledge base from previous task.

*******************************************************************************/

kobieta(ola).
kobieta(kasia).
kobieta(ania).

mezczyzna(tomek).
mezczyzna(maks).
mezczyzna(adam).

pizza(capriciosa, 24.90).
pizza(roma, 27.00).
pizza(califfo, 30.40).

skladnik(ser, capriciosa).
skladnik(szynka, capriciosa).
skladnik(pieczarki, capriciosa).
skladnik(ser, roma).
skladnik(salami, roma).
skladnik(kabanosy, roma).
skladnik(papryka, roma).
skladnik(ser, califfo).
skladnik(szynka, califfo).
skladnik(kabanosy, califfo).
skladnik(papryka, califfo).
skladnik(oliwki, califfo).

lubi(ola, szynka).
lubi(ola, oliwki).
lubi(kasia, szynka).
lubi(kasia, salami).
lubi(ania, oliwki).
lubi(ania, papryka).
lubi(ania, pieczarki).
lubi(tomek, szynka).
lubi(tomek, oliwki).
lubi(maks, salami).
lubi(maks, szynka).
lubi(maks, kabanosy).
lubi(maks, pieczarki).
lubi(adam, szynka).

dobrapizza(X, Y) :-
    lubi(X, S1),
    lubi(X, S2),
    S1 \= S2,
    skladnik(S1, Y).

spotkanie(X, Y, Z) :-
    kobieta(X),
    mezczyzna(Y),
    dobrapizza(X, Z),
    dobrapizza(Y, Z).

/*

?- spotkanie(X, Y, Z).
X = ola,
Y = tomek,
Z = capriciosa ;
X = ola,
Y = tomek,
Z = califfo ;
...

*/

/*******************************************************************************

Task 2 Group 2

Define the predicates dziadek(X,Y) – X is Y's grandfather and the predicate
siostra(X,Y) – X is Y's sister.

*******************************************************************************/

kobieta(ola).
kobieta(lila).
kobieta(kasia).
kobieta(ania).
kobieta(ewa).

mezczyzna(tomek).
mezczyzna(adam).
mezczyzna(radek).
mezczyzna(karol).
mezczyzna(wojtek).
mezczyzna(artur).

% najpierw matka, potem dziecko
matka(ola, lila).
matka(ola, kasia).
matka(lila, ania).
matka(lila, karol).
matka(kasia, wojtek).

% najpierw ojciec, potem dziecko
ojciec(tomek, lila).
ojciec(tomek, kasia).
ojciec(adam, ania).
ojciec(adam, karol).
ojciec(radek, wojtek).

adres(ola, krakow, kwiatowa).
adres(tomek, krakow, kwiatowa).
adres(lila, krakow, wiosenna).
adres(karol, krakow, wiosenna).
adres(artur, krakow, wiosenna).
adres(kasia, wieliczka, kwiatowa).
adres(radek, wieliczka, kwiatowa).
adres(wojtek, wieliczka, kwiatowa).
adres(ania, krakow, wiosenna).

dziadek(X, Y) :-
    ojciec(X, D),
    ojciec(D, Y);
    ojciec(X, D),
    matka(D, Y),
    mezczyzna(X).

siostra(X, Y) :-
    ojciec(O, X),
    ojciec(O, Y),
    matka(M, X),
    matka(M, Y),
    kobieta(X),
    X \= Y.

/*

?- dziadek(X,Y).
X = tomek,
Y = ania ;
X = tomek,
Y = karol ;
X = tomek,
Y = wojtek ;
false.

?- siostra(X,Y).    
X = lila,
Y = kasia ;
X = kasia,
Y = lila ;
X = ania,
Y = karol ;
false.

*/
