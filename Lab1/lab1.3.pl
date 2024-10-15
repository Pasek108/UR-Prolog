/*******************************************************************************

1.3 Prepare a knowledge base in Prolog (zabytki.pl file) with the following 
    information:

    - Pa�stwa: Polska, Niemcy, Francja, W�ochy, Hiszpania, Wielka Brytania
    - Miasta: Warszawa, Krak�w, Berlin, Pary�, Rzym, Wenecja, Barcelona, Madryt,
      Londyn
    - Zabytki: Pa�ac w Wilanowie, Kolumna Zygmunta III Wazy, Wawel, Sukiennice, 
      Ko�ci� Mariacki, Brama Brandenburska, Reichstag, Wie�a Eiffla, 
      Katedra Notre-Dame, Pa�ac Elizejski, Bazylika �w. Paw�a za Murami, 
      Koloseum, Zamek �wi�tego Anio�a, Bazylika �w. Marka, Pa�ac Do��w, 
      Sagrada Familia, Pa�ac Kryszta�owy, Tower Bridge, Pa�ac Buckingham, 
      Katedra �wi�tego Paw�a

Organize the knowledge base in such a way that it stores information about what 
is a country, what is a city, what is a monument, and the city-state, 
monument-city, state-state relationships (in the sense of neighborhood - we 
assume that Great Britain neighbors France).

By asking the right questions, check:

    - What monuments are in Berlin?
    - What cities are in Spain?
    - What monuments are in Italy?
    - In which city is the Basilica of St. Paul Outside the Walls?
    - What country is Sagrada Familia in?
    - What monuments can be visited in the countries neighboring France?
    - What monuments can be visited in the country where Barcelona is located?
    - Which cities are in the countries neighboring Germany?
    - Are there any historical monuments in the UK?
    - Is there a country that neighbors the country in which Madrid is located?

*******************************************************************************/

panstwo('Polska').
panstwo('Niemcy').
panstwo('Francja').
panstwo('W�ochy').
panstwo('Hiszpania').
panstwo('Wielka Brytania').

miasto('Warszawa').
miasto('Krak�w').
miasto('Berlin').
miasto('Pary�').
miasto('Rzym').
miasto('Wenecja').
miasto('Barcelona').
miasto('Madryt').
miasto('Londyn').

polozenie('Warszawa', 'Polska').
polozenie('Krak�w', 'Polska').
polozenie('Berlin', 'Niemcy').
polozenie('Pary�', 'Francja').
polozenie('Rzym', 'W�ochy').
polozenie('Wenecja', 'W�ochy').
polozenie('Barcelona', 'Hiszpania').
polozenie('Madryt', 'Hiszpania').
polozenie('Londyn', 'Wielka Brytania').

zabytek('Pa�ac w Wilanowie').
zabytek('Kolumna Zygmunta III Wazy').
zabytek('Wawel').
zabytek('Sukiennice').
zabytek('Ko�ci� Mariacki').
zabytek('Brama Brandenburska').
zabytek('Reichstag').
zabytek('Wie�a Eiffla').
zabytek('Katedra Notre-Dame').
zabytek('Pa�ac Elizejski').
zabytek('Bazylika �w. Paw�a za Murami').
zabytek('Koloseum').
zabytek('Zamek �wi�tego Anio�a').
zabytek('Bazylika �w. Marka').
zabytek('Pa�ac Do��w').
zabytek('Sagrada Familia').
zabytek('Pa�ac Kryszta�owy').
zabytek('Tower Bridge').
zabytek('Pa�ac Buckingham').
zabytek('Katedra �wi�tego Paw�a').

gdzie('Pa�ac w Wilanowie', 'Warszawa').
gdzie('Kolumna Zygmunta III Wazy', 'Warszawa').
gdzie('Wawel', 'Krak�w').
gdzie('Sukiennice', 'Krak�w').
gdzie('Ko�ci� Mariacki', 'Krak�w').
gdzie('Brama Brandenburska', 'Berlin').
gdzie('Reichstag', 'Berlin').
gdzie('Wie�a Eiffla', 'Pary�').
gdzie('Katedra Notre-Dame', 'Pary�').
gdzie('Pa�ac Elizejski', 'Pary�').
gdzie('Bazylika �w. Paw�a za Murami', 'Rzym').
gdzie('Koloseum', 'Rzym').
gdzie('Zamek �wi�tego Anio�a', 'Rzym').
gdzie('Bazylika �w. Marka', 'Wenecja').
gdzie('Pa�ac Do��w', 'Wenecja').
gdzie('Sagrada Familia', 'Barcelona').
gdzie('Pa�ac Kryszta�owy', 'Madryt').
gdzie('Tower Bridge', 'Londyn').
gdzie('Pa�ac Buckingham', 'Londyn').
gdzie('Katedra �wi�tego Paw�a', 'Londyn').

