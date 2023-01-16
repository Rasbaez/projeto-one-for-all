SELECT 
    m.music_name AS nome, COUNT(r.music_id) AS reproducoes
FROM
    SpotifyClone.reproduction AS r
        INNER JOIN
    SpotifyClone.user AS u ON u.user_id = r.user_id
        INNER JOIN
    SpotifyClone.subscription AS s ON s.subscription_id = u.subscription_id
       AND (s.subscription_type = 'free' OR s.subscription_type = 'personal')
        INNER JOIN
    SpotifyClone.music AS m ON m.music_id = r.music_id
GROUP BY m.music_name
ORDER BY m.music_name;