#database name is music_collection
require('pg')
require_relative('artist_class')
require_relative('db/dbase')

class Album

  attr_accessor :artist_id, :title, :num_songs, :year, :genre
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i unless options['id'].nil?
    @artist_id = options['artist_id'].to_i
    @title = options['title']
    @year = options['year'].to_i
    @genre = options['genre']
    @num_songs = options['num_songs'].to_i
  end

  def save()
    query =
    "
    INSERT INTO albums
    (title, num_songs, year, artist_id, genre)
    VALUES
    ('#{@title}',#{@num_songs},#{@year},#{@artist_id}, '#{@genre}')
    RETURNING*;
    "
    @id = DBase.run(query)[0]['id'].to_i
  end

  def self.find(album)
    query = "SELECT * FROM albums WHERE title = '#{album}';"
    albums = DBase.run(query)
    return albums.map { |album| Album.new(album)}
  end

  def self.find_by_artist(artist)
    artist_id = Artist.find_id(artist)
    query = "SELECT * FROM albums WHERE artist_id = #{artist_id};"
    albums = DBase.run(query)
    return albums.map { |album| Album.new(album)}
  end

  def albums()
    sql = " SELECT * FROM albums WHERE artist_id = #{@id}"
    albums = DBase.run(query)
    return albums.map { |album| Album.new(album)}
  end

  def self.delete(title)
    query =
    "DELETE FROM albums WHERE title = '#{title}';"
    DBase.run(query)
  end

  def self.delete_by_artist(artist)
    artist_id = Artist.find_id(artist).to_i
    puts artist_id
    query =
    "DELETE FROM albums WHERE artist_id = #{artist_id};"
    puts query
    DBase.run(query)
  end

  def self.update(id,title, songs, year, artist_id, genre)
    query =
    "
    UPDATE albums
    SET(title, num_songs, year, artist_id, genre) =
    ('#{title}',#{songs},#{year},#{artist_id}, '#{genre}')
    WHERE id = #{id};
    "
    DBase.run(query)
  end  

  def update()
    query =
    "
    UPDATE albums
    SET(title, num_songs, year, artist_id, genre) =
    ('#{@title}',#{@num_songs},#{@year},#{@artist_id}, '#{@genre}')
    WHERE id = #{id};
    "
    DBase.run(query)
  end

  def self.all()
    query = "SELECT * FROM albums;"
    albums = DBase.run(query)
    return albums.map { |album| Album.new(album)}
  end

end