obok('Polska', 'Niemcy').
obok('Niemcy', 'Francja').
obok('Francja', 'Wielka Brytania').
obok('Francja', 'W�ochy').
obok('Francja', 'Hiszpania').

/*

country   C
city      T
monument  M

*/

zabytki_miasta(T, M) :- 
  zabytek(M),
  gdzie(M, T).

miasta_panstwa(C, T) :-
  polozenie(T, C).

zabytki_panstwa(C, M) :-
  zabytek(M),
  gdzie(M, T),
  polozenie(T, C).

gdzie_zabytek(M, T, C) :-
  gdzie(M, T),
  zabytek(M),
  polozenie(T, C).

sasiad(C1, C2) :- 
  obok(C1, C2);
  obok(C2, C1).

zabytki_sasiadow_francji(M) :-
  sasiad('Francja', C), 
  polozenie(T, C), 
  gdzie(M, T), 
  zabytek(M),
  miasto(T),
  panstwo(C).

zabytki_kraju_gdzie_barcelona(M) :-
  polozenie('Barcelona', C),
  polozenie(T, C),
  gdzie(M, T),
  zabytek(M),
  panstwo(C).
  
miasta_panstw_obok_niemiec(T, C) :-
  sasiad('Niemcy', C),
  polozenie(T, C).
  
czy_sa_zabytki_w_anglii() :-
  polozenie(T, 'Wielka Brytania'),
  gdzie(M, T),
  zabytek(M), 
  !.

czy_sa_kraje_obok_kraju_z_madrytem() :-
  polozenie('Madryt', C),
  sasiad(N, C),
  panstwo(N),
  !.

/*

What monuments are in Berlin?

1 ?- zabytki_miasta('Berlin', Zabytek).
Zabytek = 'Brama Brandenburska' ;
Zabytek = 'Reichstag'.

----------------------------

What cities are in Spain?

2 ?- miasta_panstwa('Hiszpania', Miasto).
Miasto = 'Barcelona' ;
Miasto = 'Madryt'.

----------------------------

What monuments are in Italy?

3 ?- zabytki_panstwa('W�ochy', Zabytek).
Zabytek = 'Bazylika �w. Paw�a za Murami' ;
Zabytek = 'Koloseum' ;
Zabytek = 'Zamek �wi�tego Anio�a' ;
Zabytek = 'Bazylika �w. Marka' ;
Zabytek = 'Pa�ac Do��w' ;
false.

----------------------------

In which city is the Basilica of St. Paul Outside the Walls?

4 ?- gdzie_zabytek('Bazylika �w. Paw�a za Murami', Miasto, Panstwo).
Miasto = 'Rzym',
Panstwo = 'W�ochy'.

----------------------------

What country is Sagrada Familia in?

5 ?- gdzie_zabytek('Sagrada Familia', Miasto, Panstwo).
Miasto = 'Barcelona',
Panstwo = 'Hiszpania'.

----------------------------

What monuments can be visited in the countries neighboring France?

6 ?- zabytki_sasiadow_francji(M).
M = 'Tower Bridge' ;
M = 'Pa�ac Buckingham' ;
M = 'Katedra �wi�tego Paw�a' ;
M = 'Bazylika �w. Paw�a za Murami' ;
M = 'Koloseum' ;
M = 'Zamek �wi�tego Anio�a' ;
M = 'Bazylika �w. Marka' ;
M = 'Pa�ac Do��w' ;
M = 'Sagrada Familia' ;
M = 'Pa�ac Kryszta�owy' ;
M = 'Brama Brandenburska' ;
M = 'Reichstag'.

----------------------------

What monuments can be visited in the country where Barcelona is located?

7 ?- zabytki_kraju_gdzie_barcelona(M).
M = 'Sagrada Familia' ;
M = 'Pa�ac Kryszta�owy'.

----------------------------

Which cities are in the countries neighboring Germany?

8 ?- miasta_panstw_obok_niemiec(T, C).
T = 'Pary�',
C = 'Francja' ;
T = 'Warszawa',
C = 'Polska' ;
T = 'Krak�w',
C = 'Polska'.

----------------------------

Are there any monuments in the UK?

9 ?- czy_sa_zabytki_w_anglii().
true.

----------------------------

Is there a country that neighbors the country in which Madrid is located?

10 ?- czy_sa_kraje_obok_kraju_z_madrytem().
true.

*/
