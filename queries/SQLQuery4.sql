SELECT c.id_cliente, c.razon_social
FROM cliente c
WHERE EXISTS (
    SELECT 1
    FROM guia_remision g
    WHERE g.id_cliente = c.id_cliente
);


SELECT ch.id_chofer, ch.nombre
FROM chofer ch
WHERE NOT EXISTS (
    SELECT 1
    FROM guia_remision g
    WHERE g.id_chofer = ch.id_chofer
);