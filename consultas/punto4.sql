--4. Temáticas más populares de los 2000
--Identifica cuáles fueron las temáticas de sets más populares durante la década de los 2000.
-- Seleccionar la temática y contar la cantidad de sets para la década del 2000 al 2009:
SELECT t.name AS tematica, COUNT(s.set_num) AS cantidad_sets
FROM themes t
JOIN sets s ON t.id = s.theme_id
WHERE s.year BETWEEN 2000 AND 2009
GROUP BY t.name
ORDER BY cantidad_sets DESC;
