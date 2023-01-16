SELECT 
    COUNT(u.user_id) AS quantidade_musicas_no_historico
FROM
    SpotifyClone.user AS u
        INNER JOIN
    SpotifyClone.reproduction AS r ON u.user_id = r.user_id
WHERE
    u.user_id = 1;
    