--4. Tem�ticas m�s populares de los 2000
--Identifica cu�les fueron las tem�ticas de sets m�s populares durante la d�cada de los 2000.
-- Seleccionar la tem�tica y contar la cantidad de sets para la d�cada del 2000 al 2009:
SELECT t.name AS tematica, COUNT(s.set_num) AS cantidad_sets
FROM themes t
JOIN sets s ON t.id = s.theme_id
WHERE s.year BETWEEN 2000 AND 2009
GROUP BY t.name
ORDER BY cantidad_sets DESC;
