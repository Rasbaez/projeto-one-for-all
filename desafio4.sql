SELECT 
    u.user_name AS usuario,
    CASE
        WHEN MAX(r.reproduction_date) > '2020-12-31' THEN 'Usuário ativo'
        WHEN MAX(r.reproduction_date) < '2020-12-31' THEN 'Usuário inativo'
    END AS status_usuario
FROM
    SpotifyClone.`user` AS u
        INNER JOIN
    SpotifyClone.reproduction AS r ON u.user_id = r.user_id
GROUP BY usuario
ORDER BY usuario;