/*******************************************************************************

1.3 Prepare a knowledge base in Prolog (zabytki.pl file) with the following 
    information:

    - Countries: Polska, Niemcy, Francja, W�ochy, Hiszpania, Wielka Brytania
    - Cities: Warszawa, Krak�w, Berlin, Pary�, Rzym, Wenecja, Barcelona, Madryt,
      Londyn
    - Monuments: Pa�ac w Wilanowie, Kolumna Zygmunta III Wazy, Wawel, Koloseum,
      Zamek �wi�tego Anio�a, Ko�ci� Mariacki, Brama Brandenburska, Reichstag,
      Katedra Notre-Dame, Katedra �wi�tego Paw�a, Bazylika �w. Paw�a za Murami,
      Wie�a Eiffla, Bazylika �w. Marka, Pa�ac Do��w, Tower Bridge, Sukiennice,
      Pa�ac Kryszta�owy, Pa�ac Buckingham, Sagrada Familia, Pa�ac Elizejski

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

country('Polska').
country('Niemcy').
country('Francja').
country('W�ochy').
country('Hiszpania').
country('Wielka Brytania').

town('Warszawa').
town('Krak�w').
town('Berlin').
town('Pary�').
town('Rzym').
town('Wenecja').
town('Barcelona').
town('Madryt').
town('Londyn').

location('Warszawa', 'Polska').
location('Krak�w', 'Polska').
location('Berlin', 'Niemcy').
location('Pary�', 'Francja').
location('Rzym', 'W�ochy').
location('Wenecja', 'W�ochy').
location('Barcelona', 'Hiszpania').
location('Madryt', 'Hiszpania').
location('Londyn', 'Wielka Brytania').

monument('Pa�ac w Wilanowie').
monument('Kolumna Zygmunta III Wazy').
monument('Wawel').
monument('Sukiennice').
monument('Ko�ci� Mariacki').
monument('Brama Brandenburska').
monument('Reichstag').
monument('Wie�a Eiffla').
monument('Katedra Notre-Dame').
monument('Pa�ac Elizejski').
monument('Bazylika �w. Paw�a za Murami').
monument('Koloseum').
monument('Zamek �wi�tego Anio�a').
monument('Bazylika �w. Marka').
monument('Pa�ac Do��w').
monument('Sagrada Familia').
monument('Pa�ac Kryszta�owy').
monument('Tower Bridge').
monument('Pa�ac Buckingham').
monument('Katedra �wi�tego Paw�a').

where('Pa�ac w Wilanowie', 'Warszawa').
where('Kolumna Zygmunta III Wazy', 'Warszawa').
where('Wawel', 'Krak�w').
where('Sukiennice', 'Krak�w').
where('Ko�ci� Mariacki', 'Krak�w').
where('Brama Brandenburska', 'Berlin').
where('Reichstag', 'Berlin').
where('Wie�a Eiffla', 'Pary�').
where('Katedra Notre-Dame', 'Pary�').
where('Pa�ac Elizejski', 'Pary�').
where('Bazylika �w. Paw�a za Murami', 'Rzym').
where('Koloseum', 'Rzym').
where('Zamek �wi�tego Anio�a', 'Rzym').
where('Bazylika �w. Marka', 'Wenecja').
where('Pa�ac Do��w', 'Wenecja').
where('Sagrada Familia', 'Barcelona').
where('Pa�ac Kryszta�owy', 'Madryt').
where('Tower Bridge', 'Londyn').
where('Pa�ac Buckingham', 'Londyn').
where('Katedra �wi�tego Paw�a', 'Londyn').

next_to('Polska', 'Niemcy').
next_to('Niemcy', 'Francja').
next_to('Francja', 'Wielka Brytania').
next_to('Francja', 'W�ochy').
next_to('Francja', 'Hiszpania').

/*

country   C
city/town T
monument  M

*/

city_monuments(T, M) :-
  monument(M),
  where(M, T).

country_cities(C, T) :-
  location(T, C).

country_monuments(C, M) :-
  monument(M),
  where(M, T),
  location(T, C).

where_monument(M, T, C) :-
  where(M, T),
  monument(M),
  location(T, C).

neighbour(C1, C2) :-
  next_to(C1, C2);
  next_to(C2, C1).

mounuments_of_france_neighbours(M) :-
  neighbour('Francja', C), 
  location(T, C), 
  where(M, T), 
  monument(M),
  town(T),
  country(C).

mounuments_of_barcelonas_country(M) :-
  location('Barcelona', C),
  location(T, C),
  where(M, T),
  monument(M),
  country(C).
  
cities_of_countries_neighbouring_germany(T, C) :-
  neighbour('Niemcy', C),
  location(T, C).
  
are_there_monuments_in_england() :-
  location(T, 'Wielka Brytania'),
  where(M, T),
  monument(M), 
  !.

are_there_countries_neighbouring_madrids_country() :-
  location('Madryt', C),
  neighbour(N, C),
  country(N),
  !.

/*

What monuments are in Berlin?

1 ?- city_monuments('Berlin', monument).
monument = 'Brama Brandenburska' ;
monument = 'Reichstag'.

----------------------------

What cities are in Spain?

2 ?- country_cities('Hiszpania', town).
town = 'Barcelona' ;
town = 'Madryt'.

----------------------------

What monuments are in Italy?

3 ?- country_monuments('W�ochy', monument).
monument = 'Bazylika �w. Paw�a za Murami' ;
monument = 'Koloseum' ;
monument = 'Zamek �wi�tego Anio�a' ;
monument = 'Bazylika �w. Marka' ;
monument = 'Pa�ac Do��w' ;
false.

----------------------------

In which city is the Basilica of St. Paul Outside the Walls?

4 ?- where_monument('Bazylika �w. Paw�a za Murami', town, country).
town = 'Rzym',
country = 'W�ochy'.

----------------------------

What country is Sagrada Familia in?

5 ?- where_monument('Sagrada Familia', town, country).
town = 'Barcelona',
country = 'Hiszpania'.

----------------------------

What monuments can be visited in the countries neighboring France?

6 ?- mounuments_of_france_neighbours(M).
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

7 ?- mounuments_of_barcelonas_country(M).
M = 'Sagrada Familia' ;
M = 'Pa�ac Kryszta�owy'.

----------------------------

Which cities are in the countries neighboring Germany?

8 ?- cities_of_countries_neighbouring_germany(T, C).
T = 'Pary�',
C = 'Francja' ;
T = 'Warszawa',
C = 'Polska' ;
T = 'Krak�w',
C = 'Polska'.

----------------------------

Are there any monuments in the UK?

9 ?- are_there_monuments_in_england().
true.

----------------------------

Is there a country that neighbors the country in which Madrid is located?

10 ?- are_there_countries_neighbouring_madrids_country().
true.

*/
