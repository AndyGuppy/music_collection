#database name is music_collection
require('pg')
require_relative('artist')
require_relative('db/dbase')

class Album

attr_accessor :artist_id, :title, :num_songs
attr_reader :id

def initialize(options)
  @id = options['id'].to_i unless options['id'].nil?
  @artist_id = options['artist_id'].to_i
  @title = options['title']
  @num_songs = options['num_songs'].to_i
end


end