--Consigna 1 del tp
--1. Colores más utilizados en los 90
--Identifica cuáles son los 10 colores más frecuentemente usados en los sets de LEGO durante la
--década de los 90

-- 1. Selección de Sets en la década de los 90:

SELECT set_num, name, year, theme_id, num_parts
FROM sets
WHERE year BETWEEN 1990 AND 1999
ORDER BY year;

-- 2. Información Detallada con Colores de la Década de los 90:

SELECT s.set_num, s.name, s.year, s.theme_id, s.num_parts, i.version,c.id,c.name
FROM sets s
JOIN inventories i ON s.set_num = i.set_num
JOIN inventory_parts k ON k.inventory_id = i.id
JOIN colors c ON c.id = k.color_id
WHERE s.year BETWEEN 1990 AND 1999
ORDER BY s.year;

-- 3. Top 10 Colores más Frecuentes en Sets de la Década de los 90:

SELECT TOP (10) c.id AS color_id, c.name AS color_name, COUNT(*) AS color_count
FROM sets s
JOIN inventories i ON s.set_num = i.set_num
JOIN inventory_parts k ON k.inventory_id = i.id
JOIN colors c ON c.id = k.color_id
WHERE s.year BETWEEN 1990 AND 1999
GROUP BY c.id, c.name
ORDER BY color_count DESC







