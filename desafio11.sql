  -- fonte => https://www.geeksforgeeks.org/mysql-regular-expressions-regexp/
  SELECT 
	m.music_name AS nome_musica,
    CASE
	  WHEN m.music_name LIKE '%Bard%' THEN REPLACE(m.music_name, 'Bard', 'QA')
      WHEN m.music_name LIKE '%Amar%' THEN REPLACE(m.music_name, 'Amar', 'Code Review')
      WHEN m.music_name LIKE '%Pais%' THEN REPLACE(m.music_name, 'Pais', 'Pull Requests')
      WHEN m.music_name LIKE '%SOUL%' THEN REPLACE(m.music_name, 'SOUL', 'CODE')
      WHEN m.music_name LIKE '%SUPERSTAR%' THEN REPLACE(m.music_name, 'SUPERSTAR', 'SUPERDEV')
    END AS novo_nome
  FROM SpotifyClone.music AS m
  WHERE 
	m.music_name REGEXP 'Bard|Amar|Pais|SOUL|SUPERSTAR'
  ORDER BY m.music_name DESC;  