SELECT 
    usuario.user_name AS usuario,
    COUNT(r.user_id) AS qt_de_musicas_ouvidas,
    ROUND((SUM(m.seconds_duration) / 60), 2) AS total_minutos
FROM
    SpotifyClone.user AS usuario
        INNER JOIN
    SpotifyClone.reproduction AS r ON usuario.user_id = r.user_id
        INNER JOIN
    SpotifyClone.music AS m ON m.music_id = r.music_id
GROUP BY usuario.user_name
ORDER BY usuario.user_name;

