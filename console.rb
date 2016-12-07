require ('pry')
require_relative('album_class')
require_relative('artist_class')

artist1 = Artist.new( {'name' => 'ZZ Top'})
artist1.save()

album1 = Album.new({ 'title'=> 'Afterburner',
  'num_songs'=> 10,
  'year'=> 1985,
  'genre'=> 'rock',
  'artist_id' => artist1.id })

album1.save()

binding.pry
nil