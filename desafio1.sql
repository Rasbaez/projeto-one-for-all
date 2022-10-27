DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

   CREATE TABLE SpotifyClone.subscription(
      subscription_id INT PRIMARY KEY AUTO_INCREMENT,
      subscription_type VARCHAR(45) NOT NULL,
      subscription_value DECIMAL(5,2) NOT NULL
  ) engine = InnoDB;
  

   CREATE TABLE SpotifyClone.user(
      user_id INT PRIMARY KEY AUTO_INCREMENT,
      user_name VARCHAR(45) NOT NULL,
      user_age INT,
      subscription_id INT NOT NULL,
      subscription_date DATE NOT NULL,
      FOREIGN KEY (subscription_id) REFERENCES SpotifyClone.subscription (subscription_id)
  ) engine = InnoDB;
  
  
  CREATE TABLE SpotifyClone.artist(
      artist_id INT PRIMARY KEY AUTO_INCREMENT,
      artist_name VARCHAR(200) NOT NULL
  ) engine = InnoDB;


  
CREATE TABLE SpotifyClone.album(
    album_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    album_name VARCHAR(200) NOT NULL,
    release_year VARCHAR(4) NOT NULL,
    artist_id INT,
     FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist(artist_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.music(
    music_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    music_name VARCHAR(200) NOT NULL,
    album_id INT NOT NULL,
    seconds_duration INT,
    release_year VARCHAR(4),
    FOREIGN KEY (album_id) REFERENCES SpotifyClone.album(album_id)
  ) engine = InnoDB;


   CREATE TABLE SpotifyClone.reproduction(
      music_id INT NOT NULL,
      user_id INT NOT NULL,
      reproduction_date DATETIME NOT NULL,
      CONSTRAINT PRIMARY KEY (user_id, music_id),
      FOREIGN KEY (user_id) REFERENCES SpotifyClone.user(user_id),
      FOREIGN KEY (music_id) REFERENCES SpotifyClone.music(music_id)
  ) engine = InnoDB;
  

  CREATE TABLE SpotifyClone.folow(
     artist_id INT NOT NULL,
     user_id INT NOT NULL,
     artist_name VARCHAR(45) NOT NULL,
     CONSTRAINT PRIMARY KEY(user_id, artist_id),
       FOREIGN KEY (user_id) REFERENCES SpotifyClone.user(user_id),
       FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist(artist_id)
  ) engine = InnoDB;
 
  
  
  INSERT INTO SpotifyClone.subscription (subscription_id, subscription_type, subscription_value)
   VALUES
    (1, 'free', 0.00),
    (2, 'familiar', 7.99),
    (3, 'university', 5.99),
    (4, 'personal', 6.99);


  INSERT INTO SpotifyClone.user (user_id, user_name, user_age, subscription_id, subscription_date)
   VALUES
    (1, 'Barbara Liskov', 34, 1, '2019-10-20'),
    (2, 'Robert Cecil Martin', 25, 1, '2017-01-06'),
    (3, 'Ada Lovelace', 60, 2, '2017-12-30'),
    (4, 'Martin Fowler', 60, 2, '2017-01-17'),
    (5, 'Sandi Metz', 60, 2, '2018-04-29'),
    (6, 'Paulo Freire', 60, 3, '2018-02-14'),
    (7, 'Bell Hooks', 60, 3, '2018-01-05'),
    (8, 'Christopher Alexander', 60, 4, '2019-06-05'),
    (9, 'Judith Butler', 60, 4, '2020-05-13'),
    (10, 'Jorge Amado', 60, 4, '2017-02-17');
    


INSERT INTO SpotifyClone.artist(artist_id, artist_name)
  VALUES 
    (1, 'Beyoncé'),
    (2, 'Queen'),
    (3, 'Elis Regina'),
    (4, 'Baco Exu do Blues'),
    (5, 'Blind Guardian'),
    (6, 'Nina Simone');


INSERT INTO SpotifyClone.album(album_id, album_name, release_year, artist_id)
  VALUES 
    (1, 'Renaissance', '2022', 1),
    (2, 'Jazz', '1978', 2),
    (3, 'Hot Space', '1982', 2),
    (4, 'Falso Brilhante', '1998', 3),
    (5, 'Vento de Maio', '2001', 3),
    (6, 'QVVJFA?', '1991', 4),
    (7, 'Somewhere Far Beyond', '2007', 5),
    (8, 'I Put A Spell On You', '2012', 6);


INSERT INTO SpotifyClone.music(music_id, music_name, album_id, seconds_duration, release_year)
  VALUES
    (1, 'VIRGOS GROOVE', 1, 369, '2022'),
    (2, 'Dont Stop me Now', 2, 203, '1978'),
    (3, 'Under Pressure', 3, 152, '1982'),
    (4, 'Como Nossos Pais', 4, 105, '1998'),
    (5, 'O modelo de Amar è o Medo de Ser Livre', 5, 207, '2001'),
    (6, 'Samba em Paris', 6, 267, '2003'),
    (7, 'The Bards Song', 7, 244, '2007' ),
    (8, "Feeling Good", 8, 100, '2012'),
    (9, 'BREAK MY SOUL', 1, 279, '2022'),
    (10, 'ALIEN SUPERSTAR', 1, 116, '2022');



  INSERT INTO SpotifyClone.reproduction (music_id, user_id, reproduction_date)
   VALUES
    (6, 1, "2022-02-28 10:45:55"),
    (1, 1, "2020-05-02 05:30:35"),
    (8, 1, "2020-03-06 11:22:33"),
    (8, 2, "2022-08-05 08:05:17"),
    (5, 2, "2020-01-02 07:40:33"),
    (8, 3, "2020-11-13 16:55:13"),
    (1, 3, "2020-12-05 18:38:30"),
    (6, 4, "2021-08-15 17:10:10"),
    (6, 5, "2022-01-09 01:44:33"),
    (3, 5, "2020-08-06 15:23:43"),
    (5, 6, "2017-01-24 00:31:17"),
    (9, 6, "2017-10-12 12:35:20"),
    (2, 7, "2011-12-15 22:30:49"),
    (2, 8, "2012-03-17 14:56:41"),
    (7, 9, "2022-02-24 21:14:22"),
    (10, 10,"2015-12-13 08:30:22");   

  INSERT INTO SpotifyClone.folow (artist_id, user_id, artist_name)
  VALUES
    (1, 1, 'Beyoncé'),
    (2, 1, 'Queen'),
    (3, 1, 'Elis Regina'),
    (1, 2, 'Beyoncé'),
    (3, 2, 'Elis Regina'),
    (2, 3, 'Queen'),
    (4, 4, 'Baco Exu do Blues'),
    (5, 5, 'Blind Guardian'),
    (6, 5, 'Nina Simone'),
    (6, 6, 'Nina Simone'),
    (1, 6, 'Beyoncé'),
    (6, 7, 'Nina Simone'),
    (3, 9, 'Elis Regina'),
    (2, 10, 'Queen');



  

    

    
