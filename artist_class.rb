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


end