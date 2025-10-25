SELECT 
    c.razon_social,
    COUNT(g.id_guia) AS total_guias
FROM guia_remision g
INNER JOIN cliente c ON g.id_cliente = c.id_cliente
GROUP BY c.razon_social;

SELECT 
    c.razon_social,
    COUNT(g.id_guia) AS total_guias
FROM guia_remision g
INNER JOIN cliente c ON g.id_cliente = c.id_cliente
GROUP BY c.razon_social
HAVING COUNT(g.id_guia) > 2;

SELECT 
    ch.nombre AS chofer,
    COUNT(g.id_guia) AS total_guias
FROM guia_remision g
INNER JOIN chofer ch ON g.id_chofer = ch.id_chofer
GROUP BY ch.nombre
HAVING COUNT(g.id_guia) >= 3;