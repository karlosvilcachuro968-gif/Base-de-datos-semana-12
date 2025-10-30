-- ?? 1. Mostrar guías de clientes específicos usando IN
SELECT 
    g.numero,
    c.razon_social,
    g.fecha
FROM guia_remision g
INNER JOIN cliente c ON g.id_cliente = c.id_cliente
WHERE c.razon_social IN ('Constructora Andina SAC', 'Agroexportadora Sur EIRL', 'Minera Santa Rosa');
-- Muestra solo las guías de esos tres clientes específicos


-- ? 2. Mostrar clientes que SÍ tienen guías registradas usando EXISTS
SELECT 
    c.razon_social
FROM cliente c
WHERE EXISTS (
    SELECT 1 
    FROM guia_remision g
    WHERE g.id_cliente = c.id_cliente
);
-- EXISTS devuelve TRUE si el cliente tiene al menos una guía en la tabla guia_remision


-- ?? 3. Extraer el día, mes y año de las fechas de las guías
SELECT 
    g.numero,
    DAY(g.fecha) AS Dia,
    MONTH(g.fecha) AS Mes,
    YEAR(g.fecha) AS Año
FROM guia_remision g;
-- DAY, MONTH y YEAR permiten descomponer la fecha en partes


-- ? 4. Usar GETDATE y DATEADD para calcular una fecha futura (ejemplo: +7 días desde hoy)
SELECT 
    GETDATE() AS FechaActual,
    DATEADD(DAY, 7, GETDATE()) AS FechaMas7Dias;
-- DATEADD(DAY, 7, fecha) suma 7 días a la fecha actual


-- ? 5. Usar DATEDIFF para calcular cuántos días pasaron desde la fecha de la guía hasta hoy
SELECT 
    g.numero,
    g.fecha,
    DATEDIFF(DAY, g.fecha, GETDATE()) AS Dias_Transcurridos
FROM guia_remision g;
-- DATEDIFF devuelve la cantidad de días entre la fecha de la guía y la fecha actual