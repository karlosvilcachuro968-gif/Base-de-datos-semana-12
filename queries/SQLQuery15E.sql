SELECT 
    -- CONCAT: une textos o columnas
    CONCAT(Nombre, ' ', Apellido) AS NombreCompleto,

    -- LEN: devuelve la longitud del texto
    LEN(Nombre) AS LargoNombre,

    -- UPPER: convierte a mayúsculas
    UPPER(Apellido) AS ApellidoMayus,

    -- LOWER: convierte a minúsculas
    LOWER(Nombre) AS NombreMinus,

    -- CAST: convierte un tipo de dato (por ejemplo, fecha ? texto)
    CAST(FechaIngreso AS NVARCHAR(20)) AS FechaTexto,

    -- CONVERT: convierte tipo de dato con formato adicional
    CONVERT(VARCHAR(10), FechaIngreso, 103) AS FechaFormatoDDMMYYYY

FROM Empleados;