-- ?? 1. Mostrar gu�as de clientes espec�ficos usando IN
SELECT 
    g.numero,
    c.razon_social,
    g.fecha
FROM guia_remision g
INNER JOIN cliente c ON g.id_cliente = c.id_cliente
WHERE c.razon_social IN ('Constructora Andina SAC', 'Agroexportadora Sur EIRL', 'Minera Santa Rosa');
-- Muestra solo las gu�as de esos tres clientes espec�ficos


-- ? 2. Mostrar clientes que S� tienen gu�as registradas usando EXISTS
SELECT 
    c.razon_social
FROM cliente c
WHERE EXISTS (
    SELECT 1 
    FROM guia_remision g
    WHERE g.id_cliente = c.id_cliente
);
-- EXISTS devuelve TRUE si el cliente tiene al menos una gu�a en la tabla guia_remision


-- ?? 3. Extraer el d�a, mes y a�o de las fechas de las gu�as
SELECT 
    g.numero,
    DAY(g.fecha) AS Dia,
    MONTH(g.fecha) AS Mes,
    YEAR(g.fecha) AS A�o
FROM guia_remision g;
-- DAY, MONTH y YEAR permiten descomponer la fecha en partes


-- ? 4. Usar GETDATE y DATEADD para calcular una fecha futura (ejemplo: +7 d�as desde hoy)
SELECT 
    GETDATE() AS FechaActual,
    DATEADD(DAY, 7, GETDATE()) AS FechaMas7Dias;
-- DATEADD(DAY, 7, fecha) suma 7 d�as a la fecha actual


-- ? 5. Usar DATEDIFF para calcular cu�ntos d�as pasaron desde la fecha de la gu�a hasta hoy
SELECT 
    g.numero,
    g.fecha,
    DATEDIFF(DAY, g.fecha, GETDATE()) AS Dias_Transcurridos
FROM guia_remision g;
-- DATEDIFF devuelve la cantidad de d�as entre la fecha de la gu�a y la fecha actual