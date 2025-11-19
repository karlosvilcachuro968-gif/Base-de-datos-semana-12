CREATE TRIGGER trg_guia_insert_gasto
ON guia_remision
AFTER INSERT
AS
BEGIN
    -- por cada guía nueva insertada, registramos un gasto fijo
    INSERT INTO gasto (tipo, monto, fecha)
    SELECT 
        'Combustible' AS tipo,
        500.00 AS monto,          -- monto fijo de ejemplo
        i.fecha AS fecha          -- usamos la misma fecha de la guía
    FROM inserted i;              -- "inserted" tiene las filas recién insertadas
END;
GO