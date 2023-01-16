SELECT 
    a.artist_name AS artista,
    ab.album_name AS album,
    COUNT(f.artist_id) AS seguidores
FROM
    SpotifyClone.artist AS a
        INNER JOIN
    SpotifyClone.album AS ab ON a.artist_id = ab.artist_id
		INNER JOIN
    SpotifyClone.folow AS f ON f.artist_id = a.artist_id
    GROUP BY ab.album_id
    ORDER BY seguidores DESC, artista, album;