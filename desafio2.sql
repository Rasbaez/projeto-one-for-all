SELECT 
    COUNT(DISTINCT m.music_id) AS cancoes,
    COUNT(DISTINCT a.artist_id) AS artistas,
    COUNT(DISTINCT b.album_name) AS albuns
FROM
    SpotifyClone.music AS m,
    SpotifyClone.artist AS a,
    SpotifyClone.album AS b; 