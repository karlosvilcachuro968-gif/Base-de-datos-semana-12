 -- Resumen de gastos
SELECT 
    COUNT(*) AS total_gastos,
    SUM(monto) AS monto_total_gastos,
    AVG(monto) AS promedio_gasto,
    MAX(monto) AS gasto_maximo,
    MIN(monto) AS gasto_minimo
FROM gasto;

-- Resumen de ingresos
SELECT 
    COUNT(*) AS total_ingresos,
    SUM(monto) AS monto_total_ingresos,
    AVG(monto) AS promedio_ingreso,
    MAX(monto) AS ingreso_maximo,
    MIN(monto) AS ingreso_minimo
FROM ingreso;

-- Estadísticas de capacidad de vehículos
SELECT 
    AVG(capacidad) AS promedio_capacidad,
    MAX(capacidad) AS mayor_capacidad,
    MIN(capacidad) AS menor_capacidad
FROM vehiculo;

-- Cantidad de vehículos por estado
SELECT 
    CASE WHEN estado = 1 THEN 'Activo' ELSE 'Inactivo' END AS estado_vehiculo,
    COUNT(*) AS cantidad
FROM vehiculo
GROUP BY estado;

-- Resumen de choferes
SELECT 
    COUNT(*) AS total_choferes,
    AVG(experiencia) AS promedio_experiencia,
    MAX(experiencia) AS mas_experimentado,
    MIN(experiencia) AS menos_experimentado
FROM chofer;

-- Cantidad de guías por cliente
SELECT 
    c.razon_social,
    COUNT(g.id_guia) AS cantidad_guias
FROM guia_remision g
INNER JOIN cliente c ON g.id_cliente = c.id_cliente
GROUP BY c.razon_social
ORDER BY cantidad_guias DESC;

-- Cantidad de guías por vehículo
SELECT 
    v.placa,
    COUNT(g.id_guia) AS cantidad_guias
FROM guia_remision g
INNER JOIN vehiculo v ON g.id_vehiculo = v.id_vehiculo
GROUP BY v.placa;

-- Balance actual (ingresos - gastos)
SELECT 
    COALESCE((SELECT SUM(monto) FROM ingreso),0) 
    - COALESCE((SELECT SUM(monto) FROM gasto),0) AS balance_actual;
