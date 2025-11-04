sp_help chofer;
DECLARE cursor_choferes CURSOR FOR
SELECT nombre
FROM chofer;

DECLARE @nombre VARCHAR(100);

OPEN cursor_choferes;

FETCH NEXT FROM cursor_choferes INTO @nombre;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Chofer: ' + @nombre;
    FETCH NEXT FROM cursor_choferes INTO @nombre;
END

CLOSE cursor_choferes;
DEALLOCATE cursor_choferes;