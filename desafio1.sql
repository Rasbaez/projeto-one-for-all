DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.user(
      user_id INT PRIMARY KEY AUTOINCREMENT,
      user_name  VARCHAR(45),
      subscription_type  VARCHAR(45),
      user_age INT,
      FOREIGN KEY (subscription_type) REFERENCES SpotifyClone.subscription(subscription_type)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.subscription(
      subscription tipo restricoes,
      coluna2 tipo restricoes,
      colunaN tipo restricoes,
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.tabela1 (coluna1, coluna2)
  VALUES
    ('exemplo de dados 1', 'exemplo de dados A'),
    ('exemplo de dados 2', 'exemplo de dados B'),
    ('exemplo de dados 3', 'exemplo de dados C');

  INSERT INTO SpotifyClone.tabela2 (coluna1, coluna2)
  VALUES
    ('exemplo de dados 1', 'exemplo de dados X'),
    ('exemplo de dados 2', 'exemplo de dados Y');