-- 3. Tendencia de piezas por sets a lo largo de los a�os
-- Analiza c�mo ha evolucionado la cantidad de piezas incluidas en los sets de LEGO a trav�s del tiempo.

SELECT year, SUM(num_parts) AS cantidad_piezas
FROM sets
GROUP BY year
ORDER BY year;
