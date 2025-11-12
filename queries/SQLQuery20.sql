USE vilcal;
GO

BEGIN TRY
    BEGIN TRANSACTION;  -- 🔹 Inicia la transacción

    DECLARE @idCliente INT, @idVehiculo INT, @idChofer INT, @idGuia INT;

    -- Asignamos valores de prueba (suponiendo que ya existen los registros base)
    SET @idCliente = 1;
    SET @idVehiculo = 1;
    SET @idChofer = 1;

    -- 1️⃣ Insertar nueva guía de remisión
    INSERT INTO guia_remision (numero, id_cliente, id_vehiculo, id_chofer, origen, destino, carga, fecha)
    VALUES ('GR-2025-001', @idCliente, @idVehiculo, @idChofer, 'Arequipa', 'Lima', 'Paquetes varios', GETDATE());

    -- Guardamos el ID generado automáticamente
    SET @idGuia = SCOPE_IDENTITY();

    -- 2️⃣ Insertar un gasto asociado
    INSERT INTO gasto (tipo, monto, fecha)
    VALUES ('Combustible - Guía ' + CAST(@idGuia AS VARCHAR(10)), 350.00, GETDATE());

    -- 3️⃣ Confirmar los cambios
    COMMIT TRANSACTION;
    PRINT '✅ Transacción completada: Guía y gasto registrados correctamente.';

END TRY
BEGIN CATCH
    --  Si ocurre un error, revertir los cambios
    ROLLBACK TRANSACTION;
    PRINT ' Error en la transacción. Se realizó rollback.';
    PRINT ERROR_MESSAGE();
END CATCH;