USE Vilcal;
GO

DECLARE 
    @nombre VARCHAR(100),
    @experiencia INT;

-- 1. Declarar el cursor
DECLARE cur_choferes CURSOR FOR
SELECT nombre, experiencia FROM chofer;

-- 2. Abrir el cursor
OPEN cur_choferes;

-- 3. Leer la primera fila
FETCH NEXT FROM cur_choferes INTO @nombre, @experiencia;

-- 4. Recorrer fila por fila
WHILE @@FETCH_STATUS = 0
BEGIN
    IF @experiencia > 9
        PRINT CONCAT(@nombre, ' → Chofer experimentado');
    ELSE IF @experiencia BETWEEN 5 AND 9
        PRINT CONCAT(@nombre, ' → Chofer con experiencia media');
    ELSE
        PRINT CONCAT(@nombre, ' → Chofer novato');

    -- Leer siguiente registro
    FETCH NEXT FROM cur_choferes INTO @nombre, @experiencia;
END;

-- 5. Cerrar y liberar el cursor
CLOSE cur_choferes;
DEALLOCATE cur_choferes;