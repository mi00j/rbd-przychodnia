create view
dbo.SREDNIA_VIEW WITH SCHEMABINDING  
as
select avg(o.WARTOSC) AS SREDNIA
from dbo.WIZYTA w
inner join dbo.OCENA o on w.ID_OCENY = o.ID_OCENY;



select sel1."DANE", sel1."NAZWA", count(*) as "LICZBA_WIZYT" from 
(select concat (l.IMIE,' ', l.NAZWISKO) as DANE, s.NAZWA as NAZWA, o.WARTOSC as OCENA, w.DATA as DATA_WIZYTY
	from wizyta w
	inner join OCENA o on w.ID_OCENY = o.ID_OCENY
	inner join LEKARZ l on w.ID_LEKARZA = l.ID_LEKARZA
	inner join PACJENT p on w.ID_PACJENTA = p.ID_PACJENTA
	inner join SPECJALIZACJA s on l.ID_SPECJALIZACJI = s.ID_SPECJALIZACJI

	where o.WARTOSC > (select SREDNIA from SREDNIA_VIEW) and p.WIEK < 80
)as sel1
group by "DANE", "NAZWA"
order by "LICZBA_WIZYT" desc;