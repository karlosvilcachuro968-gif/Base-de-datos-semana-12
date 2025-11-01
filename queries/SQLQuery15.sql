SELECT 
    -- CONCAT: une el número de guía con el nombre del cliente
    CONCAT('Guía ', g.numero, ' - ', c.razon_social) AS DetalleGuia,

    -- CAST: convierte la capacidad (entero) en texto para mostrarlo con unidades
    CAST(v.capacidad AS VARCHAR(10)) + ' toneladas' AS CapacidadVehiculo,

    -- CONCAT nuevamente: combina el nombre del chofer y su licencia
    CONCAT(ch.nombre, ' (Licencia: ', ch.licencia, ')') AS Chofer,

    -- CONVERT: muestra la fecha en formato DD/MM/YYYY
    CONVERT(VARCHAR(10), g.fecha, 103) AS FechaEmision,

    -- Ejemplo combinado: texto descriptivo de la ruta
    CONCAT('De ', g.origen, ' a ', g.destino, ' transportando ', g.carga) AS DescripcionViaje

FROM guia_remision g
INNER JOIN cliente c ON g.id_cliente = c.id_cliente
INNER JOIN vehiculo v ON g.id_vehiculo = v.id_vehiculo
INNER JOIN chofer ch ON g.id_chofer = ch.id_chofer;
