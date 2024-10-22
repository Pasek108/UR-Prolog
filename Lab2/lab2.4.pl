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
country('W³ochy').
country('Hiszpania').
country('Wielka Brytania').

town('Warszawa').
town('Kraków').
town('Berlin').
town('Pary¿').
town('Rzym').
town('Wenecja').
town('Barcelona').
town('Madryt').
town('Londyn').

location('Warszawa', 'Polska').
location('Kraków', 'Polska').
location('Berlin', 'Niemcy').
location('Pary¿', 'Francja').
location('Rzym', 'W³ochy').
location('Wenecja', 'W³ochy').
location('Barcelona', 'Hiszpania').
location('Madryt', 'Hiszpania').
location('Londyn', 'Wielka Brytania').

monument('Pa³ac w Wilanowie').
monument('Kolumna Zygmunta III Wazy').
monument('Wawel').
monument('Sukiennice').
monument('Koœció³ Mariacki').
monument('Brama Brandenburska').
monument('Reichstag').
monument('Wie¿a Eiffla').
monument('Katedra Notre-Dame').
monument('Pa³ac Elizejski').
monument('Bazylika œw. Paw³a za Murami').
monument('Koloseum').
monument('Zamek Œwiêtego Anio³a').
monument('Bazylika œw. Marka').
monument('Pa³ac Do¿ów').
monument('Sagrada Familia').
monument('Pa³ac Kryszta³owy').
monument('Tower Bridge').
monument('Pa³ac Buckingham').
monument('Katedra Œwiêtego Paw³a').

where('Pa³ac w Wilanowie', 'Warszawa').
where('Kolumna Zygmunta III Wazy', 'Warszawa').
where('Wawel', 'Kraków').
where('Sukiennice', 'Kraków').
where('Koœció³ Mariacki', 'Kraków').
where('Brama Brandenburska', 'Berlin').
where('Reichstag', 'Berlin').
where('Wie¿a Eiffla', 'Pary¿').
where('Katedra Notre-Dame', 'Pary¿').
where('Pa³ac Elizejski', 'Pary¿').
where('Bazylika œw. Paw³a za Murami', 'Rzym').
where('Koloseum', 'Rzym').
where('Zamek Œwiêtego Anio³a', 'Rzym').
where('Bazylika œw. Marka', 'Wenecja').
where('Pa³ac Do¿ów', 'Wenecja').
where('Sagrada Familia', 'Barcelona').
where('Pa³ac Kryszta³owy', 'Madryt').
where('Tower Bridge', 'Londyn').
where('Pa³ac Buckingham', 'Londyn').
where('Katedra Œwiêtego Paw³a', 'Londyn').

next_to('Polska', 'Niemcy').
next_to('Niemcy', 'Francja').
next_to('Francja', 'Wielka Brytania').
next_to('Francja', 'W³ochy').
next_to('Francja', 'Hiszpania').
  
  

monuments_t(T) :-
    town(T),
    monument(M),
    where(M, T),
    writeln(M),
    fail.

monuments_t(_).

/*

1 ?- monuments_t('Kraków').
Wawel
Sukiennice
Koœció³ Mariacki
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

2 ?- monuments_tc('Kraków').
Polska Kraków Wawel
Polska Kraków Sukiennice
Polska Kraków Koœció³ Mariacki
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
Pa³ac w Wilanowie
Kolumna Zygmunta III Wazy
Wawel
Sukiennice
Koœció³ Mariacki
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
Polska Warszawa Pa³ac w Wilanowie
Polska Warszawa Kolumna Zygmunta III Wazy
Polska Kraków Wawel
Polska Kraków Sukiennice
Polska Kraków Koœció³ Mariacki
Niemcy Berlin Brama Brandenburska
Niemcy Berlin Reichstag
true.

*/
