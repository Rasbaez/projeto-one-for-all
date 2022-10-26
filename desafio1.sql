DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

   CREATE TABLE SpotifyClone.subscription(
      subscription_id INT PRIMARY KEY AUTO_INCREMENT,
      subscription_type VARCHAR(45) NOT NULL,
      subscription_value DOUBLE NOT NULL
  ) engine = InnoDB;
  

   CREATE TABLE SpotifyClone.user(
      user_id INT PRIMARY KEY AUTO_INCREMENT,
      user_name VARCHAR(45) NOT NULL,
      user_age INT,
      subscription_id INT NOT NULL,
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
    (1, 'free', 0),
    (2, 'familiar', 7.99),
    (3, 'university', 5.99),
    (4, 'personal', 6.99);


  INSERT INTO SpotifyClone.user (user_id, user_name, user_age, subscription_id)
   VALUES
    (1, 'Barbara Liskov', 34, 1),
    (2, 'Robert Cecil Martin', 25, 2),
    (3, 'Ada Lovelace', 60, 3),
    (4, 'Sandi Metz', 60, 3),
    (5, 'Paulo Freire', 60, 3),
    (6, 'Bell Hooks', 60, 3),
    (7, 'Christopher Alexander', 60, 3),
    (8, 'Judith Butler', 60, 3),
    (9, 'Jorge Amado', 60, 3),
    (10, 'Ada Lovelace', 60, 3);
    

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
    (1, 'VIRGOS GROOVE', 1, 116, '2022'),
    (2, 'Dont Stop me Now', 2, 203, '1978'),
    (3, 'Under Pressure', 3, 152, '1982'),
    (4, 'Como Nossos Pais', 4, 105, '1998'),
    (5, 'O modelo de Amar è o Medo de Ser Livre', 5, 207, '2001'),
    (6, 'Samba em Paris', 6, 267, '2003'),
    (7, 'The Bards Song', 7, 244, '2007' ),
    (8, "Feeling Good", 8, 100, '2012'),
    (9, 'BREAK MY SOUL', 1, 279, '2022'),
    (10, 'ALIEN SUPERSTAR', 1, 369, '2022');



  INSERT INTO SpotifyClone.reproduction (music_id, user_id, reproduction_date)
   VALUES
    (1, 1, "2022-03-06 09:22:33"),
    (2, 2, "2020-03-04 14:12:53"),
    (3, 3, "2022-10-12 10:17:26"),
    (3, 1, "2018-11-05 11:17:26"),
    (4, 1, "2019-03-12 13:22:36"),
    (6, 1, "2020-09-21 11:17:26"),
    (7, 4, "2022-02-20 12:18:26"),
    (8, 1, "2021-02-22 16:12:26"),
    (6, 2, "2022-06-14 09:11:26"),
    (5, 4, "2021-02-17 04:17:26"),
    (10, 5, "2021-11-26 01:17:50"),
    (10, 9, "2020-01-10 14:12:23"),
    (8, 7,  "2015-09-12 12:17:21"),
    (1, 10, "2016-02-09 14:11:26"),
    (3, 4, "2019-02-23 17:17:16"),
    (4,4, "2022-09-06 13:12:28");
    

  INSERT INTO SpotifyClone.folow (artist_id, user_id, artist_name)
  VALUES
   (2, 10, 'Beyoncé'),
   (3, 8, 'Elis Regina'),
   (6, 1, 'Nina Simone'),
   (5, 4, 'Blind Guardian'),
   (6, 6, 'Nina Simone'),
   (1, 4, 'Beyoncé'),
   (2, 4, 'Queen'),
   (4, 2, 'Baco Exu do Blues'),
   (6, 9, 'Nina Simone'),
   (5, 8, 'Blind Guardian'),
   (3, 3, 'Elis Regina'),
   (2, 6, 'Queen'),
   (5, 10, 'Blind Guardian'),
   (2, 1, 'Queen');


  

    

    
