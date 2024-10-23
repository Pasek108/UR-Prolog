/*******************************************************************************

Task 1 Group 1

Provide questions to obtain information:
- What ingredients does a pizza costing PLN 27 contain?
- What ingredients appear on (at least) two different
  pizzas?
- Which pizza does Adam like?
- Which pizza contains olives?

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

/*

?- pizza(P, 27.00), skladnik(S, P), writeln(S), fail. 
ser
salami
kabanosy
papryka
false.

?- skladnik(S, P1), skladnik(S, P2), P1 \== P2, writeln(S), fail. 
ser
ser
szynka
ser
ser
kabanosy
papryka
ser
ser
szynka
kabanosy
papryka
false.

?- lubi(adam, S), skladnik(S, P), writeln(P), fail.               
capriciosa
califfo
false.

?- skladnik(oliwki, P), writeln(P), fail. 
califfo
false.

*/

/*******************************************************************************

Task 1 Group 2

Provide questions to obtain information: ´
- Who are Ania's father and mother?
- Does Karol have any children?
- Whose mother is Lila?
- Who lives on Kwiatowa Street?

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

/*

?- ojciec(O, ania), matka(M, ania).
O = adam,
M = lila.

?- ojciec(karol, _).
false.

?- matka(lila, D).
D = ania ;
D = karol.

?- adres(O, _, kwiatowa).
O = ola ;
O = tomek ;
O = kasia ;
O = radek ;
O = wojtek.

*/
