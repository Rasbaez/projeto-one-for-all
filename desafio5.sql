SELECT 
    m.music_name AS cancao,
    COUNT(r.music_id) AS reproducoes
FROM SpotifyClone.music AS m
	INNER JOIN SpotifyClone.reproduction AS r ON m.music_id = r.music_id
  GROUP BY r.music_id
  ORDER BY reproducoes DESC
  LIMIT 2;  

