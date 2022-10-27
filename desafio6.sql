SELECT 
	MIN(s.subscription_value) AS faturamento_minimo,
    MAX(s.subscription_value) AS faturamento_maximo,
    ROUND(AVG(s.subscription_value), 2) AS faturamento_medio,
    SUM(s.subscription_value) AS faturamento_total
 FROM SpotifyClone.subscription AS s
 INNER JOIN SpotifyClone.`user` AS u ON u.subscription_id = s.subscription_id;   
