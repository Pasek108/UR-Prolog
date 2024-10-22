/*******************************************************************************

2.4 Add the rules to the Knowledge Base from task 1.3:

    - monuments_t(T), which prints on the screen all monuments located in
      city T (each on a separate line).
    - monuments_tc(T), which prints on the screen all monuments located in
      city T (each on a separate line, including the name of the city and country).
    - monuments_c(C), which prints on the screen all monuments located in
      country C (each on a separate line).
    - monuments_cn(C), which lists on the screen all monuments located in
      country C (each on a separate line, including the name of the city
      and country) and in neighboring countries.

Note: In all cases, the rules are always intended to succeed.

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
  
  

monuments_t(T) :-
    town(T),
    monument(M),
    where(M, T),
    writeln(M),
    fail.

monuments_t(_).

/*

1 ?- monuments_t('Krak�w').
Wawel
Sukiennice
Ko�ci� Mariacki
true.

*/

monuments_tc(T) :-
    country(C),
    town(T),
    monument(M),
    location(T, C),
    where(M, T),
    write(C), tab(1), write(T), tab(1), writeln(M),
    fail.

monuments_tc(_).

/*

2 ?- monuments_tc('Krak�w').
Polska Krak�w Wawel
Polska Krak�w Sukiennice
Polska Krak�w Ko�ci� Mariacki
true.

*/

monuments_c(C) :-
    country(C),
    town(T),
    monument(M),
    where(M, T),
    location(T, C),
    writeln(M),
    fail.

monuments_c(_).

/*

3 ?- monuments_c('Polska').
Pa�ac w Wilanowie
Kolumna Zygmunta III Wazy
Wawel
Sukiennice
Ko�ci� Mariacki
true.

*/

monuments_cn(C) :-  
    country(C),
    (
      town(T),
      monument(M),
      where(M, T),
      location(T, C),
      write(C), tab(1), write(T), tab(1), writeln(M),
      fail
    );
    (
      next_to(C, N),
      town(TN),
      monument(MN),
      where(MN, TN),
      location(TN, N),
      write(N), tab(1), write(TN), tab(1), writeln(MN),
      fail
    ).

monuments_cn(_).

/*

4 ?- monuments_cn('Polska').
Polska Warszawa Pa�ac w Wilanowie
Polska Warszawa Kolumna Zygmunta III Wazy
Polska Krak�w Wawel
Polska Krak�w Sukiennice
Polska Krak�w Ko�ci� Mariacki
Niemcy Berlin Brama Brandenburska
Niemcy Berlin Reichstag
true.

*/
