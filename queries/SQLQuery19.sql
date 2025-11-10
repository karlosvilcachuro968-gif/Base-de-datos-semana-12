BEGIN TRANSACTION;

-- insertar un nuevo cliente
INSERT INTO cliente (ruc, razon_social, direccion)
VALUES ('29999999999', 'transporte del sur sac', 'av. progreso 555 - arequipa');

-- verificar que se insertó
SELECT * FROM cliente WHERE razon_social = 'transporte del sur sac';

-- si todo está bien, confirmas los cambios:
COMMIT;

-- si algo salió mal, puedes deshacerlos:
-- ROLLBACK;