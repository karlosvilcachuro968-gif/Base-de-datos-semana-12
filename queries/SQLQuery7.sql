
SELECT *
FROM (
    SELECT 
        FORMAT(fecha, 'yyyy-MM') AS Mes,
        tipo,
        monto
    FROM gasto
) AS src
PIVOT (
    SUM(monto)
    FOR tipo IN ([Combustible], [Peajes], [Mantenimiento], [Otros])
) AS pvt;

-- Limpio gastos antes de 2023
DELETE FROM gasto
WHERE fecha < '2023-01-01';

-- Reporte de gastos actuales
SELECT *
FROM (
    SELECT 
        FORMAT(fecha, 'yyyy-MM') AS Mes,
        tipo,
        monto
    FROM gasto
    WHERE fecha >= '2023-01-01'
) AS src
PIVOT (
    SUM(monto)
    FOR tipo IN ([Combustible], [Peajes], [Mantenimiento])
) AS pvt;
