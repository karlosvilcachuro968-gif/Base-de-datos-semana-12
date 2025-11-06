-- Cursor para actualizar estado de vehículos según capacidad
DECLARE @id_vehiculo INT;
DECLARE @capacidad INT;

DECLARE vehiculo_cursor CURSOR FOR
SELECT id_vehiculo, capacidad FROM vehiculo;

OPEN vehiculo_cursor;

FETCH NEXT FROM vehiculo_cursor INTO @id_vehiculo, @capacidad;

WHILE @@FETCH_STATUS = 0
BEGIN
    IF @capacidad < 25
    BEGIN
        UPDATE vehiculo
        SET estado = 0
        WHERE id_vehiculo = @id_vehiculo;

        PRINT 'Vehículo ID ' + CAST(@id_vehiculo AS VARCHAR) + ' marcado como inactivo.';
    END
    ELSE
    BEGIN
        PRINT 'Vehículo ID ' + CAST(@id_vehiculo AS VARCHAR) + ' permanece activo.';
    END

    FETCH NEXT FROM vehiculo_cursor INTO @id_vehiculo, @capacidad;
END

CLOSE vehiculo_cursor;
DEALLOCATE vehiculo_cursor;