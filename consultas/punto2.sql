-- 2. Colores únicos en toda la base de datos

SELECT COUNT(DISTINCT CONCAT(name, rgb, is_trans)) AS cantidad_colores_unicos
FROM colors;

SELECT DISTINCT name, rgb, is_trans
FROM colors;


