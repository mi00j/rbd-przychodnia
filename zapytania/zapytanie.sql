select sel1.DANE, sel1.NAZWA, count(*) as LICZBA_WIZYT from 
(select 
concat (l.IMIE,' ', l.NAZWISKO) as DANE,
s.NAZWA as NAZWA, 
o.WARTOSC as OCENA, 
w.DATA as DATA_WIZYTY
from
wizyta w
inner join OCENA o on w.ID_OCENY = o.ID_OCENY
inner join LEKARZ l on w.ID_LEKARZA = l.ID_LEKARZA
inner join PACJENT p on w.ID_PACJENTA = p.ID_PACJENTA
inner join SPECJALIZACJA s on l.ID_SPECJALIZACJI = s.ID_SPECJALIZACJI
where 
p.WIEK < 80 and 
o.WARTOSC > 
	(select 
	avg(o1.WARTOSC)
	from 
	WIZYTA w1 
	inner join OCENA o1 on w1.ID_OCENY = o1.ID_OCENY)) as sel1
group by DANE, NAZWA
order by "LICZBA_WIZYT" desc;