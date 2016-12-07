#database name is music_collection
require('pg')
require_relative('artist_class')
require_relative('db/dbase')

class Album

attr_accessor :artist_id, :title, :num_songs, :year
attr_reader :id

def initialize(options)
  @id = options['id'].to_i unless options['id'].nil?
  @artist_id = options['artist_id'].to_i
  @title = options['title']
  @year = options['year'].to_i
  @num_songs = options['num_songs'].to_i
end

def save()
  sql =
  "
  INSERT INTO albums
  (title, num_songs, year, artist_id)
  VALUES
  ('#{@title}',#{@num_songs},#{@year},#{@artist_id})
  RETURNING*;
  "
  @id = DBase.run(sql)[0]['id'].to_i
end
end