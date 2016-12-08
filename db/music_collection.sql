DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists (
id  serial8 primary key,
name varchar(255)
);

CREATE TABLE albums (
id  serial8 primary key,
title varchar(255),
num_songs INT8,
year INT8,
genre varchar(255),
artist_id INT references artists(id)
);

INSERT INTO artists (name) VALUES ('ZZ Top');
INSERT INTO artists (name) VALUES ('Prince');
INSERT INTO artists (name) VALUES ('Lady Gaga');
INSERT INTO albums (title, num_songs, year, genre, artist_id) VALUES ('Eliminator', 11, 1983, 'Rock',1);
INSERT INTO albums (title, num_songs, year, genre, artist_id) VALUES ('La Futura', 13, 2012, 'Rock',1);

INSERT INTO albums (title, num_songs, year, genre, artist_id) VALUES ('Afterburner', 10, 1985, 'Rock',1);
INSERT INTO albums (title, num_songs, year, genre, artist_id) VALUES ('Purple Rain', 9, 1984, 'Rock',2);

INSERT INTO albums (title, num_songs, year, genre, artist_id) VALUES ('The Fame', 14, 2008, 'Pop',3);