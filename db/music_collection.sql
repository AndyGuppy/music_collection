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