#database name is music_collection
require('pg')
require_relative('db/dbase')

class Artist

attr_accessor :name
attr_reader :id

def initialize(options)
  @id = options['id'].to_i unless options['id'].nil?
  @name= options['name']
end

def save()
  sql =
  "
  INSERT INTO artists
  (name)
  VALUES
  ('#{@name}')
  RETURNING*;
  "
  @id = DBase.run(sql)[0]['id'].to_i
end

def self.all()
    query = "SELECT * FROM artists;"
    artists = DBase.run(query)
    return artists.map { |artist| Artist.new(artist)}
end

def self.find(artist)
    query = "SELECT * FROM artists WHERE name = '#{artist}';"
    artists = DBase.run(query)
    return artists.map { |artist| Artist.new(artist)}
end

def self.find_by_id(artist_id)
    query = "SELECT * FROM artists WHERE id = #{artist_id};"
    artists_name = DBase.run(query)[0]['name']
    return artists_name
end

def self.find_id(artist)
    query = "SELECT id FROM artists WHERE name = '#{artist}';"
    puts query
    artists_id = DBase.run(query)[0]['id']
    puts artists_id
    return artists_id
end
end